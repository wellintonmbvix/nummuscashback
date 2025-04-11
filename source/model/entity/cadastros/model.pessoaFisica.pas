unit model.pessoaFisica;

interface

uses
  DB,
  Classes,
  SysUtils,
  Generics.Collections,

  /// orm
  ormbr.types.blob,
  ormbr.types.lazy,
  dbcbr.types.mapping,
  ormbr.types.nullable,
  dbcbr.mapping.classes,
  dbcbr.mapping.register,
  dbcbr.mapping.attributes;

type
  [Entity]
  [Table('pessoa_fisica', '')]
  [PrimaryKey('id_pessoa_fisica', TAutoIncType.AutoInc,
                           TGeneratorType.NoneInc,
                           TSortingOrder.NoSort,
                           True, 'Chave primária')]
  [Sequence('pessoa_fisica_id_pessoa_fisica_seq')]
  [OrderBy('id_pessoa_fisica')]
  Tpessoa_fisica = class
  private
    { Private declarations }
    Fnum_dependentes: Integer;
    Fnacionalidade: Nullable<String>;
    Fid_estado_civil: Nullable<Integer>;
    Freservista_categoria: Nullable<String>;
    Freservista_numero: Nullable<String>;
    Finscricao_municipal: String;
    Frg: Nullable<String>;
    Ftitulo_eleitoral_numero: Nullable<String>;
    Ffiliacao_mae: Nullable<String>;
    Fnat_uf: Nullable<String>;
    Fid_pessoa: Integer;
//    Fdt_alt: Nullable<TDateTime>;
//    Fdt_inc: Nullable<TDateTime>;
    Forgao_rg: Nullable<String>;
    Fcpf: Nullable<String>;
    Ffiliacao_pai: Nullable<String>;
    Ftipo_sangue: Nullable<String>;
    Fcnh_vencimento: Nullable<TDateTime>;
    Finscricao_estadual: String;
