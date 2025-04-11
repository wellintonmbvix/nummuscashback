unit controller.dto.pdv_notas_fiscais_forma_pagamento.interfaces.impl;

interface

uses
  System.SysUtils,

  model.service.interfaces,
  model.service.interfaces.impl,
  model.service.scripts.interfaces,
  model.service.scripts.interfaces.impl,
  model.pdv_notas_fiscais_forma_pagamento,

  ormbr.objects.helper,
  dbcbr.mapping.explorer,
  ormbr.json,
  ormbr.rtti.helper,

  controller.dto.pdv_notas_fiscais_forma_pagamento.interfaces;

type
  TIPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO = class(TInterfacedObject,
    IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO)
  private
    FEntity: TPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO;
    FService: IService<TPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO>;
    FServiceScripts: IServiceScripts;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO;

    function id_pdv_notas_fiscais_forma_pagamento(value: Integer)
      : IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO; overload;
    function id_pdv_notas_fiscais_forma_pagamento: Integer; overload;

    function id_pdv_notas_fiscais_cab(value: Integer)
      : IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO; overload;
    function id_pdv_notas_fiscais_cab: Integer; overload;

    function id_forma_pagamento(value: Integer)
      : IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO; overload;
    function id_forma_pagamento: Integer; overload;

    function vencimento(value: TDateTime)
      : IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO; overload;
    function vencimento: TDateTime; overload;

    function parcela(value: Integer)
      : IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO; overload;
    function parcela: Integer; overload;

    function total_parcelas(value: Integer)
      : IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO; overload;
    function total_parcelas: Integer; overload;

    function valor(value: Currency)
      : IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO; overload;
    function valor: Currency; overload;

    function tipo_cartao(value: Integer)
      : IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO; overload;
    function tipo_cartao: Integer; overload;

    function debito(value: Integer)
      : IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO; overload;
    function debito: Integer; overload;

    function consulta_cheque(value: Integer)
      : IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO; overload;
    function consulta_cheque: Integer; overload;

    function taxa_financeira(value: Currency)
      : IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO; overload;
    function taxa_financeira: Currency; overload;

    function tipo_cobranca(value: Integer)
      : IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO; overload;
    function tipo_cobranca: Integer; overload;

    function ligar(value: Integer): IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO;
      overload;
    function ligar: Integer; overload;

    function avista(value: Integer)
      : IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO; overload;
    function avista: Integer; overload;

    function marca(value: Integer): IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO;
      overload;
    function marca: Integer; overload;

    function bloqueado(value: Integer)
      : IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO; overload;
    function bloqueado: Integer; overload;

    function Build: IService<TPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO>;
    function Factory: IServiceScripts;
  end;

implementation

{ TIPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO }

function TIPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO.avista(value: Integer)
  : IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO;
begin
  Result := Self;
  FEntity.avista := value;
end;

function TIPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO.avista: Integer;
begin
  Result :=   FEntity.avista;
end;

function TIPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO.bloqueado(value: Integer)
  : IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO;
begin
  Result := Self;
  FEntity.bloqueado := value;
end;

function TIPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO.bloqueado: Integer;
begin
  Result := FEntity.bloqueado;
end;

function TIPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO.Build
  : IService<TPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO>;
begin
  Result := FService;
end;

function TIPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO.consulta_cheque(value: Integer)
  : IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO;
begin
  Result := Self;
  FEntity.consulta_cheque := value;
end;

function TIPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO.consulta_cheque: Integer;
begin
  Result := FEntity.consulta_cheque;
end;

constructor TIPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO.Create;
begin
  FEntity := TPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO.Create;
  FService := TServiceORMBr<TPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO>.New(FEntity);
  FServiceScripts := TServiceScripts.New;
end;

function TIPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO.debito(value: Integer)
  : IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO;
begin
  Result := Self;
  FEntity.debito := value;
end;

function TIPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO.debito: Integer;
begin
  Result := FEntity.debito;
end;

destructor TIPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO.Destroy;
begin
  FreeAndNil(FEntity);
  inherited;
end;

function TIPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO.Factory: IServiceScripts;
begin
  Result := FServiceScripts;
end;

function TIPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO.id_forma_pagamento(value: Integer)
  : IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO;
begin
  Result := Self;
  FEntity.id_forma_pagamento := value;
end;

function TIPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO.id_forma_pagamento: Integer;
begin
  Result := FEntity.id_forma_pagamento;
end;

function TIPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO.id_pdv_notas_fiscais_cab: Integer;
begin
  Result := FEntity.id_pdv_notas_fiscais_cab;
end;

function TIPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO.id_pdv_notas_fiscais_cab
  (value: Integer): IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO;
begin
  Result := Self;
  FEntity.id_pdv_notas_fiscais_cab := value;
end;

function TIPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO.
  id_pdv_notas_fiscais_forma_pagamento: Integer;
begin
  Result := FEntity.id_pdv_notas_fiscais_forma_pagamento;
end;

function TIPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO.
  id_pdv_notas_fiscais_forma_pagamento(value: Integer)
  : IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO;
begin
  Result := Self;
  FEntity.id_pdv_notas_fiscais_forma_pagamento := value;
end;

function TIPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO.ligar: Integer;
begin
  Result := FEntity.ligar;
end;

function TIPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO.ligar(value: Integer)
  : IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO;
begin
  Result := Self;
  FEntity.ligar := value;
end;

function TIPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO.marca(value: Integer)
  : IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO;
begin
  Result := Self;
  FEntity.marca := value;
end;

function TIPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO.marca: Integer;
begin
  Result := FEntity.marca;
end;

class function TIPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO.New
  : IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO;
begin

end;

function TIPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO.parcela(value: Integer)
  : IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO;
begin
  Result := Self;
  FEntity.parcela := value;
end;

function TIPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO.parcela: Integer;
begin
  Result := FEntity.parcela;
end;

function TIPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO.taxa_financeira: Currency;
begin
  Result := FEntity.taxa_financeira;
end;

function TIPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO.taxa_financeira(value: Currency)
  : IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO;
begin
  Result := Self;
  FEntity.taxa_financeira := value;
end;

function TIPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO.tipo_cartao: Integer;
begin
  Result := FEntity.tipo_cartao;
end;

function TIPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO.tipo_cartao(value: Integer)
  : IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO;
begin
  Result := Self;
  FEntity.tipo_cartao := value;
end;

function TIPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO.tipo_cobranca(value: Integer)
  : IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO;
begin
  Result := Self;
  FEntity.tipo_cobranca := value;
end;

function TIPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO.tipo_cobranca: Integer;
begin
  Result := FEntity.tipo_cobranca;
end;

function TIPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO.total_parcelas: Integer;
begin
  Result := FEntity.total_parcelas;
end;

function TIPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO.total_parcelas(value: Integer)
  : IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO;
begin
  Result := Self;
  FEntity.total_parcelas := value;
end;

function TIPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO.valor(value: Currency)
  : IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO;
begin
  Result := Self;
  FEntity.valor := value;
end;

function TIPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO.valor: Currency;
begin
  Result := FEntity.valor;
end;

function TIPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO.vencimento(value: TDateTime)
  : IPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO;
begin
  Result := Self;
  FEntity.vencimento := value;
end;

function TIPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO.vencimento: TDateTime;
begin
  Result := FEntity.vencimento;
end;

end.
