unit model.pdv_notas_fiscais_forma_pagamento;

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
  [Table('PDV_NOTAS_FISCAIS_FORMA_PAGAMENTO', '')]
  [PrimaryKey('ID_PDV_NOTAS_FISCAIS_FORMA_PAGAMENTO', TAutoIncType.NotInc,
                                                      TGeneratorType.NoneInc,
                                                      TSortingOrder.NoSort,
                                                      True, 'Chave primária')]
  [OrderBy('ID_PDV_NOTAS_FISCAIS_FORMA_PAGAMENTO')]
  TPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO = class
  private
    { Private declarations }
    FID_PDV_NOTAS_FISCAIS_FORMA_PAGAMENTO: nullable<Integer>;
    FID_PDV_NOTAS_FISCAIS_CAB: Integer;
    FID_COND_PGTO_VENDA: nullable<Integer>;
    FID_FORMA_PAGAMENTO: Integer;
    FVENCIMENTO: TDateTime;
    FTITULAR: nullable<String>;
    FPARCELA: Integer;
    FTOTAL_PARCELAS: Integer;
    FVALOR: Double;
    FID_CONFIG_CARTAO: nullable<Integer>;
    FAUTORIZACAO: nullable<String>;
    FBANCO: nullable<Integer>;
    FAGENCIA: nullable<String>;
    FCONTA: nullable<String>;
    FNRO_CHEQUE: nullable<String>;
    FID_COLABORADOR: nullable<Integer>;
    FID_CONFIG_FINANCEIRA: nullable<Integer>;
    FTABELA: nullable<Integer>;
    FADESAO: nullable<Integer>;
    FTAXA_FINANCEIRA: Double;
    FOBS: nullable<String>;
    FDT_INC: TDateTime;
    FDT_ALT: TDateTime;
    FDT_HAB: nullable<TDateTime>;
    FID_CONFIG_CART_DIGITAL: nullable<Integer>;
    FID_CONTA_BANCO: nullable<Integer>;
    FTIPO_PAGAMENTO: nullable<String>;
    FTIPO_CARTAO: Integer;
    FDEBITO: Integer;
    FCONSULTA_CHEQUE: Integer;
    FTIPO_COBRANCA: Integer;
    FLIGAR: Integer;
    FAVISTA: Integer;
    FMARCA: Integer;
    FBLOQUEADO: Integer;
  public
    { Public declarations }
    constructor Create;

    destructor Destroy; override;
    [Column('ID_PDV_NOTAS_FISCAIS_FORMA_PAGAMENTO', ftInteger)]
    [Dictionary('ID_PDV_NOTAS_FISCAIS_FORMA_PAGAMENTO', 'Mensagem de valida  o',
      '', '', '', taCenter)]
    property id_pdv_notas_fiscais_forma_pagamento: nullable<Integer>
      read FID_PDV_NOTAS_FISCAIS_FORMA_PAGAMENTO
      write FID_PDV_NOTAS_FISCAIS_FORMA_PAGAMENTO;

    [Restrictions([NotNull])]
    [Column('ID_PDV_NOTAS_FISCAIS_CAB', ftInteger)]
    [Dictionary('ID_PDV_NOTAS_FISCAIS_CAB', 'Mensagem de validação', '', '', '',
      taCenter)]
    property id_pdv_notas_fiscais_cab: Integer read FID_PDV_NOTAS_FISCAIS_CAB
      write FID_PDV_NOTAS_FISCAIS_CAB;

    [Column('ID_COND_PGTO_VENDA', ftInteger)]
    [Dictionary('ID_COND_PGTO_VENDA', 'Mensagem de validação', '', '', '',
      taCenter)]
    property id_cond_pgto_venda: nullable<Integer> read FID_COND_PGTO_VENDA
      write FID_COND_PGTO_VENDA;

    [Restrictions([NotNull])]
    [Column('ID_FORMA_PAGAMENTO', ftInteger)]
    [Dictionary('ID_FORMA_PAGAMENTO', 'Mensagem de valida  o', '', '', '',
      taCenter)]
    property id_forma_pagamento: Integer read FID_FORMA_PAGAMENTO
      write FID_FORMA_PAGAMENTO;

    [Restrictions([TRestriction.NoInsert, TRestriction.NoUpdate])]
    [Column('TIPO_PAGAMENTO', ftString, 60)]
    [JoinColumn('ID_FORMA_PAGAMENTO', 'FORMA_PAGAMENTO', 'ID_FORMA_PAGAMENTO', 'NOME',
      TJoin.InnerJoin, 'TIPO_PAGAMENTO')]
    [Dictionary('TIPO_PAGAMENTO', '')]
    property TIPO_PAGAMENTO: nullable<String> read FTIPO_PAGAMENTO write FTIPO_PAGAMENTO;

    [Restrictions([NotNull])]
    [Column('VENCIMENTO', ftDateTime)]
    [Dictionary('VENCIMENTO', 'Mensagem de validação', 'Now', '',
      '!##/##/####;1;_', taCenter)]
    property vencimento: TDateTime read FVENCIMENTO write FVENCIMENTO;

    [Column('TITULAR', ftString, 100)]
    [Dictionary('TITULAR', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property titular: nullable<String> read FTITULAR write FTITULAR;

    [Restrictions([NotNull])]
    [Column('PARCELA', ftInteger)]
    [Dictionary('PARCELA', 'Mensagem de validação', '', '', '', taCenter)]
    property parcela: Integer read FPARCELA write FPARCELA;

    [Restrictions([NotNull])]
    [Column('TOTAL_PARCELAS', ftInteger)]
    [Dictionary('TOTAL_PARCELAS', 'Mensagem de validação', '', '', '',
      taCenter)]
    property total_parcelas: Integer read FTOTAL_PARCELAS write FTOTAL_PARCELAS;

    [Restrictions([NotNull])]
    [Column('VALOR', ftBCD)]
    [Dictionary('VALOR', 'Mensagem de validação', '0', '', '', taRightJustify)]
    property valor: Double read FVALOR write FVALOR;

    [Restrictions([NotNull])]
    [Column('TIPO_CARTAO', ftInteger)]
    [Dictionary('TIPO_CARTAO', 'Mensagem de validação', '0', '', '',
      taCenter)]
    property tipo_cartao: Integer read FTIPO_CARTAO
      write FTIPO_CARTAO;

    [Column('ID_CONFIG_CARTAO', ftInteger)]
    [Dictionary('ID_CONFIG_CARTAO', 'Mensagem de validação', '', '', '',
      taCenter)]
    property id_config_cartao: nullable<Integer> read FID_CONFIG_CARTAO
      write FID_CONFIG_CARTAO;

    [Column('AUTORIZACAO', ftString, 50)]
    [Dictionary('AUTORIZACAO', 'Mensagem de validação', '', '', '',
      taLeftJustify)]
    property autorizacao: nullable<String> read FAUTORIZACAO write FAUTORIZACAO;

    [Restrictions([NotNull])]
    [Column('DEBITO', ftInteger)]
    [Dictionary('DEBITO', 'Mensagem de validação', '0', '', '',
      taCenter)]
    property debito: Integer read FDEBITO
      write FDEBITO;

    [Column('BANCO', ftInteger)]
    [Dictionary('BANCO', 'Mensagem de validação', '', '', '', taCenter)]
    property banco: nullable<Integer> read FBANCO write FBANCO;

    [Column('AGENCIA', ftString, 15)]
    [Dictionary('AGENCIA', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property agencia: nullable<String> read FAGENCIA write FAGENCIA;

    [Column('CONTA', ftString, 15)]
    [Dictionary('CONTA', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property conta: nullable<String> read FCONTA write FCONTA;

    [Column('NRO_CHEQUE', ftString, 15)]
    [Dictionary('NRO_CHEQUE', 'Mensagem de validação', '', '', '',
      taLeftJustify)]
    property nro_cheque: nullable<String> read FNRO_CHEQUE write FNRO_CHEQUE;

    [Restrictions([NotNull])]
    [Column('CONSULTA_CHEQUE', ftInteger)]
    [Dictionary('CONSULTA_CHEQUE', 'Mensagem de validação', '0', '', '',
      taCenter)]
    property consulta_cheque: Integer read FCONSULTA_CHEQUE
      write FCONSULTA_CHEQUE;

    [Column('ID_COLABORADOR', ftInteger)]
    [Dictionary('ID_COLABORADOR', 'Mensagem de validação', '', '', '',
      taCenter)]
    property id_colaborador: nullable<Integer> read FID_COLABORADOR
      write FID_COLABORADOR;

    [Column('ID_CONFIG_FINANCEIRA', ftInteger)]
    [Dictionary('ID_CONFIG_FINANCEIRA', 'Mensagem de validação', '', '', '',
      taCenter)]
    property id_config_financeira: nullable<Integer> read FID_CONFIG_FINANCEIRA
      write FID_CONFIG_FINANCEIRA;

    [Column('TABELA', ftInteger)]
    [Dictionary('TABELA', 'Mensagem de validação', '', '', '', taCenter)]
    property tabela: nullable<Integer> read FTABELA write FTABELA;

    [Column('ADESAO', ftInteger)]
    [Dictionary('ADESAO', 'Mensagem de validação', '', '', '', taCenter)]
    property adesao: nullable<Integer> read FADESAO write FADESAO;

    [Restrictions([NotNull])]
    [Column('TAXA_FINANCEIRA', ftBCD)]
    [Dictionary('TAXA_FINANCEIRA', 'Mensagem de validação', '0', '', '',
      taRightJustify)]
    property taxa_financeira: Double read FTAXA_FINANCEIRA
      write FTAXA_FINANCEIRA;

    [Restrictions([NotNull])]
    [Column('TIPO_COBRANCA', ftInteger)]
    [Dictionary('TIPO_COBRANCA', 'Mensagem de validação', '0', '', '',
      taCenter)]
    property tipo_cobranca: Integer read FTIPO_COBRANCA
      write FTIPO_COBRANCA;

    [Restrictions([NotNull])]
    [Column('LIGAR', ftInteger)]
    [Dictionary('LIGAR', 'Mensagem de validação', '0', '', '',
      taCenter)]
    property ligar: Integer read FLIGAR
      write FLIGAR;

    [Restrictions([NotNull])]
    [Column('AVISTA', ftInteger)]
    [Dictionary('AVISTA', 'Mensagem de validação', '0', '', '',
      taCenter)]
    property avista: Integer read FAVISTA
      write FAVISTA;

    [Column('OBS', ftString, 8000)]
    [Dictionary('OBS', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property obs: nullable<String> read FOBS write FOBS;

    [Restrictions([NotNull])]
    [Column('DT_INC', ftDateTime)]
    [Dictionary('DT_INC', 'Mensagem de validação', 'Now', '', '!##/##/####;1;_',
      taCenter)]
    property dt_inc: TDateTime read FDT_INC write FDT_INC;

    [Restrictions([NotNull])]
    [Column('DT_ALT', ftDateTime)]
    [Dictionary('DT_ALT', 'Mensagem de validação', 'Now', '', '!##/##/####;1;_',
      taCenter)]
    property dt_alt: TDateTime read FDT_ALT write FDT_ALT;

    [Column('DT_HAB', ftDateTime)]
    [Dictionary('DT_HAB', 'Mensagem de validação', '', '', '', taCenter)]
    property dt_hab: nullable<TDateTime> read FDT_HAB write FDT_HAB;

    [Restrictions([NotNull])]
    [Column('MARCA', ftInteger)]
    [Dictionary('MARCA', 'Mensagem de validação', '0', '', '',
      taCenter)]
    property marca: Integer read FMARCA
      write FMARCA;

    [Restrictions([NotNull])]
    [Column('BLOQUEADO', ftInteger)]
    [Dictionary('BLOQUEADO', 'Mensagem de validação', '0', '', '',
      taCenter)]
    property bloqueado: Integer read FBLOQUEADO
      write FBLOQUEADO;

    [Column('ID_CONFIG_CART_DIGITAL', ftInteger)]
    [Dictionary('ID_CONFIG_CART_DIGITAL', 'Mensagem de valida  o', '', '', '',
      taCenter)]
    property id_config_cart_digital: nullable<Integer>
      read FID_CONFIG_CART_DIGITAL write FID_CONFIG_CART_DIGITAL;

    [Column('ID_CONTA_BANCO', ftInteger)]
    [Dictionary('ID_CONTA_BANCO', 'Mensagem de validação', '', '', '',
      taCenter)]
    property id_conta_banco: nullable<Integer> read FID_CONTA_BANCO
      write FID_CONTA_BANCO;

  end;

implementation

constructor TPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO.Create;
begin
  //
end;

destructor TPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO.Destroy;
begin
  inherited;
end;

initialization

TRegisterClass.RegisterEntity(TPDV_NOTAS_FISCAIS_FORMA_PAGAMENTO)

end.
