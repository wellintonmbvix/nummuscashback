unit model.produto;

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
  dbcbr.mapping.Classes,
  dbcbr.mapping.register,
  dbcbr.mapping.attributes;

type

  [Entity]
  [Table('produto', '')]
  [PrimaryKey('id_produto', TAutoIncType.AutoInc, TGeneratorType.NoneInc,
    TSortingOrder.NoSort, True, 'Chave primária')]
  [Sequence('produto_id_produto_seq')]
  [OrderBy('id_produto')]
  Tproduto = class
  private
    { Private declarations }
    Fid_produto_colecao_moda: nullable<Integer>;
    Fid_produto: Integer;
    Fdemanda_mes: Currency;
    Fid_produto_sub_grupo: Integer;
    Fdescricao: String;
    Fqtd_min_embalagem: Currency;
    Fid_unidade_produto: Integer;
    Fnome_pdv: String;
    Fid_produto_marca: nullable<Integer>;
    Flocacao: nullable<String>;
    Fcodigo_fabricante: nullable<String>;
    Fid_produto_origem: nullable<Integer>;
    Fid_produto_grupo: Integer;
    Fcodigo_tributacao: nullable<Integer>;
    Fnome: String;
    Fcodigo_original: nullable<String>;
    Fid_produto_classe_fiscal: nullable<Integer>;
    Frefid: String;
    Faliquota_ipi: Currency;
    Fiat: String;
    Fippt: String;
    Fck_identificar: Boolean;
    Finativo: Boolean;
    Fck_encomenda: Boolean;
    Fid_tipo_item_nfe: nullable<Integer>;
    Fcms: nullable<String>;
    Fncm: nullable<String>;
    Fcest: nullable<String>;
    Fex_tipi: nullable<String>;
    Fgenero: String;
    Fanp: nullable<String>;
    Fpeso: Currency;
    Fcomissao: Currency;
    Festoque_minimo: Currency;
    Fck_usar_grade: Boolean;
    Fid_produto_grade: nullable<Integer>;
    Fck_usar_cor: Boolean;
    Fsituacao: Integer;
    Fck_excluido: Boolean;
    Fmotivo_bloqueio: nullable<String>;
    Fck_usar_balanca: Boolean;
    Fduracao: nullable<TDateTime>;
    Ficms_compra: Currency;
    Fipi_compra: Currency;
    Fcst_icms_compra: nullable<String>;
    Fck_produto_servico: Boolean;
    Fcsosn: nullable<String>;
    Fperc_cred_csosn: Currency;
    Fpreco_unitario: Currency;
    Fpreco_unitario_medio: Currency;
    Fpreco_custo: Currency;
    Fcusto_contabil: Currency;
    Fcusto_liquido: Currency;
    Fcusto_real: Currency;
    Fcusto_medio: Currency;
    Foperacao_custo: Boolean;
    Fcod_mun_serv: nullable<String>;
    Fmarckup_min: Currency;
    Fmarckup_min_st: Currency;
    Fqtd_min_atacado: Currency;
    Fdt_ultima_atualizacao_preco: nullable<TDateTime>;
    Flogss: nullable<String>;
    Fdt_alt: nullable<TDateTime>;
    Fdt_inc: nullable<TDateTime>;
    Fdt_hab: nullable<TDateTime>;
    Fbloqueado: Boolean;
    Fmarca: Boolean;
  public
    { Public declarations }
    constructor Create;
    destructor Destroy; override;

    [Column('id_produto', ftInteger)]
    [Dictionary('id_produto', 'Mensagem de validação', '', '', '',
      taRightJustify)]
    property id_produto: Integer read Fid_produto write Fid_produto;

    [Restrictions([NotNull])]
    [Column('refid', ftString, 50)]
    [Dictionary('refid', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property refid: String read Frefid write Frefid;

    [Restrictions([NotNull])]
    [Column('nome', ftString, 100)]
    [Dictionary('nome', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property nome: String read Fnome write Fnome;

    [Restrictions([NotNull])]
    [Column('id_produto_grupo', ftInteger)]
    [ForeignKey('fk_produto_produto_grupo', 'id_produto_grupo', 'produto_grupo',
      'id_produto_grupo', None, None)]
    [Dictionary('id_produto_grupo', 'Mensagem de validação', '', '', '',
      taRightJustify)]
    property id_produto_grupo: Integer read Fid_produto_grupo
      write Fid_produto_grupo;

    [Restrictions([NotNull])]
    [Column('id_produto_sub_grupo', ftInteger)]
    [ForeignKey('fk_produto_produto_sub_grupo', 'id_produto_sub_grupo',
      'produto_sub_grupo', 'id_produto_sub_grupo', None, None)]
    [Dictionary('id_produto_sub_grupo', 'Mensagem de validação', '', '', '',
      taRightJustify)]
    property id_produto_sub_grupo: Integer read Fid_produto_sub_grupo
      write Fid_produto_sub_grupo;

    [Column('id_produto_marca', ftInteger)]
    [ForeignKey('fk_produto_produto_marca', 'id_produto_marca', 'produto_marca',
      'id_produto_marca', SetNull, SetNull)]
    [Dictionary('id_produto_marca', 'Mensagem de validação', '', '', '',
      taRightJustify)]
    property id_produto_marca: nullable<Integer> read Fid_produto_marca
      write Fid_produto_marca;

    [Column('id_produto_origem', ftInteger)]
    [ForeignKey('fk_produto_produto_origem', 'id_produto_origem',
      'produto_origem', 'id_produto_origem', SetNull, SetNull)]
    [Dictionary('id_produto_origem', 'Mensagem de validação', '', '', '',
      taRightJustify)]
    property id_produto_origem: nullable<Integer> read Fid_produto_origem
      write Fid_produto_origem;

    [Column('id_produto_classe_fiscal', ftInteger)]
    [ForeignKey('fk_produto_produto_classe_fiscal', 'id_produto_classe_fiscal',
      'produto_classe_fiscal', 'id_produto_classe_fiscal', SetNull, SetNull)]
    [Dictionary('id_produto_classe_fiscal', 'Mensagem de validação', '', '', '',
      taRightJustify)]
    property id_produto_classe_fiscal: nullable<Integer>
      read Fid_produto_classe_fiscal write Fid_produto_classe_fiscal;

    [Restrictions([NotNull])]
    [Column('descricao', ftString)]
    [Dictionary('descricao', 'Mensagem de validação', '', '', '',
      taLeftJustify)]
    property descricao: String read Fdescricao write Fdescricao;

    [Restrictions([NotNull])]
    [Column('nome_pdv', ftString, 50)]
    [Dictionary('nome_pdv', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property nome_pdv: String read Fnome_pdv write Fnome_pdv;

    [Column('id_produto_colecao_moda', ftInteger)]
    [ForeignKey('fk_produto_produto_classe_fiscal', 'id_produto_colecao_moda',
      'produto_colecao_moda', 'id_produto_colecao_moda', SetNull, SetNull)]
    [Dictionary('id_produto_colecao_moda', 'Mensagem de validação', '', '', '',
      taRightJustify)]
    property id_produto_colecao_moda: nullable<Integer>
      read Fid_produto_colecao_moda write Fid_produto_colecao_moda;

    [Column('codigo_tributacao', ftInteger)]
    [Dictionary('codigo_tributacao', 'Mensagem de validação', '', '', '',
      taLeftJustify)]
    property codigo_tributacao: nullable<Integer> read Fcodigo_tributacao
      write Fcodigo_tributacao;

    [Column('codigo_original', ftString, 50)]
    [Dictionary('codigo_original', 'Mensagem de validação', '', '', '',
      taLeftJustify)]
    property codigo_original: nullable<String> read Fcodigo_original
      write Fcodigo_original;

    [Column('codigo_fabricante', ftString, 50)]
    [Dictionary('codigo_fabricante', 'Mensagem de validação', '', '', '',
      taLeftJustify)]
    property codigo_fabricante: nullable<String> read Fcodigo_fabricante
      write Fcodigo_fabricante;

    [Column('locacao', ftString, 15)]
    [Dictionary('locacao', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property locacao: nullable<String> read Flocacao write Flocacao;

    [Restrictions([NotNull])]
    [Column('demanda_mes', ftCurrency)]
    [Dictionary('demanda_mes', 'Mensagem de validação', '0', '', '',
      taRightJustify)]
    property demanda_mes: Currency read Fdemanda_mes write Fdemanda_mes;

    [Restrictions([NotNull])]
    [Column('id_unidade_produto', ftInteger)]
    [ForeignKey('fk_produto_unidade_produto', 'id_unidade_produto',
      'unidade_produto', 'id_unidade_produto', None, None)]
    [Dictionary('id_unidade_produto', 'Mensagem de validação', '', '', '',
      taRightJustify)]
    property id_unidade_produto: Integer read Fid_unidade_produto
      write Fid_unidade_produto;

    [Restrictions([NotNull])]
    [Column('qtd_min_embalagem', ftCurrency)]
    [Dictionary('qtd_min_embalagem', 'Mensagem de validação', '0', '', '',
      taRightJustify)]
    property qtd_min_embalagem: Currency read Fqtd_min_embalagem
      write Fqtd_min_embalagem;

    [Restrictions([NotNull])]
    [Column('aliquota_ipi', ftCurrency)]
    [Dictionary('aliquota_ipi', 'Mensagem de validação', '0', '', '',
      taRightJustify)]
    property aliquota_ipi: Currency read Faliquota_ipi write Faliquota_ipi;

    [Restrictions([NotNull])]
    [Column('iat', ftString, 1)]
    [Dictionary('iat', 'Mensagem de validação', 'T', '', '', taCenter)]
    property iat: String read Fiat write Fiat;

    [Restrictions([NotNull])]
    [Column('ippt', ftString, 1)]
    [Dictionary('ippt', 'Mensagem de validação', 'T', '', '', taCenter)]
    property ippt: String read Fippt write Fippt;

    [Restrictions([NotNull])]
    [Column('ck_identificar', ftBoolean)]
    [Dictionary('ck_identificar', 'Mensagem de validação', 'false', '', '',
      taCenter)]
    property ck_identificar: Boolean read Fck_identificar write Fck_identificar;

    [Restrictions([NotNull])]
    [Column('inativo', ftBoolean)]
    [Dictionary('inativo', 'Mensagem de validação', 'false', '', '', taCenter)]
    property inativo: Boolean read Finativo write Finativo;

    [Restrictions([NotNull])]
    [Column('ck_encomenda', ftBoolean)]
    [Dictionary('ck_encomenda', 'Mensagem de validação', 'false', '', '',
      taCenter)]
    property ck_encomenda: Boolean read Fck_encomenda write Fck_encomenda;

    [Column('id_tipo_item_nfe', ftInteger)]
    [ForeignKey('fk_produto_tipo_item_nfe', 'id_tipo_item_nfe', 'tipo_item_nfe',
      'id_tipo_item_nfe', SetNull, SetNull)]
    [Dictionary('id_tipo_item_nfe', 'Mensagem de validação', '1', '', '',
      taRightJustify)]
    property id_tipo_item_nfe: nullable<Integer> read Fid_tipo_item_nfe
      write Fid_tipo_item_nfe;

    [Column('cms', ftString, 5)]
    [Dictionary('cms', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property cms: nullable<String> read Fcms write Fcms;

    [Restrictions([NotNull])]
    [Column('ncm', ftString, 10)]
    [Dictionary('ncm', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property ncm: nullable<String> read Fncm write Fncm;

    [Column('cest', ftString, 10)]
    [Dictionary('cest', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property cest: nullable<String> read Fcest write Fcest;

    [Column('ex_tipi', ftString, 3)]
    [Dictionary('ex_tipi', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property ex_tipi: nullable<String> read Fex_tipi write Fex_tipi;

    [Restrictions([NotNull])]
    [Column('genero', ftString, 2)]
    [Dictionary('genero', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property genero: String read Fgenero write Fgenero;

    [Column('anp', ftString, 10)]
    [Dictionary('anp', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property anp: nullable<String> read Fanp write Fanp;

    [Restrictions([NotNull])]
    [Column('peso', ftCurrency)]
    [Dictionary('peso', 'Mensagem de validação', '0', '', '', taRightJustify)]
    property peso: Currency read Fpeso write Fpeso;

    [Restrictions([NotNull])]
    [Column('comissao', ftCurrency)]
    [Dictionary('comissao', 'Mensagem de validação', '0', '', '',
      taRightJustify)]
    property comissao: Currency read Fcomissao write Fcomissao;

    [Restrictions([NotNull])]
    [Column('estoque_minimo', ftCurrency)]
    [Dictionary('estoque_minimo', 'Mensagem de validação', '0', '', '',
      taRightJustify)]
    property estoque_minimo: Currency read Festoque_minimo
      write Festoque_minimo;

    [Restrictions([NotNull])]
    [Column('ck_usar_grade', ftBoolean)]
    [Dictionary('ck_usar_grade', 'Mensagem de validação', 'false', '', '',
      taCenter)]
    property ck_usar_grade: Boolean read Fck_usar_grade write Fck_usar_grade;

    [Column('id_produto_grade', ftInteger)]
    [ForeignKey('fk_produto_tipo_item_nfe', 'id_produto_grade', 'produto_grade',
      'id_produto_grade', SetNull, SetNull)]
    [Dictionary('id_produto_grade', 'Mensagem de validação', '1', '', '',
      taRightJustify)]
    property id_produto_grade: nullable<Integer> read Fid_produto_grade
      write Fid_produto_grade;

    [Restrictions([NotNull])]
    [Column('ck_usar_cor', ftBoolean)]
    [Dictionary('ck_usar_cor', 'Mensagem de validação', 'false', '', '',
      taCenter)]
    property ck_usar_cor: Boolean read Fck_usar_cor write Fck_usar_cor;

    [Restrictions([NotNull])]
    [Column('situacao', ftInteger)]
    [Dictionary('situacao', 'Mensagem de validação', '0', '', '',
      taRightJustify)]
    property situacao: Integer read Fsituacao write Fsituacao;

    [Restrictions([NotNull])]
    [Column('ck_excluido', ftBoolean)]
    [Dictionary('ck_excluido', 'Mensagem de validação', 'false', '', '',
      taCenter)]
    property ck_excluido: Boolean read Fck_excluido write Fck_excluido;

    [Column('motivo_bloqueio', ftString, 100)]
    [Dictionary('motivo_bloqueio', 'Mensagem de validação', '', '', '',
      taLeftJustify)]
    property motivo_bloqueio: nullable<String> read Fmotivo_bloqueio
      write Fmotivo_bloqueio;

    [Restrictions([NotNull])]
    [Column('ck_usar_balanca', ftBoolean)]
    [Dictionary('ck_usar_balanca', 'Mensagem de validação', 'false', '', '',
      taCenter)]
    property ck_usar_balanca: Boolean read Fck_usar_balanca
      write Fck_usar_balanca;

    [Column('duracao', ftDateTime)]
    [Dictionary('duracao', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property duracao: nullable<TDateTime> read Fduracao write Fduracao;

    [Restrictions([NotNull])]
    [Column('icms_compra', ftCurrency)]
    [Dictionary('icms_compra', 'Mensagem de validação', '0', '', '',
      taRightJustify)]
    property icms_compra: Currency read Ficms_compra write Ficms_compra;

    [Restrictions([NotNull])]
    [Column('ipi_compra', ftCurrency)]
    [Dictionary('ipi_compra', 'Mensagem de validação', '0', '', '',
      taRightJustify)]
    property ipi_compra: Currency read Fipi_compra write Fipi_compra;

    [Column('cst_icms_compra', ftString, 3)]
    [Dictionary('cst_icms_compra', 'Mensagem de validação', '', '', '',
      taCenter)]
    property cst_icms_compra: nullable<String> read Fcst_icms_compra
      write Fcst_icms_compra;

    [Restrictions([NotNull])]
    [Column('ck_produto_servico', ftBoolean)]
    [Dictionary('ck_produto_servico', 'Mensagem de validação', 'false', '', '',
      taCenter)]
    property ck_produto_servico: Boolean read Fck_produto_servico
      write Fck_produto_servico;

    [Column('csosn', ftString, 4)]
    [Dictionary('csosn', 'Mensagem de validação', '', '', '', taCenter)]
    property csosn: nullable<String> read Fcsosn write Fcsosn;

    [Restrictions([NotNull])]
    [Column('perc_cred_csosn', ftCurrency)]
    [Dictionary('perc_cred_csosn', 'Mensagem de validação', '0', '', '',
      taRightJustify)]
    property perc_cred_csosn: Currency read Fperc_cred_csosn
      write Fperc_cred_csosn;

    [Restrictions([NotNull])]
    [Column('preco_unitario', ftCurrency)]
    [Dictionary('preco_unitario', 'Mensagem de validação', '0', '', '',
      taRightJustify)]
    property preco_unitario: Currency read Fpreco_unitario
      write Fpreco_unitario;

    [Restrictions([NotNull])]
    [Column('preco_unitario_medio', ftCurrency)]
    [Dictionary('preco_unitario_medio', 'Mensagem de validação', '0', '', '',
      taRightJustify)]
    property preco_unitario_medio: Currency read Fpreco_unitario_medio
      write Fpreco_unitario_medio;

    [Restrictions([NotNull])]
    [Column('preco_custo', ftCurrency)]
    [Dictionary('preco_custo', 'Mensagem de validação', '0', '', '',
      taRightJustify)]
    property preco_custo: Currency read Fpreco_custo write Fpreco_custo;

    [Restrictions([NotNull])]
    [Column('custo_contabil', ftCurrency)]
    [Dictionary('custo_contabil', 'Mensagem de validação', '0', '', '',
      taRightJustify)]
    property custo_contabil: Currency read Fcusto_contabil
      write Fcusto_contabil;

    [Restrictions([NotNull])]
    [Column('custo_liquido', ftCurrency)]
    [Dictionary('custo_liquido', 'Mensagem de validação', '0', '', '',
      taRightJustify)]
    property custo_liquido: Currency read Fcusto_liquido write Fcusto_liquido;

    [Restrictions([NotNull])]
    [Column('custo_real', ftCurrency)]
    [Dictionary('custo_real', 'Mensagem de validação', '0', '', '',
      taRightJustify)]
    property custo_real: Currency read Fcusto_real write Fcusto_real;

    [Restrictions([NotNull])]
    [Column('custo_medio', ftCurrency)]
    [Dictionary('custo_medio', 'Mensagem de validação', '0', '', '',
      taRightJustify)]
    property custo_medio: Currency read Fcusto_medio write Fcusto_medio;

    [Restrictions([NotNull])]
    [Column('operacao_custo', ftBoolean)]
    [Dictionary('operacao_custo', 'Mensagem de validação', 'false', '', '',
      taCenter)]
    property operacao_custo: Boolean read Foperacao_custo write Foperacao_custo;

    [Column('cod_mun_serv', ftString, 8)]
    [Dictionary('cod_mun_serv', 'Mensagem de validação', '', '', '',
      taLeftJustify)]
    property cod_mun_serv: nullable<String> read Fcod_mun_serv
      write Fcod_mun_serv;

    [Restrictions([NotNull])]
    [Column('marckup_min', ftCurrency)]
    [Dictionary('marckup_min', 'Mensagem de validação', '0', '', '',
      taRightJustify)]
    property marckup_min: Currency read Fmarckup_min write Fmarckup_min;

    [Restrictions([NotNull])]
    [Column('marckup_min_st', ftCurrency)]
    [Dictionary('marckup_min_st', 'Mensagem de validação', '0', '', '',
      taRightJustify)]
    property marckup_min_st: Currency read Fmarckup_min_st
      write Fmarckup_min_st;

    [Restrictions([NotNull])]
    [Column('qtd_min_atacado', ftCurrency)]
    [Dictionary('qtd_min_atacado', 'Mensagem de validação', '0', '', '',
      taRightJustify)]
    property qtd_min_atacado: Currency read Fqtd_min_atacado
      write Fqtd_min_atacado;

    [Column('dt_ultima_atualizacao_preco', ftDateTime)]
    [Dictionary('dt_ultima_atualizacao_preco', 'Mensagem de validação', '', '',
      '', taRightJustify)]
    property dt_ultima_atualizacao_preco: nullable<TDateTime>
      read Fdt_ultima_atualizacao_preco write Fdt_ultima_atualizacao_preco;

    [Column('logss', ftString)]
    [Dictionary('logss', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property logss: nullable<String> read Flogss write Flogss;

    [Column('dt_inc', ftDateTime)]
    [Dictionary('dt_inc', 'Mensagem de validação', 'Now', '', '!##/##/####;1;_',
      taCenter)]
    property dt_inc: nullable<TDateTime> read Fdt_inc write Fdt_inc;

    [Column('dt_alt', ftDateTime)]
    [Dictionary('dt_alt', 'Mensagem de validação', 'Now', '', '!##/##/####;1;_',
      taCenter)]
    property dt_alt: nullable<TDateTime> read Fdt_alt write Fdt_alt;

    [Column('dt_hab', ftDateTime)]
    [Dictionary('dt_hab', 'Mensagem de validação', '', '', '', taCenter)]
    property dt_hab: nullable<TDateTime> read Fdt_hab write Fdt_hab;

    [Column('marca', ftBoolean)]
    [Dictionary('marca', 'Mensagem de validação', 'false', '', '', taCenter)]
    property marca: Boolean read Fmarca write Fmarca;

    [Column('bloqueado', ftBoolean)]
    [Dictionary('bloqueado', 'Mensagem de validação', 'false', '', '',
      taCenter)]
    property bloqueado: Boolean read Fbloqueado write Fbloqueado;
  end;

implementation

{ Tproduto }

constructor Tproduto.Create;
begin

end;

destructor Tproduto.Destroy;
begin

  inherited;
end;

initialization

TRegisterClass.RegisterEntity(Tproduto)

end.
