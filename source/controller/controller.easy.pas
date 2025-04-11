unit controller.easy;

interface

uses
  System.JSON,
  System.SysUtils,
  System.Classes,
  System.StrUtils,
  System.DateUtils,
  System.UITypes,

  Vcl.Dialogs,
  Vcl.Forms, 
  Vcl.Controls, 
  Vcl.ExtCtrls, 
  Vcl.StdCtrls,
  Vcl.Graphics,
  Vcl.Imaging.pngimage,
  Vcl.Buttons,

  Winapi.Windows,

  IdHTTP,
  REST.JSON,
  REST.Client,
  REST.Types;

const
  _URL = 'https://api.production.nummus.com.br/v1';

type
  TMessageType = (mtInformation, mtWarning, mtError);
  
  TControllerEasy = class
     class procedure ShowTemporaryMessageForm(const AMensagem: String;
      const TempoEmSegundos: Integer; const Tipo: TMessageType);
     class procedure GetCashByCustomer;
     class procedure PostSalesOnNummus;
     class procedure CancelCashBackOnNummus;
  end;

type  
  TTemporaryMessageForm = class(TForm)
  private
    FTimer: TTimer;
    FBtnClose: TSpeedButton;
    PanelBtnClose: TPanel;
    procedure OnTimerEvent(Sender: TObject);
    procedure OnBtnCloseClickEvent(Sender: TObject);
    procedure OnBtnCloseMouseEnterEvent(Sender: TObject);
    procedure OnBtnCloseMouseLeaverEvent(Sender: TObject);
    procedure LoadIconFromResource(const ResName: string; Image: TImage);
    procedure CreateWnd; override;
  public
    constructor CreateTemporary(const AMensagem: string; TempoEmSegundos: Integer; Tipo: TMessageType);
  end;

implementation

{ TControllerEasy }

class procedure TControllerEasy.CancelCashBackOnNummus;
var
  arqText: TextFile;
  sLista: TStringList;
  restClient: TRESTClient;
  restResponse: TRESTResponse;
  restRequest: TRESTRequest;
  oJson, oJsonResp: TJSONObject;
  api_key,
  client_id,
  id_cashback,
  descricao,
  linha: String;
