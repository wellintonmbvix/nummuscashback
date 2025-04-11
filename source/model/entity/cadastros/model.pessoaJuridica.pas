unit model.pessoaJuridica;

interface

uses
  Data.DB,
  System.Classes,
  System.SysUtils,
  System.Generics.Collections,

  // ** ORMBr
  ormbr.types.blob,
  ormbr.types.lazy,
  dbcbr.types.mapping,
  ormbr.types.nullable,
  dbcbr.mapping.Classes,
  dbcbr.mapping.register,
  dbcbr.mapping.attributes;

type

  [Entity]
  [Table('pessoa_juridica', '')]
  [PrimaryKey('id_pessoa_juridica', TAutoIncType.AutoInc,
                                    TGeneratorType.SequenceInc,
                                    TSortingOrder.NoSort,
                                    True, 'Chave primária')]
  [Sequence('pessoa_juridica_id_pessoa_juridica_seq')]
  [OrderBy('id_pessoa_juridica')]
  Tpessoa_juridica = class
  private
    { Private declarations }
    Finscricao_municipal: String;
    Ffantasia: String;
    Fcnpj: nullable<String>;
    Frazao_social_ant: nullable<String>;
    Fvlr_imovel: nullable<Double>;
    Frazao_social: String;
    Fid_pessoa: Integer;
//    Fdt_alt: Nullable<TDateTime>;
//    Fdt_inc: Nullable<TDateTime>;
    Fdata_constituicao: nullable<TDateTime>;
    Finscricao_estadual: String;
//    Fdt_hab: nullable<TDateTime>;
    Finscricao_junta_comercial: nullable<String>;
    Fid_pessoa_juridica: nullable<Integer>;
    Fdata_insc_junta_comercial: nullable<TDateTime>;
    Fcapital_giro: nullable<Double>;
    Fvlr_estoque: nullable<Double>;
    Fid_regime_tributario: nullable<Integer>;
    Fcapital_reg: nullable<Double>;

  public
    { Public declarations }
    constructor Create;
    destructor Destroy; override;

    [Column('id_pessoa_juridica', ftInteger)]
    [Dictionary('id_pessoa_juridica', 'Mensagem de validação', '', '', '',
      taCenter)]
    property id_pessoa_juridica: nullable<Integer> read Fid_pessoa_juridica
      write Fid_pessoa_juridica;

    [Restrictions([NotNull])]
    [Column('id_pessoa', ftInteger)]
    [ForeignKey('fk_pessoa_juridica_pessoa', 'id_pessoa', 'pessoa', 'id_pessoa',
      Cascade, Cascade)]
    [Dictionary('id_pessoa', 'Mensagem de validação', '', '', '', taCenter)]
    property id_pessoa: Integer read Fid_pessoa write Fid_pessoa;

    [Column('cnpj', ftString, 18)]
    [Dictionary('cnpj', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property cnpj: nullable<String> read Fcnpj write Fcnpj;

    [Restrictions([NotNull])]
    [Column('razao_social', ftString, 100)]
    [Dictionary('razao_social', 'Mensagem de validação', '', '', '',
      taLeftJustify)]
    property razao_social: String read Frazao_social write Frazao_social;

    [Restrictions([NotNull])]
    [Column('fantasia', ftString, 100)]
    [Dictionary('fantasia', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property fantasia: String read Ffantasia write Ffantasia;

    [Restrictions([NotNull])]
    [Column('inscricao_municipal', ftString, 30)]
    [Dictionary('inscricao_municipal', 'Mensagem de validação', '', '', '',
      taLeftJustify)]
    property inscricao_municipal: String read Finscricao_municipal
      write Finscricao_municipal;

    [Restrictions([NotNull])]
    [Column('inscricao_estadual', ftString, 30)]
    [Dictionary('inscricao_estadual', 'Mensagem de validação', '', '', '',
      taLeftJustify)]
    property inscricao_estadual: String read Finscricao_estadual
      write Finscricao_estadual;

    [Column('data_constituicao', ftDateTime)]
    [Dictionary('data_constituicao', 'Mensagem de validação', '', '', '',
      taCenter)]
    property data_constituicao: nullable<TDateTime> read Fdata_constituicao
      write Fdata_constituicao;

    [Column('id_regime_tributario', ftInteger)]
    [Dictionary('id_regime_tributario', 'Mensagem de validação', '', '', '',
      taCenter)]
    property id_regime_tributario: nullable<Integer> read Fid_regime_tributario
      write Fid_regime_tributario;

    [Column('vlr_imovel', ftBCD)]
    [Dictionary('vlr_imovel', 'Mensagem de validação', '0', '', '',
      taRightJustify)]
    property vlr_imovel: nullable<Double> read Fvlr_imovel write Fvlr_imovel;

    [Column('capital_reg', ftBCD, 93, 6)]
    [Dictionary('capital_reg', 'Mensagem de validação', '0', '', '',
      taRightJustify)]
    property capital_reg: nullable<Double> read Fcapital_reg write Fcapital_reg;

    [Column('capital_giro', ftBCD)]
    [Dictionary('capital_giro', 'Mensagem de validação', '0', '', '',
      taRightJustify)]
    property capital_giro: nullable<Double> read Fcapital_giro
      write Fcapital_giro;

    [Column('inscricao_junta_comercial', ftString, 50)]
    [Dictionary('inscricao_junta_comercial', 'Mensagem de validação', '', '',
      '', taLeftJustify)]
    property inscricao_junta_comercial: nullable<String>
      read Finscricao_junta_comercial write Finscricao_junta_comercial;

    [Column('data_insc_junta_comercial', ftDateTime)]
    [Dictionary('data_insc_junta_comercial', 'Mensagem de validação', '', '',
      '', taCenter)]
    property data_insc_junta_comercial: nullable<TDateTime>
      read Fdata_insc_junta_comercial write Fdata_insc_junta_comercial;

    [Column('vlr_estoque', ftBCD)]
    [Dictionary('vlr_estoque', 'Mensagem de validação', '0', '', '',
      taRightJustify)]
    property vlr_estoque: nullable<Double> read Fvlr_estoque write Fvlr_estoque;

    [Column('razao_social_ant', ftString, 100)]
    [Dictionary('razao_social_ant', 'Mensagem de validação', '', '', '',
      taLeftJustify)]
    property razao_social_ant: nullable<String> read Frazao_social_ant
      write Frazao_social_ant;

//    [Column('dt_inc', ftDateTime)]
//    [Dictionary('dt_inc', 'Mensagem de validação', 'Now', '', '!##/##/####;1;_',
//      taCenter)]
//    property dt_inc: Nullable<TDateTime> read Fdt_inc write Fdt_inc;
//
//    [Column('dt_alt', ftDateTime)]
//    [Dictionary('dt_alt', 'Mensagem de validação', 'Now', '', '!##/##/####;1;_',
//      taCenter)]
//    property dt_alt: Nullable<TDateTime> read Fdt_alt write Fdt_alt;
//
//    [Column('dt_hab', ftDateTime)]
//    [Dictionary('dt_hab', 'Mensagem de validação', '', '', '', taCenter)]
//    property dt_hab: nullable<TDateTime> read Fdt_hab write Fdt_hab;
  end;

implementation

{ TPESSOA_JURIDICA }

constructor Tpessoa_juridica.Create;
begin

end;

destructor Tpessoa_juridica.Destroy;
begin

  inherited;
end;

initialization

TRegisterClass.RegisterEntity(Tpessoa_juridica)

end.
