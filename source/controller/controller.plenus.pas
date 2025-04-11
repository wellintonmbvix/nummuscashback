unit controller.plenus;

// *** Momentaneamente este controller suas procedures não estão sendo
// *** utilizado por ter feito o processo diretamente no código do Plenus

interface

uses
  System.JSON,
  System.SysUtils,
  System.Generics.Collections,

  Vcl.Forms,
  Winapi.Windows,

  IdHTTP,
  REST.JSON,
  REST.Client,
  REST.Types,

  model.pdv_notas_fiscais_cab,
  model.pdv_notas_fiscais_item,
  model.pdv_notas_fiscais_forma_pagamento,
  model.parametros,

  controller.dto.pdv_notas_fiscais_cab.interfaces,
  controller.dto.pdv_notas_fiscais_cab.interfaces.impl,
  controller.dto.pdv_notas_fiscais_forma_pagamento.interfaces,
  controller.dto.pdv_notas_fiscais_forma_pagamento.interfaces.impl,
  controller.dto.parametros.interfaces,
  controller.dto.parametros.interfaces.impl;

const
  _URL = 'https://api.production.nummus.com.br/v1';

type
  TControllerPlenus = class
    class procedure PostSalesOnNummus(ticket: Integer);
    class procedure GetCashByCustomer(id_empresa: Integer;
      id_nummus: String = ''; document: String = ''; phone: String = '';
      value_purchase: Currency = 0);
    class procedure UseCashBack(ticket: Integer);
  end;

implementation

uses
  FireDAC.Comp.Client;

{ TControllerPlenus }

class procedure TControllerPlenus.GetCashByCustomer(id_empresa: Integer;
  id_nummus, document, phone: String; value_purchase: Currency);
var
  restClient: TRESTClient;
  restResponse: TRESTResponse;
  restRequest: TRESTRequest;
  oJson: TJSONObject;
  parametros: TObjectList<TPARAMETROS>;
begin
  if (id_nummus.Trim.Length = 0) And (document.Trim.Length = 0) And
    (phone.Trim.Length = 0) And (value_purchase = 0) then
  begin
    Application.MessageBox('Nenhum parâmetro de consulta foi informado',
      'Gera Nummus', mb_ok + mb_iconerror);
    Exit;
  end;
  oJson := TJSONObject.Create;
  if (id_nummus.Trim.Length > 0) then
    oJson.AddPair('customer_id', id_nummus);

  if (document.Trim.Length > 0) then
    oJson.AddPair('document_number', document);

  if (phone.Trim.Length > 0) then
    oJson.AddPair('phone', phone);

  if (value_purchase > 0) then
    oJson.AddPair('value_purchase', value_purchase);

  restClient := TRESTClient.Create(nil);
  restResponse := TRESTResponse.Create(nil);
  restRequest := TRESTRequest.Create(nil);
  Try
    var
    IPARAMETRO := TIPARAMETRO.New;
    IPARAMETRO.Build.ListAll('ID_EMPRESA = ' + id_empresa.ToString(),
      parametros, '');

    restClient.BaseURL := _URL;
    restRequest.Client := restClient;
    restRequest.AddParameter('Content-Type', 'application/json',
      TRESTRequestParameterKind.pkHTTPHEADER, [poDoNotEncode]);
    restRequest.AddParameter('Accept', 'application/json',
      TRESTRequestParameterKind.pkHTTPHEADER, [poDoNotEncode]);
    restRequest.AddParameter('x-api-key', parametros.Last.api_key_nummus.Value,
      TRESTRequestParameterKind.pkHTTPHEADER, [poDoNotEncode]);
    restRequest.AddParameter('x-client-id',
      parametros.Last.client_id_nummus.Value,
      TRESTRequestParameterKind.pkHTTPHEADER, [poDoNotEncode]);
    restRequest.Response := restResponse;
    restRequest.Timeout := 4000;
    restRequest.Resource := '/cashback/simulation';
    restRequest.AddBody(oJson.ToJSON);

    Try
      restRequest.Execute;
    Except
      on e: EIdHTTPProtocolException do
      begin
        Application.MessageBox(PWideChar(e.Message), 'Gera Nummus',
          mb_iconerror + mb_ok);
      end;
    End;

    ForceDirectories('C:\CSSISTEMAS\Plenus\arquivos\Cashback');
    if restResponse.StatusCode = 200 then
    begin
      var
        arqText: TextFile;
      AssignFile(arqText,
        'C:\CSSISTEMAS\Plenus\Integracao\Cashback\cashback_available.json');
      ReWrite(arqText);
      WriteLn(arqText, restResponse.JSONValue.Value);
      CloseFile(arqText);
    end
    else
    begin
      var
        arqText: TextFile;
      AssignFile(arqText,
        'C:\CSSISTEMAS\Plenus\Integracao\Cashback\cashback_available.json');
      ReWrite(arqText);
      WriteLn(arqText, '{"amount": 0, "rescue_available": 0}');
      CloseFile(arqText);
    end;

  Finally
    if Assigned(restClient) then
      restClient.Free;
    if Assigned(restResponse) then
      restResponse.Free;
    if Assigned(restRequest) then
      restRequest.Free;
    if Assigned(parametros) then
      parametros.Free;
    if Assigned(oJson) then
      oJson.Free;
  End;