begin
  if FileExists('C:\CashbackNummus\req.001') then
    begin
      sLista := nil;

      Try
        Try
          oJson := TJSONObject.Create;
          restClient := TRESTClient.Create(nil);
          restResponse := TRESTResponse.Create(nil);
          restRequest := TRESTRequest.Create(nil);
          sLista := TStringList.Create;
          sLista.Delimiter := '|';
          sLista.StrictDelimiter := True;

          AssignFile(arqText, 'C:\CashbackNummus\req.001');
          Reset(arqText);

          try
            while not Eof(arqText) do
              begin
                ReadLn(arqText, linha);
                sLista.DelimitedText := linha;

                case sLista[0].ToInteger of
                  0:
                    begin
                      api_key := sLista[1];
                      client_id := sLista[2];
                    end;
                  9:
                    begin
                     id_cashback := sLista[6];
                     oJson.AddPair('reason', TJSONString.Create(sLista[7]));
                    end;
                end;
              end;
          finally
            CloseFile(arqText);
            DeleteFile('C:\CashbackNummus\req.001');
          end;

          restClient.BaseURL := _URL;
          restRequest.Client := restClient;
          restRequest.Method := TRESTRequestMethod.rmPUT;
          restRequest.Response := restResponse;
          restRequest.Timeout := 4000;
          restRequest.Resource := '/cashback/'+id_cashback+'/cancel';

          restRequest.Params.Clear;
          restRequest.AddParameter('Content-Type', 'application/json', pkHTTPHEADER, [poDoNotEncode]);
          restRequest.AddParameter('Accept', 'application/json', pkHTTPHEADER, [poDoNotEncode]);
          restRequest.AddParameter('x-api-key', api_key, pkHTTPHEADER, [poDoNotEncode]);
          restRequest.AddParameter('x-client-id', client_id, pkHTTPHEADER, [poDoNotEncode]);

          restRequest.AddBody(oJson.ToJSON, TRESTContentType.ctAPPLICATION_JSON);

          Try
            restRequest.Execute;

            if not restResponse.Status.Success then
            begin
              ShowTemporaryMessageForm('Erro ' + restResponse.StatusCode.ToString + ': ' + restResponse.Content, 3, mtError);
              Application.Terminate;
            end;

          Except
            on E: Exception do
            begin
              ShowTemporaryMessageForm('Erro de comunicação: ' + E.Message, 3, mtError);
              Application.Terminate;
            end;
          End;

          ForceDirectories('C:\CashBackNummus');
          if FileExists('C:\CashBackNummus\resp.001') then
            DeleteFile('C:\CashBackNummus\resp.001');

          oJsonResp := TJSONObject(restResponse.JSONValue);

          if (restResponse.StatusCode = 200) Or
            (restResponse.StatusCode = 422) Or
            (restResponse.StatusCode = 500) then
              begin
                AssignFile(arqText,'C:\CashBackNummus\resp.001');
                ReWrite(arqText);
                WriteLn(arqText, 'status_code: ' +
                  restResponse.StatusCode.ToString);
                WriteLn(arqText, 'message: ' +
                  oJsonResp.GetValue<String>('message'));
                CloseFile(arqText);
              end
            else
              begin
                ShowTemporaryMessageForm(oJsonResp.GetValue<String>('message'), 3, mtError);
                AssignFile(arqText,'C:\CashBackNummus\resp.001');
                ReWrite(arqText);
                WriteLn(arqText, 'status_code: ' +
                  restResponse.StatusCode.ToString);
                WriteLn(arqText, 'message: ' +
                  oJsonResp.GetValue<String>('message'));
                CloseFile(arqText);
                Application.Terminate;
              end;

        Except
          on E: Exception do
          begin
            ShowTemporaryMessageForm('Erro inesperado: ' + E.Message, 3,
              mtError);
            Application.Terminate;
          end;
        end;
      Finally
        if Assigned(sLista) then sLista.Free;
        if Assigned(restClient) then restClient.Free;
        if Assigned(restResponse) then restResponse.Free;
        if Assigned(restRequest) then restRequest.Free;
        if Assigned(oJson) then oJson.Free;
      End;
    end;
  Application.Terminate;
end;

class procedure TControllerEasy.GetCashByCustomer;
var
  arqText: TextFile;
  sLista: TStringList;
  restClient: TRESTClient;
  restResponse: TRESTResponse;
  restRequest: TRESTRequest;
  oJson, oJsonResp: TJSONObject;
  api_key,
  client_id,
  linha: String;
