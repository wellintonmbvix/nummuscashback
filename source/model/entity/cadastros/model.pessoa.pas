unit model.pessoa;

interface

uses
  Data.DB,
  System.Classes,
  System.SysUtils,
  System.Generics.Collections,

  // orm models
  model.pessoaFisica,
  model.pessoaJuridica,
//  model.empresa,
//  model.fornecedor,
  model.cliente,
  model.contato,
  model.colaborador,
  model.endereco,

  // ormbr
  ormbr.types.blob,
  ormbr.types.lazy,
  ormbr.objects.helper,
  dbcbr.types.mapping,
  ormbr.types.nullable,
  dbcbr.mapping.classes,
  dbcbr.mapping.register,
  dbcbr.mapping.attributes;

type
  [Entity]
  [Table('pessoa', '')]
  [PrimaryKey('id_pessoa', TAutoIncType.AutoInc,
                           TGeneratorType.SequenceInc,
                           TSortingOrder.NoSort,
                           True, 'Chave primária')]
  [Sequence('pessoa_id_pessoa_seq')]
  [OrderBy('id_pessoa')]
  Tpessoa = class
  private
    { Private declarations }
    Fid_pessoa: Integer;
    Fnome: String;
    Fabreviado: String;
    Ftipo: String;
    Fsite: Nullable<String>;
    Fsuframa: Nullable<String>;
//    Fdt_inc: Nullable<TDateTime>;
//    Fdt_alt: Nullable<TDateTime>;
//    Fdt_hab: Nullable<TDateTime>;
    Fpessoa_fisica: TObjectList<Tpessoa_fisica>;
    Fpessoa_juridica: TObjectList<Tpessoa_juridica>;
