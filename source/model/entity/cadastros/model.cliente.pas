unit model.cliente;

interface

uses
  DB,
  Classes,
  SysUtils,
  Generics.Collections,

  // ormbr
  ormbr.types.blob,
  ormbr.types.lazy,
  ormbr.objects.helper,
  dbcbr.types.mapping,
  ormbr.types.nullable,
  dbcbr.mapping.Classes,
  dbcbr.mapping.register,
  dbcbr.mapping.attributes;

type

  [Entity]
  [Table('cliente', '')]
  [PrimaryKey('id_cliente', TAutoIncType.AutoInc,
                            TGeneratorType.SequenceInc,
                            TSortingOrder.NoSort,
                            True, 'Chave primária')]
  [Sequence('cliente_id_cliente_seq"')]
  [OrderBy('id_cliente')]
  Tcliente = class
  private
    { Private declarations }
    Fid_local_cobranca: nullable<Integer>;
    Fusuario_alteracao: nullable<Integer>;
    Fm_calca: String;
    Fdata_alteracao: nullable<TDateTime>;
    Fconta_tomador: nullable<String>;
    Fdata_ultima_compra: nullable<TDateTime>;
    Fusuario_cadastro: Integer;
    Fid_pessoa: Integer;
//    Fdt_alt: Nullable<TDateTime>;
//    Fdt_inc: Nullable<TDateTime>;
    Fdata_cadastro: nullable<TDateTime>;
    Fvalor_ultima_compra: nullable<Double>;
    Flimite_credito: Double;
    Fcodigo: Integer;
    Fdesconto_padrao: nullable<Double>;
    Fdesde: nullable<TDateTime>;
    Fconta_contabil: nullable<Integer>;
    Fid_cliente: nullable<Integer>;
    Fid_vendedor_pref: nullable<Integer>;