begin
  if FileExists('C:\CashbackNummus\req.001') then
    begin
      sLista := nil;

      Try
        Try
          oJson := TJSONObject.Create;
          restClient := TRESTClient.Create(nil);
          restResponse := TRESTResponse.Create(nil);
          restRequest := TRESTRequest.Create(nil);
          sLista := TStringList.Create;
          sLista.Delimiter := '|';
          sLista.StrictDelimiter := True;

          AssignFile(arqText, 'C:\CashbackNummus\req.001');
          Reset(arqText);

          try
            while not Eof(arqText) do
              begin
                ReadLn(arqText, linha);
                sLista.DelimitedText := linha;

                case sLista[0].ToInteger of
                  0:
                    begin
                      api_key := sLista[1];
                      client_id := sLista[2];
                    end;
                  1:
                    begin
                      oJson.AddPair('document_number', TJSONString.Create(sLista[6]));
                    end;
                  4:
                    begin
                      oJson.AddPair('value_purchase', TJSONNumber.Create(sLista[1].Replace(',','.')));
                    end;
                end;
              end;
          finally
            CloseFile(arqText);
            DeleteFile('C:\CashbackNummus\req.001');
          end;

          restClient.BaseURL := _URL;
          restRequest.Client := restClient;
          restRequest.Method := TRESTRequestMethod.rmPOST;
          restRequest.Response := restResponse;
          restRequest.Timeout := 4000;
          restRequest.Resource := '/cashback/simulation';

          restRequest.Params.Clear;
          restRequest.AddParameter('Content-Type', 'application/json', pkHTTPHEADER, [poDoNotEncode]);
          restRequest.AddParameter('Accept', 'application/json', pkHTTPHEADER, [poDoNotEncode]);
          restRequest.AddParameter('x-api-key', api_key, pkHTTPHEADER, [poDoNotEncode]);
          restRequest.AddParameter('x-client-id', client_id, pkHTTPHEADER, [poDoNotEncode]);

          restRequest.AddBody(oJson.ToJSON, TRESTContentType.ctAPPLICATION_JSON);

          Try
            restRequest.Execute;

            if not restResponse.Status.Success then
            begin
              ShowTemporaryMessageForm('Erro ' +
                restResponse.StatusCode.ToString + ': ' +
                  restResponse.Content, 3, mtError);
              Exit;
            end;

          Except
            on E: Exception do
            begin
              ShowTemporaryMessageForm('Erro de comunicação: ' + E.Message, 3, mtError);
            end;
          End;

          ForceDirectories('C:\CashBackNummus');
          if FileExists('C:\CashBackNummus\resp.001') then
            DeleteFile('C:\CashBackNummus\resp.001');

          oJsonResp := TJSONObject(restResponse.JSONValue);

          if restResponse.StatusCode = 200 then
            begin
              AssignFile(arqText,'C:\CashBackNummus\resp.001');
              ReWrite(arqText);
              WriteLn(arqText, 'status_code: ' +
                restResponse.StatusCode.ToString);
              WriteLn(arqText, 'amount: ' +
                oJsonResp.GetValue<Currency>('amount').ToString);
              WriteLn(arqText, 'rescue_available: ' +
                oJsonResp.GetValue<Currency>('rescue_available').ToString);
              CloseFile(arqText);
            end
          else if (restResponse.StatusCode = 422) Or
            (restResponse.StatusCode = 500) then
              begin
                AssignFile(arqText,'C:\CashBackNummus\resp.001');
                ReWrite(arqText);
                WriteLn(arqText, 'status_code: ' +
                  restResponse.StatusCode.ToString);
                WriteLn(arqText, 'message: ' +
                  oJsonResp.GetValue<String>('message'));
                CloseFile(arqText);
              end
            else
              begin
                ShowTemporaryMessageForm(oJsonResp.GetValue<String>('message'), 3, mtError);
              end;

        Except
          on E: Exception do
          begin
            ShowTemporaryMessageForm('Erro inesperado: ' + E.Message, 3,
              mtError);
          end;
        end;
      Finally
        if Assigned(sLista) then sLista.Free;
        if Assigned(restClient) then restClient.Free;
        if Assigned(restResponse) then restResponse.Free;
        if Assigned(restRequest) then restRequest.Free;
        if Assigned(oJson) then oJson.Free;
      End;
    end;
  Application.Terminate;
end;

class procedure TControllerEasy.PostSalesOnNummus;
var
  arqText: TextFile;
  sLista: TStringList;
  api_key,
  client_id,
  linha: String;
  oJson,
  oJsonResp,
  oCustomer,
  oSeller,
  oItens: TJSONObject;
  aItens: TJSONArray;
  restClient: TRESTClient;
  restResponse: TRESTResponse;
  restRequest: TRESTRequest;  
