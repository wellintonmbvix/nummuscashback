unit controller.dto.pdv_notas_fiscais_forma_pagamento.interfaces;

interface

uses
  model.pdv_notas_fiscais_forma_pagamento,

  //** ORMBr
  ormbr.types.blob,
  model.service.interfaces,
  model.service.scripts.interfaces;

type
  IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO = interface
    ['{1AE985C6-40AC-42E3-B7C0-5A224988FB54}']

    function id_pdv_notas_fiscais_forma_pagamento(value: Integer): IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO; overload;
    function id_pdv_notas_fiscais_forma_pagamento: Integer; overload;

    function id_pdv_notas_fiscais_cab(value: Integer): IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO; overload;
    function id_pdv_notas_fiscais_cab: Integer; overload;

    function id_forma_pagamento(value: Integer): IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO; overload;
    function id_forma_pagamento: Integer; overload;

    function vencimento(value: TDateTime): IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO; overload;
    function vencimento: TDateTime; overload;

    function parcela(value: Integer): IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO; overload;
    function parcela: Integer; overload;

    function total_parcelas(value: Integer): IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO; overload;
    function total_parcelas: Integer; overload;

    function valor(value: Currency): IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO; overload;
    function valor: Currency; overload;

    function tipo_cartao(value: Integer): IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO; overload;
    function tipo_cartao: Integer; overload;

    function debito(value: Integer): IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO; overload;
    function debito: Integer; overload;

    function consulta_cheque(value: Integer): IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO; overload;
    function consulta_cheque: Integer; overload;

    function taxa_financeira(value: Currency): IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO; overload;
    function taxa_financeira: Currency; overload;

    function tipo_cobranca(value: Integer): IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO; overload;
    function tipo_cobranca: Integer; overload;

    function ligar(value: Integer): IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO; overload;
    function ligar: Integer; overload;

    function avista(value: Integer): IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO; overload;
    function avista: Integer; overload;

    function marca(value: Integer): IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO; overload;
    function marca: Integer; overload;

    function bloqueado(value: Integer): IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO; overload;
    function bloqueado: Integer; overload;

    function Build: IService<TPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO>;
    function Factory: IServiceScripts;
  end;

implementation

end.
