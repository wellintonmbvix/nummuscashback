unit controller.dto.pessoa.interfaces;

interface

uses
  System.Generics.Collections,

  model.pessoa,
  model.pessoaFisica,
  model.pessoaJuridica,
//  model.empresa,
  model.contato,
  model.colaborador,
  model.endereco,

  //** ORMBr
  ormbr.types.blob,
  model.service.interfaces;

type
  IPESSOA = interface
    ['{CA0B2F95-6879-4802-A275-64C2E7148D00}']

    function ID_PESSOA(Value: Integer): IPESSOA; overload;
    function ID_PESSOA: Integer; overload;

    function NOME(Value: String): IPESSOA; overload;
    function NOME: String; overload;

    function ABREVIADO(Value: String): IPESSOA; overload;
    function ABREVIADO: String; overload;

    function TIPO(Value: String): IPESSOA; overload;
    function TIPO: String; overload;

    function SITE(Value: String): IPESSOA; overload;
    function SITE: String; overload;

    function SUFRAMA(Value: String): IPESSOA; overload;
    function SUFRAMA: String; overload;

//    function DT_INC(Value: TDateTime): IPESSOA; overload;
//    function DT_INC: TDateTime; overload;
//
//    function DT_ALT(Value: TDateTime): IPESSOA; overload;
//    function DT_ALT: TDateTime; overload;
//
//    function DT_HAB(Value: TDateTime): IPESSOA; overload;
//    function DT_HAB: TDateTime; overload;

    function PESSOA_FISICA(Value: TObjectList<Tpessoa_fisica>): IPESSOA; overload;
    function PESSOA_FISICA: TObjectList<Tpessoa_fisica>; overload;

    function PESSOA_JURIDICA(Value: TObjectList<Tpessoa_juridica>): IPESSOA; overload;
    function PESSOA_JURIDICA: TObjectList<Tpessoa_juridica>; overload;

    function COLABORADOR(value: Tcolaborador): IPESSOA; overload;
    function COLABORADOR: Tcolaborador; overload;

    function ENDERECO(value: Tendereco): IPESSOA; overload;
    function ENDERECO: Tendereco; overload;

//    function EMPRESA(Value: TObjectList<Tempresa>): IPESSOA; overload;
//    function EMPRESA: TObjectList<Tempresa>; overload;

    function CONTATO(Value: TObjectList<Tcontato>): IPESSOA; overload;
    function CONTATO: TObjectList<Tcontato>; overload;

    function AdicionarContato(nIdPesoa: Integer; aNome: String;
      tipoTel: Integer; aTelefone: String; tipoEmail: Integer; aEmail: String): IPESSOA;

    function Build: IService<Tpessoa>;
  end;

implementation

end.