begin
 if FileExists('C:\CashbackNummus\req.001') then
  begin
    oJson := nil;
    oCustomer := nil;
    oSeller := nil;
    aItens := nil;
    sLista := nil;

    Try
      Try
        oJson := TJSONObject.Create;
        oCustomer := TJSONObject.Create;
        oSeller := TJSONObject.Create;
        aItens := TJSONArray.Create;
        sLista := TStringList.Create;
        sLista.Delimiter := '|';
        sLista.StrictDelimiter := True;

        AssignFile(arqText, 'C:\CashbackNummus\req.001');
        Reset(arqText);
        try
          while not Eof(arqText) do
          begin
            ReadLn(arqText, linha);
            sLista.DelimitedText := linha;

            case sLista[0].ToInteger of
              0:
                begin
                  api_key := sLista[1];
                  client_id := sLista[2];
                end;
              1:  // Informações do cliente
                begin
                  oCustomer.AddPair('name', TJSONString.Create(sLista[1]));
                  oCustomer.AddPair('email', TJSONString.Create(sLista[2]));
                  oCustomer.AddPair('phone', TJSONString.Create(sLista[3]));
                  oCustomer.AddPair('birth_date', 
                    TJSONString.Create(FormatDateTime('YYYY-mm-dd', 
                      StrToDate(sLista[4]))));
                  oCustomer.AddPair('gender', TJSONString.Create(sLista[5]));
                  oCustomer.AddPair('document_number', 
                    TJSONString.Create(sLista[6]));
                end;
              2:  // Informações do(a) vendedor(a)
                begin
                  oSeller.AddPair('name', TJSONString.Create(sLista[1]));
                  oSeller.AddPair('email', TJSONString.Create(sLista[2]));
                  oSeller.AddPair('document_number', TJSONString.Create(sLista[3]));
                  oSeller.AddPair('phone', TJSONString.Create(sLista[4]));
                  oSeller.AddPair('birth_date', 
                    TJSONString.Create(FormatDateTime('YYYY-mm-dd', 
                      StrToDate(sLista[5]))));
                  oSeller.AddPair('gender', TJSONString.Create(sLista[6]));
                end;
              3:  // Informações do(s) produto(s)
                begin
                  oItens := TJSONObject.Create;
                  oItens.AddPair('name', TJSONString.Create(sLista[1]));
                  oItens.AddPair('identifier', TJSONString.Create(sLista[2]));
                  oItens.AddPair('value_purchase', 
                    TJSONNumber.Create(sLista[3].Replace(',', '.')));
                  aItens.AddElement(oItens);
                end;
              9:  // Informações do cupom/ticket
                begin
                  oJson.AddPair('customer', oCustomer);
                  oJson.AddPair('seller', oSeller);
                  oJson.AddPair('products', aItens);
                  oJson.AddPair('ticket_number', TJSONString.Create(sLista[1]));
                  oJson.AddPair('value_rescue', 
                    TJSONNumber.Create(sLista[2].Replace(',', '.')));
                  oJson.AddPair('value_discount', 
                    TJSONNumber.Create(sLista[3].Replace(',', '.')));
                  oJson.AddPair('description_purchase', 
                    TJSONString.Create(sLista[4]));
                  oJson.AddPair('dh_launch', TJSONString.Create(sLista[5]));
                end;
            end;
          end;
        finally
          CloseFile(arqText);
          DeleteFile('C:\CashbackNummus\req.001');
        end;

        restClient := TRESTClient.Create(nil);
        restResponse := TRESTResponse.Create(nil);
        restRequest := TRESTRequest.Create(nil);

        restClient.BaseURL := _URL;
        restRequest.Client := restClient;
        restRequest.Method := TRESTRequestMethod.rmPOST;
        restRequest.Response := restResponse;
        restRequest.Timeout := 4000;
        restRequest.Resource := '/cashback';

        restRequest.Params.Clear;
        restRequest.AddParameter('Content-Type', 'application/json', 
          pkHTTPHEADER, [poDoNotEncode]);
        restRequest.AddParameter('Accept', 'application/json', 
          pkHTTPHEADER, [poDoNotEncode]);
        restRequest.AddParameter('x-api-key', api_key, 
          pkHTTPHEADER, [poDoNotEncode]);
        restRequest.AddParameter('x-client-id', client_id, 
          pkHTTPHEADER, [poDoNotEncode]);

        restRequest.AddBody(oJson.ToJSON, TRESTContentType.ctAPPLICATION_JSON);      

        Try
          restRequest.Execute;

          if not restResponse.Status.Success then
          begin
            ShowTemporaryMessageForm('Erro ' + 
              restResponse.StatusCode.ToString + ': ' + 
                restResponse.Content, 3, mtError);
            Exit;
          end;

        Except
          on E: Exception do
          begin
            ShowTemporaryMessageForm('Erro de comunicação: ' + 
              E.Message, 3, mtError);
          end;
        End;

        ForceDirectories('C:\CashBackNummus');
        if FileExists('C:\CashBackNummus\resp.001') then
          DeleteFile('C:\CashBackNummus\resp.001');

        oJsonResp := TJSONObject(restResponse.JSONValue);

        if restResponse.StatusCode = 200 then
          begin
            AssignFile(arqText,'C:\CashBackNummus\resp.001');
            ReWrite(arqText);
            WriteLn(arqText, 'status_code: ' + 
              restResponse.StatusCode.ToString);
            WriteLn(arqText, 'id_cashback: ' + 
              oJsonResp.GetValue<String>('id'));
            CloseFile(arqText);
          end
        else if (restResponse.StatusCode = 422) Or
          (restResponse.StatusCode = 500) then
            begin
              AssignFile(arqText,'C:\CashBackNummus\resp.001');
              ReWrite(arqText);
              WriteLn(arqText, 'status_code: ' + 
                restResponse.StatusCode.ToString);
              WriteLn(arqText, 'message: ' + 
                oJsonResp.GetValue<String>('message'));
              CloseFile(arqText);
            end
          else
            begin
              ShowTemporaryMessageForm(oJson.GetValue<String>('message'), 3,
                mtError);
            end;      
      Except
        on E: Exception do
        begin
          ShowTemporaryMessageForm('Erro inesperado: ' + E.Message, 3,
            mtError);
        end;
      end;
    Finally
      if Assigned(sLista) then sLista.Free;
      if Assigned(restClient) then restClient.Free;
      if Assigned(restResponse) then restResponse.Free;
      if Assigned(restRequest) then restRequest.Free;
      if Assigned(oJson) then oJson.Free;
    end;
  end;
  Application.Terminate;