//    Fdt_hab: Nullable<TDateTime>;
    Fid_cond_pgto_venda: nullable<Integer>;
    Fm_calcado: String;
    Fid_empresa_pref: nullable<Integer>;
    Fcomissao_vendedor: Double;
    Fid_situacao_for_cli: nullable<Integer>;
    Fid_tipo_venda: nullable<Integer>;
    Fid_empresa: nullable<Integer>;
    Fid_atividade_for_cli: nullable<Integer>;
    Fid_zona_venda: nullable<Integer>;
    Fid_tipo_cobranca: nullable<Integer>;
    Fmarkup_min: Double;
    Fobservacoes: nullable<String>;

  public
    { Public declarations }
    constructor Create;
    destructor Destroy; override;

    [Column('id_cliente', ftInteger)]
    [Dictionary('id_cliente', 'Mensagem de validação', '', '', '', taCenter)]
    property id_cliente: nullable<Integer> read Fid_cliente write Fid_cliente;

    [Restrictions([NotNull])]
    [Column('codigo', ftInteger)]
    [Dictionary('codigo', 'Mensagem de validação', '', '', '', taCenter)]
    property codigo: Integer read Fcodigo write Fcodigo;

    [Column('conta_contabil', ftInteger)]
    [Dictionary('conta_contabil', 'Mensagem de validação', '', '', '',
      taCenter)]
    property conta_contabil: nullable<Integer> read Fconta_contabil
      write Fconta_contabil;

    [Column('id_empresa', ftInteger)]
    [Dictionary('id_empresa', 'Mensagem de validação', '', '', '', taCenter)]
    property id_empresa: nullable<Integer> read Fid_empresa write Fid_empresa;

    [Restrictions([NotNull])]
    [Column('id_pessoa', ftInteger)]
    [ForeignKey('FK_CLIENTE_PESSOA', 'id_pessoa', 'pessoa', 'id_pessoa',
      Cascade, Cascade)]
    [Dictionary('id_pessoa', 'Mensagem de validação', '', '', '', taCenter)]
    property id_pessoa: Integer read Fid_pessoa write Fid_pessoa;

    [Column('id_atividade_for_cli', ftInteger)]
    [Dictionary('id_atividade_for_cli', 'Mensagem de validação', '', '', '',
      taCenter)]
    property id_atividade_for_cli: nullable<Integer> read Fid_atividade_for_cli
      write Fid_atividade_for_cli;

    [Column('id_situacao_for_cli', ftInteger)]
    [Dictionary('id_situacao_for_cli', 'Mensagem de validação', '', '', '',
      taCenter)]
    property id_situacao_for_cli: nullable<Integer> read Fid_situacao_for_cli
      write Fid_situacao_for_cli;

    [Column('desde', ftDateTime)]
    [Dictionary('desde', 'Mensagem de validação', '', '', '', taCenter)]
    property desde: nullable<TDateTime> read Fdesde write Fdesde;

    [Column('id_vendedor_pref', ftInteger)]
    [Dictionary('id_vendedor_pref', 'Mensagem de validação', '', '', '',
      taCenter)]
    property id_vendedor_pref: nullable<Integer> read Fid_vendedor_pref
      write Fid_vendedor_pref;

    [Column('id_empresa_pref', ftInteger)]
    [Dictionary('id_empresa_pref', 'Mensagem de validação', '', '', '',
      taCenter)]
    property id_empresa_pref: nullable<Integer> read Fid_empresa_pref
      write Fid_empresa_pref;

    [Restrictions([NotNull])]
    [Column('limite_credito', ftBCD)]
    [Dictionary('limite_credito', 'Mensagem de validação', '0', '', '',
      taRightJustify)]
    property limite_credito: Double read Flimite_credito write Flimite_credito;

    [Restrictions([NotNull])]
    [Column('comissao_vendedor', ftBCD, 93, 6)]
    [Dictionary('comissao_vendedor', 'Mensagem de validação', '0', '', '',
      taRightJustify)]
    property comissao_vendedor: Double read Fcomissao_vendedor
      write Fcomissao_vendedor;

    [Column('desconto_padrao', ftBCD)]
    [Dictionary('desconto_padrao', 'Mensagem de validação', '0', '', '',
      taRightJustify)]
    property desconto_padrao: nullable<Double> read Fdesconto_padrao
      write Fdesconto_padrao;

    [Column('contato_tomador', ftString, 50)]
    [Dictionary('contato_tomador', 'Mensagem de validação', '', '', '',
      taLeftJustify)]
    property conta_tomador: nullable<String> read Fconta_tomador
      write Fconta_tomador;

    [Column('observacoes', ftString, 8000)]
    [Dictionary('observacoes', 'Mensagem de validação', '', '', '',
      taLeftJustify)]
    property observacoes: nullable<String> read Fobservacoes write Fobservacoes;

    [Column('data_ultima_compra', ftDateTime)]
    [Dictionary('data_ultima_compra', 'Mensagem de validação', '', '', '',
      taCenter)]
    property data_ultima_compra: nullable<TDateTime> read Fdata_ultima_compra
      write Fdata_ultima_compra;

    [Column('valor_ultima_compra', ftBCD)]
    [Dictionary('valor_ultima_compra', 'Mensagem de validação', '0', '', '',
      taRightJustify)]
    property valor_ultima_compra: nullable<Double> read Fvalor_ultima_compra
      write Fvalor_ultima_compra;

    [Column('data_cadastro', ftDateTime)]
    [Dictionary('data_cadastro', 'Mensagem de validação', '', '', '', taCenter)]
    property data_cadastro: nullable<TDateTime> read Fdata_cadastro
      write Fdata_cadastro;

    [Restrictions([NotNull])]
    [Column('usuario_cadastro', ftInteger)]
    [Dictionary('usuario_cadastro', 'Mensagem de validação', '', '', '',
      taCenter)]
    property usuario_cadastro: Integer read Fusuario_cadastro
      write Fusuario_cadastro;

    [Column('data_alteracao', ftDateTime)]
    [Dictionary('data_alteracao', 'Mensagem de validação', '', '', '',
      taCenter)]
    property data_alteracao: nullable<TDateTime> read Fdata_alteracao
      write Fdata_alteracao;

    [Column('usuario_alteracao', ftInteger)]
    [Dictionary('usuario_alteracao', 'Mensagem de validação', '', '', '',
      taCenter)]
    property usuario_alteracao: nullable<Integer> read Fusuario_alteracao
      write Fusuario_alteracao;

    [Restrictions([NotNull])]
    [Column('m_blusa', ftString, 5)]
    [Dictionary('m_blusa', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property m_blusa: String read Fm_calca write Fm_calca;

    [Restrictions([NotNull])]
    [Column('m_calca', ftString, 5)]
    [Dictionary('m_calca', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property m_calca: String read Fm_calca write Fm_calca;

    [Restrictions([NotNull])]
    [Column('m_calcado', ftString, 5)]
    [Dictionary('m_calcado', 'Mensagem de validação', '', '', '',
      taLeftJustify)]
    property m_calcado: String read Fm_calcado write Fm_calcado;

    [Column('id_local_cobranca', ftInteger)]
    [Dictionary('id_local_cobranca', 'Mensagem de validação', '', '', '',
      taCenter)]
    property id_local_cobranca: nullable<Integer> read Fid_local_cobranca
      write Fid_local_cobranca;

    [Column('id_tipo_cobranca', ftInteger)]
    [Dictionary('id_tipo_cobranca', 'Mensagem de validação', '', '', '',
      taCenter)]
    property id_tipo_cobranca: nullable<Integer> read Fid_tipo_cobranca
      write Fid_tipo_cobranca;

    [Column('id_zona_venda', ftInteger)]
    [Dictionary('id_zona_venda', 'Mensagem de validação', '', '', '', taCenter)]
    property id_zona_venda: nullable<Integer> read Fid_zona_venda
      write Fid_zona_venda;

    [Column('id_cond_pgto_venda', ftInteger)]
    [Dictionary('id_cond_pgto_venda', 'Mensagem de validação', '', '', '',
      taCenter)]
    property id_cond_pgto_venda: nullable<Integer> read Fid_cond_pgto_venda
      write Fid_cond_pgto_venda;

    [Column('id_tipo_venda', ftInteger)]
    [Dictionary('id_tipo_venda', 'Mensagem de validação', '', '', '', taCenter)]
    property id_tipo_venda: nullable<Integer> read Fid_tipo_venda
      write Fid_tipo_venda;

    [Restrictions([NotNull])]
    [Column('markup_min', ftBCD)]
    [Dictionary('markup_min', 'Mensagem de validação', '0', '', '',
      taRightJustify)]
    property markup_min: Double read Fmarkup_min write Fmarkup_min;

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
//    property dt_hab: Nullable<TDateTime> read Fdt_hab write Fdt_hab;

  end;

implementation

constructor Tcliente.Create;
begin

end;

destructor Tcliente.Destroy;
begin

  inherited;
end;

initialization

TRegisterClass.RegisterEntity(Tcliente)

end.