//    Fdt_hab: Nullable<TDateTime>;
    Ffoto: TBlob;
    Fcnh_categoria: Nullable<String>;
    Fcnh_numero: Nullable<String>;
    Ftitulo_eleitoral_secao: Nullable<String>;
    Ftempo_residencia: Integer;
    Fraca: Nullable<String>;
    Ftitulo_eleitoral_zona: Nullable<String>;
    Fid_pessoa_fisica: Nullable<Integer>;
    Fdata_nascimento: Nullable<TDateTime>;
    Fnat_cidade: Nullable<String>;
    Fsexo: Nullable<String>;
    Fnome: String;
    Fdata_emissao_rg: Nullable<TDateTime>;

  public
    { Public declarations }
    constructor Create;
    destructor Destroy; override;

    [Column('id_pessoa_fisica', ftInteger)]
    [Dictionary('id_pessoa_fisica', 'Mensagem de validação', '', '', '', taCenter)]
    property id_pessoa_fisica: Nullable<Integer> read Fid_pessoa_fisica write Fid_pessoa_fisica;

    [Restrictions([NotNull])]
    [Column('id_pessoa', ftInteger)]
    [ForeignKey('FK__PESSOA', 'id_pessoa', 'pessoa', 'id_pessoa', Cascade, Cascade)]
    [Dictionary('id_pessoa', 'Mensagem de validação', '', '', '', taCenter)]
    property id_pessoa: Integer read Fid_pessoa write Fid_pessoa;

    [Column('id_estado_civil', ftInteger)]
    [Dictionary('id_estado_civil', 'Mensagem de validação', '', '', '', taCenter)]
    property id_estado_civil: Nullable<Integer> read Fid_estado_civil write Fid_estado_civil;

    [Restrictions([NotNull])]
    [Column('nome', ftString, 100)]
    [Dictionary('nome', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property nome: String read Fnome write Fnome;

    [Column('cpf', ftString, 14)]
    [Dictionary('cpf', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property cpf: Nullable<String> read Fcpf write Fcpf;

    [Column('rg', ftString, 30)]
    [Dictionary('rg', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property rg: Nullable<String> read Frg write Frg;

    [Column('orgao_rg', ftString, 15)]
    [Dictionary('orgao_rg', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property orgao_rg: Nullable<String> read Forgao_rg write Forgao_rg;

    [Column('data_emissao_rg', ftDateTime)]
    [Dictionary('data_emissao_rg', 'Mensagem de validação', '', '', '', taCenter)]
    property data_emissao_rg: Nullable<TDateTime> read Fdata_emissao_rg write Fdata_emissao_rg;

    [Column('data_nascimento', ftDateTime)]
    [Dictionary('data_nascimento', 'Mensagem de validação', '', '', '', taCenter)]
    property data_nascimento: Nullable<TDateTime> read Fdata_nascimento write Fdata_nascimento;

    [Column('sexo', ftString, 1)]
    [Dictionary('sexo', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property sexo: Nullable<String> read Fsexo write Fsexo;

    [Column('nat_cidade', ftString, 100)]
    [Dictionary('nat_cidade', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property nat_cidade: Nullable<String> read Fnat_cidade write Fnat_cidade;

    [Column('nat_uf', ftString, 2)]
    [Dictionary('nat_uf', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property nat_uf: Nullable<String> read Fnat_uf write Fnat_uf;

    [Column('nacionalidade', ftString, 100)]
    [Dictionary('nacionalidade', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property nacionalidade: Nullable<String> read Fnacionalidade write Fnacionalidade;

    [Column('raca', ftString, 1)]
    [Dictionary('raca', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property raca: Nullable<String> read Fraca write Fraca;

    [Column('tipo_sangue', ftString, 3)]
    [Dictionary('tipo_sangue', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property tipo_sangue: Nullable<String> read Ftipo_sangue write Ftipo_sangue;

    [Column('cnh_numero', ftString, 30)]
    [Dictionary('cnh_numero', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property cnh_numero: Nullable<String> read Fcnh_numero write Fcnh_numero;

    [Column('cnh_categoria', ftString, 5)]
    [Dictionary('cnh_categoria', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property cnh_categoria: Nullable<String> read Fcnh_categoria write Fcnh_categoria;

    [Column('cnh_vencimento', ftDateTime)]
    [Dictionary('cnh_vencimento', 'Mensagem de validação', '', '', '', taCenter)]
    property cnh_vencimento: Nullable<TDateTime> read Fcnh_vencimento write Fcnh_vencimento;

    [Column('titulo_eleitoral_numero', ftString, 30)]
    [Dictionary('titulo_eleitoral_numero', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property titulo_eleitoral_numero: Nullable<String> read Ftitulo_eleitoral_numero write Ftitulo_eleitoral_numero;

    [Column('titulo_eleitoral_zona', ftString, 5)]
    [Dictionary('titulo_eleitoral_zona', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property titulo_eleitoral_zona: Nullable<String> read Ftitulo_eleitoral_zona write Ftitulo_eleitoral_zona;

    [Column('titulo_eleitoral_secao', ftString, 5)]
    [Dictionary('titulo_eleitoral_secao', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property titulo_eleitoral_secao: Nullable<String> read Ftitulo_eleitoral_secao write Ftitulo_eleitoral_secao;

    [Column('reservista_numero', ftString, 30)]
    [Dictionary('reservista_numero', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property reservista_numero: Nullable<String> read Freservista_numero write Freservista_numero;

    [Column('reservista_categoria', ftString, 5)]
    [Dictionary('reservista_categoria', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property reservista_categoria: Nullable<String> read Freservista_categoria write Freservista_categoria;

    [Restrictions([TRestriction.NotNull])]
    [Column('inscricao_municipal', ftString, 30)]
    [Dictionary('inscricao_municipal', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property inscricao_municipal: String read Finscricao_municipal write Finscricao_municipal;

    [Restrictions([TRestriction.NotNull])]
    [Column('inscricao_estadual', ftString, 30)]
    [Dictionary('inscricao_estadual', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property inscricao_estadual: String read Finscricao_estadual write Finscricao_estadual;

    [Column('filiacao_pai', ftString, 100)]
    [Dictionary('filiacao_pai', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property filiacao_pai: Nullable<String> read Ffiliacao_pai write Ffiliacao_pai;

    [Column('filiacao_mae', ftString, 100)]
    [Dictionary('filiacao_mae', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property filiacao_mae: Nullable<String> read Ffiliacao_mae write Ffiliacao_mae;

    [Restrictions([TRestriction.NotNull])]
    [Column('num_dependentes', ftInteger)]
    [Dictionary('num_dependentes', 'Mensagem de validação', '', '', '', taCenter)]
    property num_dependentes: Integer read Fnum_dependentes write Fnum_dependentes;

    [Restrictions([TRestriction.NotNull])]
    [Column('tempo_residencia', ftInteger)]
    [Dictionary('tempo_residencia', 'Mensagem de validação', '', '', '', taCenter)]
    property tempo_residencia: Integer read Ftempo_residencia write Ftempo_residencia;

    [Column('foto', ftBlob)]
    [Dictionary('foto', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property foto: TBlob read Ffoto write Ffoto;

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
  end;

implementation

{ TPESSOA_FISICA }

constructor Tpessoa_fisica.Create;
begin

end;

destructor Tpessoa_fisica.Destroy;
begin

  inherited;
end;

initialization
  TRegisterClass.RegisterEntity(Tpessoa_fisica);

end.