end;

class procedure TControllerEasy.ShowTemporaryMessageForm(const AMensagem: string;
  const TempoEmSegundos: Integer; const Tipo: TMessageType);
var
  Form: TTemporaryMessageForm;
begin
  Form := TTemporaryMessageForm.CreateTemporary(AMensagem, TempoEmSegundos, Tipo);
  try
    Form.ShowModal;
  finally
    Form.Free;
  end;
end;

{$R Icons.res}

{ TTemporaryMessageForm }

constructor TTemporaryMessageForm.CreateTemporary(const AMensagem: string;
  TempoEmSegundos: Integer; Tipo: TMessageType);
var
  Panel,
  PanelTitle,
  PanelContext: TPanel;
  Img: TImage;
  MsgLabel: TLabel;
  IconName: string;
begin
  inherited CreateNew(nil);

  // Form config
  BorderStyle := bsNone;
  Position := poScreenCenter;
  Width := 600;
  Height := 100;
  Color := clWhite;
  DoubleBuffered := True;

  // Painel principal
  Panel := TPanel.Create(Self);
  Panel.Parent := Self;
  Panel.Align := alClient;
  Panel.Caption := '';
  Panel.ParentBackground := False;
  Panel.BevelOuter := bvNone;
  Panel.Padding.SetBounds(0, 0, 0, 0);

  // Painel titulo
  PanelTitle := TPanel.Create(Self);
  PanelTitle.Parent := Panel;
  PanelTitle.Align := alTop;
  PanelTitle.Caption := 'CashBack Nummus';
  PanelTitle.Height := 24;
  PanelTitle.ParentBackground := False;
  PanelTitle.BevelOuter := bvNone;
  PanelTitle.Padding.SetBounds(0, 0, 1, 0);
  PanelTitle.Font.Color := clWhite;
  PanelTitle.Font.Style := [fsBold];

  // Painel contexto
  PanelContext := TPanel.Create(Self);
  PanelContext.Parent := Panel;
  PanelContext.Align := alClient;
  PanelContext.Caption := '';
  PanelContext.ParentBackground := False;
  PanelContext.BevelOuter := bvNone;
  PanelContext.Padding.SetBounds(3, 3, 3, 3);

  // Painel botão fechar
  PanelBtnClose := TPanel.Create(Self);
  PanelBtnClose.Parent := PanelTitle;
  PanelBtnClose.Align := alRight;
  PanelBtnClose.Caption := '';
  PanelBtnClose.ParentBackground := False;
  PanelBtnClose.BevelOuter := bvNone;
  PanelBtnClose.Color := clRed;
  PanelBtnClose.Width := 24;

  // Image
  Img := TImage.Create(Self);
  Img.Parent := PanelContext;
  Img.Align := alLeft;
  Img.Width := 64;
  //Img.Margins.Right := 16;
  Img.Stretch := True;
  Img.Proportional := True;
  Img.Margins.SetBounds(16, 3, 3, 3);

  // Mensagem
  MsgLabel := TLabel.Create(Self);
  MsgLabel.Parent := PanelContext;
  MsgLabel.Align := alClient;
  MsgLabel.WordWrap := True;
  MsgLabel.Layout := tlCenter;
  MsgLabel.Font.Size := 12;
  MsgLabel.Font.Style := [fsBold];
  MsgLabel.Transparent := True;
  MsgLabel.Caption := '   ' + AMensagem;

  FBtnClose := TSpeedButton.Create(Self);
  FBtnClose.Parent := PanelBtnClose;
  FBtnClose.Align := alClient;
  FBtnClose.Flat := True;
  FBtnClose.StyleElements := [seBorder];
  FBtnClose.Caption := 'X';
  FBtnClose.Font.Size := 12;
  FBtnClose.Font.Color := clWhite;
  FBtnClose.Font.Name := 'Roboto';
  FBtnClose.Font.Quality := fqAntialiased;
  FBtnClose.Font.Style := [fsBold];
  FBtnClose.Cursor := crHandPoint;
  FBtnClose.OnClick := OnBtnCloseClickEvent;
  FBtnClose.OnMouseEnter := OnBtnCloseMouseEnterEvent;
  FBtnClose.OnMouseLeave := OnBtnCloseMouseLeaverEvent;

  // Define aparência e imagem
  case Tipo of
    mtInformation:
      begin