//    Fempresa: TObjectList<Tempresa>;
//    Ffornecedor: TObjectList<Tfornecedor>;
    Fcliente: TObjectList<Tcliente>;
    Fcontato: TObjectList<Tcontato>;
    Fcolaborador: Tcolaborador;
    Fendereco: Tendereco;
  public
    { Public declarations }
    constructor Create;
    destructor Destroy; override;

    [Column('id_pessoa', ftInteger)]
    [Dictionary('id_pessoa', 'Mensagem de validação', '', '', '', taCenter)]
    property id_pessoa: Integer read Fid_pessoa write Fid_pessoa;

    [Restrictions([NotNull])]
    [Column('nome', ftString, 100)]
    [Dictionary('nome', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property nome: String read Fnome write Fnome;

    [Restrictions([NotNull])]
    [Column('abreviado', ftString, 15)]
    [Dictionary('abraviado', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property abreviado: String read Fabreviado write Fabreviado;

    [Restrictions([NotNull])]
    [Column('tipo', ftString, 1)]
    [Dictionary('tipo', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property tipo: String read Ftipo write Ftipo;

    [Column('site', ftString, 255)]
    [Dictionary('site', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property site: Nullable<String> read Fsite write Fsite;

    [Column('suframa', ftString, 15)]
    [Dictionary('suframa', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property suframa: Nullable<String> read Fsuframa write Fsuframa;

//    [Column('dt_inc', ftDateTime)]
//    [Dictionary('dt_inc', 'Mensagem de validação', 'Now', '', '!##/##/####;1;_', taCenter)]
//    property dt_inc: Nullable<TDateTime> read Fdt_inc write Fdt_inc;
//
//    [Column('dt_alt', ftDateTime)]
//    [Dictionary('dt_alt', 'Mensagem de validação', 'Now', '', '!##/##/####;1;_', taCenter)]
//    property dt_alt: Nullable<TDateTime> read Fdt_alt write Fdt_alt;
//
//    [Column('dt_hab', ftDateTime)]
//    [Dictionary('dt_hab', 'Mensagem de validação', '', '', '', taCenter)]
//    property dt_hab: Nullable<TDateTime> read Fdt_hab write Fdt_hab;

    [Association(TMultiplicity.OneToMany, 'id_pessoa', 'pessoa_fisica', 'id_pessoa')]
    [CascadeActions([TCascadeAction.CascadeAutoInc,
                     TCascadeAction.CascadeInsert,
                     TCascadeAction.CascadeUpdate,
                     TCascadeAction.CascadeDelete])]
    property pessoa_fisica: TObjectList<Tpessoa_fisica> read Fpessoa_fisica write Fpessoa_fisica;

    [Association(TMultiplicity.OneToMany, 'id_pessoa', 'pessoa_juridica', 'id_pessoa')]
    [CascadeActions([TCascadeAction.CascadeAutoInc,
                     TCascadeAction.CascadeInsert,
                     TCascadeAction.CascadeUpdate,
                     TCascadeAction.CascadeDelete])]
    property pessoa_juridica: TObjectList<Tpessoa_juridica> read Fpessoa_juridica write Fpessoa_juridica;

//    [Association(TMultiplicity.OneToMany, 'id_pessoa', 'empresa', 'id_pessoa')]
//    [CascadeActions([TCascadeAction.CascadeAutoInc,
//                     TCascadeAction.CascadeInsert,
//                     TCascadeAction.CascadeUpdate,
//                     TCascadeAction.CascadeDelete])]
//    property empresa: TObjectList<Tempresa> read Fempresa write Fempresa;
//
//    [Association(TMultiplicity.OneToMany, 'id_pessoa', 'fornecedor', 'id_pessoa')]
//    [CascadeActions([TCascadeAction.CascadeAutoInc,
//                     TCascadeAction.CascadeInsert,
//                     TCascadeAction.CascadeUpdate,
//                     TCascadeAction.CascadeDelete])]
//    property fornecedor: TObjectList<Tfornecedor> read Ffornecedor write Ffornecedor;

    [Association(TMultiplicity.OneToMany, 'id_pessoa', 'cliente', 'id_pessoa')]
    [CascadeActions([TCascadeAction.CascadeAutoInc,
                     TCascadeAction.CascadeInsert,
                     TCascadeAction.CascadeUpdate,
                     TCascadeAction.CascadeDelete])]
    property cliente: TObjectList<Tcliente> read Fcliente write Fcliente;

    [Association(TMultiplicity.OneToMany, 'id_pessoa', 'contato', 'id_pessoa')]
    [CascadeActions([TCascadeAction.CascadeAutoInc,
                     TCascadeAction.CascadeInsert,
                     TCascadeAction.CascadeUpdate,
                     TCascadeAction.CascadeDelete])]
    property contato: TObjectList<Tcontato> read Fcontato write Fcontato;

    [Association(TMultiplicity.OneToOne, 'id_pessoa', 'colaborador', 'id_pessoa')]
    [CascadeActions([TCascadeAction.CascadeAutoInc,
                     TCascadeAction.CascadeInsert,
                     TCascadeAction.CascadeUpdate,
                     TCascadeAction.CascadeDelete])]
    property colaborador: Tcolaborador read Fcolaborador write Fcolaborador;

    [Association(TMultiplicity.OneToOne, 'id_pessoa', 'endereco', 'id_pessoa')]
    [CascadeActions([TCascadeAction.CascadeAutoInc,
                     TCascadeAction.CascadeInsert,
                     TCascadeAction.CascadeUpdate,
                     TCascadeAction.CascadeDelete])]
    property endereco: Tendereco read Fendereco write Fendereco;

    procedure AdicionarContato(nIdPesoa: Integer; aNome: String;
      tipoTel: Integer; aTelefone: String; tipoEmail: Integer; aEmail: String);
  end;

implementation

{ TPessoa }

procedure Tpessoa.AdicionarContato(nIdPesoa: Integer; aNome: String;
      tipoTel: Integer; aTelefone: String; tipoEmail: Integer; aEmail: String);
begin
  Fcontato.Add(Tcontato.Create);
  With Fcontato.Last Do
    Begin
      nome := aNome;
      AdicionarContatoTelefone(tipoTel,aTelefone,-1);
      AdicionarContatoEmail(-1,tipoEmail,aEmail);
    End;
end;

constructor Tpessoa.Create;
begin
  Fcontato := TObjectLIst<Tcontato>.Create;
  Fpessoa_fisica := TObjectList<Tpessoa_fisica>.Create;
  Fpessoa_juridica := TObjectList<Tpessoa_juridica>.Create;
//  Fempresa := TObjectList<Tempresa>.Create;
//  Ffornecedor := TObjectList<Tfornecedor>.Create;
  Fcliente := TObjectList<Tcliente>.Create;
  Fcolaborador := Tcolaborador.Create;
  Fendereco := Tendereco.Create;
end;

destructor Tpessoa.Destroy;
begin
//  if Fpessoa_fisica <> Nil then
//  FreeAndNil(Fpessoa_fisica);
//
//  if Fpessoa_juridica <> Nil then
//  FreeAndNil(Fpessoa_juridica);
//
//  if Fempresa <> Nil then
//  FreeAndNil(Fempresa);
//
//  if Ffornecedor <> Nil then
//  FreeAndNil(Ffornecedor);
//
//  if Fcliente <> Nil then
//  FreeAndNil(Fcliente);

  FreeAndNil(Fcontato);
  inherited;
end;

initialization
  TRegisterClass.RegisterEntity(Tpessoa);

end.