end;

class procedure TControllerPlenus.PostSalesOnNummus(ticket: Integer);
var
  PDV_NOTA_CABS: TObjectList<TPDV_NOTAS_FISCAIS_CAB>;
  PDV_NOTA_ITEM: TPDV_NOTAS_FISCAIS_ITEM;
  PDV_NOTA_PAGTO: TPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO;
  parametros: TObjectList<TPARAMETROS>;
  oJson, oCustomer, oProduct: TJSONObject;
  aJson: TJSONArray;
  fdmtb: TFDMemTable;
  restClient: TRESTClient;
  restResponse: TRESTResponse;
  restRequest: TRESTRequest;
begin
  var
  IPDV := TIPDV_NOTAS_FISCAIS_CAB.New;
  IPDV.Build.ListAll('codigo = ' + ticket.ToString() +
    ' AND CAST(DT_EMISSAO AS DATE) = CAST(SYSDATETIME() AS DATE) ',
    PDV_NOTA_CABS, '');
  Try
    if PDV_NOTA_CABS.Count > 0 then
    begin
      oJson := TJSONObject.Create;
      With PDV_NOTA_CABS.Last Do
      begin
        var
        IPARAMETRO := TIPARAMETRO.New;
        IPARAMETRO.Build.ListAll('ID_EMPRESA = ' + id_empresa.ToString(),
          parametros, '');
        fdmtb := TFDMemTable.Create(nil);
        try
          IPDV.Factory.view_cadcliente('ID_CLIENTE = ' + id_cli_for, fdmtb);

          // Criando o objeto "customer"
          oCustomer := TJSONObject.Create;
          oCustomer.AddPair('name', TJSONString.Create(fdmtb.FieldByName('nome')
            .AsString));
          oCustomer.AddPair('email',
            TJSONString.Create(fdmtb.FieldByName('email').AsString));
          oCustomer.AddPair('phone',
            TJSONString.Create(fdmtb.FieldByName('telefone').AsString));
          oCustomer.AddPair('document_number',
            TJSONString.Create(fdmtb.FieldByName('cpfcnpj').AsString));

          // Adicionando o objeto "customer" ao JSON principal
          oJson.AddPair('customer', oCustomer);
        finally
          fdmtb.Free;
        end;

        // Criando o array "products"
        aJson := TJSONArray.Create;
        for PDV_NOTA_ITEM In pdv_notas_fiscais_item do
        begin
          oProduct := TJSONObject.Create;
          oProduct.AddPair('name',
            TJSONString.Create(PDV_NOTA_ITEM.descricao.Value));
          oProduct.AddPair('identifier',
            TJSONString.Create(PDV_NOTA_ITEM.REFID.Value));
          oProduct.AddPair('value_purchase',
            TJSONNumber.Create(PDV_NOTA_ITEM.total_liquido));

          aJson.AddElement(oProduct);
        end;
        oJson.AddPair('products', aJson);

        // Adicionando informações de ticket e valores
        oJson.AddPair('ticket_number', TJSONNumber.Create(codigo));
        oJson.AddPair('value_discount', TJSONNumber.Create(total_desconto));

        // Adicionando "value_rescue" apenas se houver um pagamento com CASHBACK
        for PDV_NOTA_PAGTO In pdv_notas_fiscais_forma_pagamento do
        begin
          if PDV_NOTA_PAGTO.TIPO_PAGAMENTO = 'CASHBACK' then
          begin
            oJson.AddPair('value_rescue',
              TJSONNumber.Create(PDV_NOTA_PAGTO.valor));
            Break; // Evita adicionar múltiplas vezes
          end;
        end;
        oJson.AddPair('dh_launch',
          TJSONString.Create(FormatDateTime('YYYY-MM-DD HH:mm:ss',
          dt_emissao)));
      end;

      restClient := TRESTClient.Create(nil);
      restClient.BaseURL := _URL;

      restResponse := TRESTResponse.Create(nil);
      restRequest := TRESTRequest.Create(nil);
      restRequest.Client := restClient;
      restRequest.AddParameter('Content-Type', 'application/json',
        TRESTRequestParameterKind.pkHTTPHEADER, [poDoNotEncode]);
      restRequest.AddParameter('Accept', 'application/json',
        TRESTRequestParameterKind.pkHTTPHEADER, [poDoNotEncode]);
      restRequest.AddParameter('x-api-key',
        parametros.Last.api_key_nummus.Value,
        TRESTRequestParameterKind.pkHTTPHEADER, [poDoNotEncode]);
      restRequest.AddParameter('x-client-id',
        parametros.Last.client_id_nummus.Value,
        TRESTRequestParameterKind.pkHTTPHEADER, [poDoNotEncode]);
      restRequest.Response := restResponse;
      restRequest.Timeout := 4000;
      restRequest.Resource := '/cashback';
      restRequest.AddBody(oJson.ToJSON);

      Try
        restRequest.Execute;
      Except
        on e: EIdHTTPProtocolException do
        begin
          Application.MessageBox(PWideChar(e.Message), 'Gera Nummus',
            mb_iconerror + mb_ok);
        end;
      End;
    end;
  Finally
    if Assigned(restClient) then
      restClient.Free;
    if Assigned(restResponse) then
      restResponse.Free;
    if Assigned(restRequest) then
      restRequest.Free;
    if Assigned(PDV_NOTA_CABS) then
      PDV_NOTA_CABS.Free;
    if Assigned(parametros) then
      parametros.Free;
    if Assigned(oJson) then
      oJson.Free;
  End;