//        Panel.Color := $00D8EFFB; // Azul claro
        PanelContext.Color := $FFE5CC;
        PanelTitle.Color := $854000;
        MsgLabel.Font.Color := $854000;
        IconName := 'INFO_ICON';
      end;
    mtWarning:
      begin
//        Panel.Color := $00FFF6D8; // Amarelo claro
        PanelContext.Color := $CDF3FF;
        PanelTitle.Color := $0464A3;
        MsgLabel.Font.Color := $0464A3;
        IconName := 'WARNING_ICON';
      end;
    mtError:
      begin
//        Panel.Color := $00FBD8D8; // Vermelho claro
        PanelContext.Color := $DAD7F8;
        PanelTitle.Color := $241C97;
        MsgLabel.Font.Color := $241C97;
        IconName := 'ERROR_ICON';
      end;
  end;

  LoadIconFromResource(IconName, Img);

  // Timer
  FTimer := TTimer.Create(Self);
  FTimer.Interval := TempoEmSegundos * 1000;
  FTimer.OnTimer := OnTimerEvent;
  FTimer.Enabled := True;
end;

procedure TTemporaryMessageForm.CreateWnd;
var
  Rgn: HRGN;
  Radius: Integer;
begin
  inherited CreateWnd;

  // Arredondar cantos
  Radius := 20;
  Rgn := CreateRoundRectRgn(0, 0, Width, Height, Radius, Radius);
  SetWindowRgn(Handle, Rgn, True);

  // Sombra (disponível em temas Windows)
  SetClassLongPtr(Handle, GCL_STYLE,
    GetClassLongPtr(Handle, GCL_STYLE) or CS_DROPSHADOW);
end;

procedure TTemporaryMessageForm.LoadIconFromResource(const ResName: string;
  Image: TImage);
var
  ResStream: TResourceStream;
  Png: TPngImage;
begin
  ResStream := TResourceStream.Create(HInstance, ResName, RT_RCDATA);
  try
    Png := TPngImage.Create;
    try
      Png.LoadFromStream(ResStream);
      Image.Picture.Assign(Png);
    finally
      Png.Free;
    end;
  finally
    ResStream.Free;
  end;
end;

procedure TTemporaryMessageForm.OnBtnCloseClickEvent(Sender: TObject);
begin
  Close;
end;

procedure TTemporaryMessageForm.OnBtnCloseMouseEnterEvent(Sender: TObject);
begin
  PanelBtnClose.Color := $241C97;
end;

procedure TTemporaryMessageForm.OnBtnCloseMouseLeaverEvent(Sender: TObject);
begin
  PanelBtnClose.Color := clRed;
end;

procedure TTemporaryMessageForm.OnTimerEvent(Sender: TObject);
begin
  FTimer.Enabled := False;
  Close;
end;

end.
