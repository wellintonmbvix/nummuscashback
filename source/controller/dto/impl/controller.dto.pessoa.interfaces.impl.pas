unit controller.dto.pessoa.interfaces.impl;

interface

uses
  System.SysUtils,
  System.Generics.Collections,

  controller.dto.pessoa.interfaces,
  ormbr.objects.helper,
  dbcbr.mapping.explorer,
  ormbr.json,
  ormbr.rtti.helper,

  model.service.interfaces.impl,
  model.service.interfaces,
  model.pessoa,
  model.pessoaFisica,
  model.pessoaJuridica,
//  model.empresa,
  model.colaborador,
  model.endereco,
  model.contato;

type
  TIPESSOA = class(TInterfacedObject, IPESSOA)
  private
    FEntity: Tpessoa;
    FService: IService<Tpessoa>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IPESSOA;

    function id_pessoa(Value: Integer): IPESSOA; overload;
    function id_pessoa: Integer; overload;

    function nome(Value: String): IPESSOA; overload;
    function nome: String; overload;

    function abreviado(Value: String): IPESSOA; overload;
    function abreviado: String; overload;

    function tipo(Value: String): IPESSOA; overload;
    function tipo: String; overload;

    function site(Value: String): IPESSOA; overload;
    function site: String; overload;

    function suframa(Value: String): IPESSOA; overload;
    function suframa: String; overload;

//    function dt_inc(Value: TDateTime): IPESSOA; overload;
//    function dt_inc: TDateTime; overload;
//
//    function dt_alt(Value: TDateTime): IPESSOA; overload;
//    function dt_alt: TDateTime; overload;
//
//    function dt_hab(Value: TDateTime): IPESSOA; overload;
//    function dt_hab: TDateTime; overload;

    function pessoa_fisica(Value: TObjectList<Tpessoa_fisica>): IPESSOA; overload;
    function pessoa_fisica: TObjectList<Tpessoa_fisica>; overload;

    function pessoa_juridica(Value: TObjectList<Tpessoa_juridica>): IPESSOA; overload;
    function pessoa_juridica: TObjectList<Tpessoa_juridica>; overload;

    function COLABORADOR(value: Tcolaborador): IPESSOA; overload;
    function COLABORADOR: Tcolaborador; overload;

    function ENDERECO(value: Tendereco): IPESSOA; overload;
    function ENDERECO: Tendereco; overload;

//    function empresa(Value: TObjectList<Tempresa>): IPESSOA; overload;
//    function empresa: TObjectList<Tempresa>; overload;

    function contato(Value: TObjectList<Tcontato>): IPESSOA; overload;
    function contato: TObjectList<Tcontato>; overload;

    function AdicionarContato(nIdPesoa: Integer; aNome: String;
      tipoTel: Integer; aTelefone: String; tipoEmail: Integer; aEmail: String): IPESSOA;

    function Build: IService<Tpessoa>;
  end;

implementation

{ TPESSOA }

function TIPESSOA.Build: IService<Tpessoa>;
begin
  Result := FService;
end;

function TIPESSOA.COLABORADOR(value: Tcolaborador): IPESSOA;
begin
  Result := Self;
  FEntity.colaborador := value;
end;

function TIPESSOA.COLABORADOR: Tcolaborador;
begin
  Result := FEntity.colaborador;
end;

function TIPESSOA.contato: TObjectList<Tcontato>;
begin
  Result := FEntity.contato;
end;

function TIPESSOA.contato(Value: TObjectList<Tcontato>): IPESSOA;
begin
  Result := Self;
  FEntity.contato := Value;
end;

constructor TIPESSOA.Create;
begin
  FEntity := Tpessoa.Create;
  FService := TServiceORMBr<Tpessoa>.New(FEntity);
end;

destructor TIPESSOA.Destroy;
begin
  FreeAndNil(FEntity);
  inherited;
end;

function TIPESSOA.abreviado(Value: String): IPESSOA;
begin
  Result := Self;
  FEntity.abreviado := Value;
end;

function TIPESSOA.abreviado: String;
begin
  Result := FEntity.abreviado;
end;

function TIPESSOA.AdicionarContato(nIdPesoa: Integer; aNome: String;
  tipoTel: Integer; aTelefone: String; tipoEmail: Integer; aEmail: String): IPESSOA;
begin
  Result := Self;
  FEntity.AdicionarContato(-1,aNome,tipoTel,aTelefone,tipoEmail,aEmail);
end;

//function TIPESSOA.dt_alt(Value: TDateTime): IPESSOA;
//begin
//  Result := Self;
//  FEntity.dt_alt:= Value;
//end;
//
//function TIPESSOA.dt_alt: TDateTime;
//begin
//  Result := FEntity.dt_alt;
//end;


//function TIPESSOA.dt_hab(Value: TDateTime): IPESSOA;
//begin
//  Result := Self;
//  FEntity.dt_hab := Value;
//end;
//
//function TIPESSOA.dt_hab: TDateTime;
//begin
//  Result := FEntity.dt_hab;
//end;

//function TIPESSOA.dt_inc(Value: TDateTime): IPESSOA;
//begin
//  Result := Self;
//  FEntity.dt_inc := Value;
//end;
//
//function TIPESSOA.dt_inc: TDateTime;
//begin
//  Result := FEntity.DT_INC;
//end;

function TIPESSOA.ENDERECO(value: Tendereco): IPESSOA;
begin
  Result := Self;
  FEntity.endereco := value;
end;

function TIPESSOA.ENDERECO: Tendereco;
begin
  Result := FEntity.endereco;
end;

function TIPESSOA.id_pessoa(Value: Integer): IPESSOA;
begin
  Result := Self;
  FEntity.id_pessoa := Value;
end;

function TIPESSOA.id_pessoa: Integer;
begin
  Result := FEntity.id_pessoa;
end;

function TIPESSOA.nome(Value: String): IPESSOA;
begin
  Result := Self;
  FEntity.nome := Value;
end;

function TIPESSOA.nome: String;
begin
  Result := FEntity.nome;
end;

function TIPESSOA.pessoa_fisica(
  Value: TObjectList<Tpessoa_fisica>): IPESSOA;
begin
  Result := Self;
  FEntity.pessoa_fisica := Value;
end;

function TIPESSOA.pessoa_fisica: TObjectList<Tpessoa_fisica>;
begin
  Result := FEntity.pessoa_fisica;
end;

function TIPESSOA.pessoa_juridica(
  Value: TObjectList<Tpessoa_juridica>): IPESSOA;
begin
  Result := Self;
  FEntity.pessoa_juridica := Value;
end;

function TIPESSOA.pessoa_juridica: TObjectList<Tpessoa_juridica>;
begin
  Result := FEntity.pessoa_juridica;
end;

function TIPESSOA.site(Value: String): IPESSOA;
begin
  Result := Self;
  FEntity.site := Value;
end;

function TIPESSOA.site: String;
begin
  Result := FEntity.site;
end;

function TIPESSOA.suframa(Value: String): IPESSOA;
begin
  Result := Self;
  FEntity.suframa := Value;
end;

function TIPESSOA.suframa: String;
begin
  Result := FEntity.suframa;
end;

function TIPESSOA.tipo(Value: String): IPESSOA;
begin
  Result := Self;
  FEntity.tipo := Value;
end;

function TIPESSOA.tipo: String;
begin
  Result := FEntity.tipo;
end;

class function TIPESSOA.New: IPESSOA;
begin
  Result := Self.Create;
end;

end.