end;

class procedure TControllerPlenus.UseCashBack(ticket: Integer);
var
  PDV_NOTAS_CABS: TObjectList<TPDV_NOTAS_FISCAIS_CAB>;
begin
  var
  IPDV_NOTAS_CABS := TIPDV_NOTAS_FISCAIS_CAB.New;
  IPDV_NOTAS_CABS.Build.ListAll('codigo = ' + ticket.ToString, PDV_NOTAS_CABS, '');

  Try
    Try
      if PDV_NOTAS_CABS.Count > 0 then
        begin
          var
          IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO := TIPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO.New;

          IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO
            .id_pdv_notas_fiscais_cab(PDV_NOTAS_CABS.Last.id_pdv_notas_fiscais_cab)
            .id_forma_pagamento(20)
            .vencimento(now())
            .parcela(0)
            .total_parcelas(0)
            .valor(0) // pegar valor do arquivo json criado no método "GetCashByCustomer"
            .tipo_cartao(0)
            .debito(0)
            .consulta_cheque(0)
            .taxa_financeira(0)
            .tipo_cobranca(0)
            .ligar(0)
            .avista(0)
            .marca(0)
            .bloqueado(0)
          .Build.Insert;
        end;
    Except
      on e: Exception do
        raise Exception.Create(e.Message);
    End;
  Finally
    FreeAndNil(PDV_NOTAS_CABS);
  End;
end;

end.
