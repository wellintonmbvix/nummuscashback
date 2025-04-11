unit model.colaborador;

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
  [Table('colaborador', '')]
  [PrimaryKey('id_colaborador', TAutoIncType.AutoInc,
                                TGeneratorType.NoneInc,
                                TSortingOrder.NoSort,
                                True, 'Chave primária')]
  [Sequence('colaborador_id_colaborador_seq')]
  [OrderBy('id_colaborador')]
  Tcolaborador = class
  private
    { Private declarations }
    Fid_colaborador: nullable<Integer>;
    Fcodigo: Integer;
    Fid_empresa: Integer;
    Fid_tipo_admissao: nullable<Integer>;
    Fid_situacao_colaborador: nullable<Integer>;
    Fid_pessoa: Integer;
    Fid_tipo_colaborador: nullable<Integer>;
    Fid_nivel_formacao: nullable<Integer>;
    Fid_cargo: nullable<Integer>;
    Fid_setor: nullable<Integer>;
    Fmatricula: nullable<String>;
    Ftipo_sanguineo: nullable<String>;
    Fdata_cadastro: nullable<TDateTime>;
    Fdata_admissao: nullable<TDateTime>;
    Fvencimento_ferias: nullable<TDateTime>;
    Fdata_transferencia: nullable<TDateTime>;
    Ffgts_data_opcao: nullable<TDateTime>;
    Ffgts_conta: nullable<Integer>;
    Fpagamento_forma: nullable<String>;
    Fpagamento_banco: nullable<String>;
    Fpagamento_agencia: nullable<Integer>;
    Fpagamento_agencia_digito: nullable<Integer>;
    Fpagamento_conta: nullable<Integer>;
    Fpagamento_conta_digito: nullable<Integer>;
    Fexame_medido_ultimo: nullable<TDateTime>;
    Fexame_medico_vencimento: nullable<TDateTime>;
    Fpis_data_cadastro: nullable<TDateTime>;
    Fpis_numero: nullable<Integer>;
    Fpis_banco: nullable<String>;
    Fpis_agencia: nullable<Integer>;
    Fpis_agencia_digito: nullable<Integer>;
    Fctps_numero: nullable<String>;
    Fctps_serie: nullable<String>;
    Fctps_data_expedicao: nullable<TDateTime>;
    Fctps_uf: nullable<String>;
    Fcategoria_sefip: nullable<String>;
    Fobservacoes: nullable<String>;
    Ffoto: TBlob;
    Fdesconto: Double;
    Flimite_credito: Double;
    Fdata_demissao: nullable<TDateTime>;
    Fsalario: Double;
    Fdt_inc: nullable<TDateTime>;
    Fdt_alt: nullable<TDateTime>;
    Fdt_hab: nullable<TDateTime>;

  public
    { Public declarations }
    constructor Create;
    destructor Destroy; override;

    [Column('id_colaborador', ftInteger)]
    [Dictionary('id_colaborador', 'Mensagem de validação', '', '', '',
      taCenter)]
    property id_colaborador: nullable<Integer> read Fid_colaborador
      write Fid_colaborador;

    [Restrictions([NotNull])]
    [Column('codigo', ftInteger)]
    [Dictionary('codigo', 'Mensagem de validação', '', '', '', taCenter)]
    property codigo: Integer read Fcodigo write Fcodigo;

    [Restrictions([NotNull])]
    [Column('id_empresa', ftInteger)]
    [ForeignKey('fk_colaborador_empresa', 'id_empresa', 'empresa', 'id_empresa',
      None, None)]
    [Dictionary('id_empresa', 'Mensagem de validação', '', '', '', taCenter)]
    property id_empresa: Integer read Fid_empresa write Fid_empresa;

    [Column('id_tipo_admissao', ftInteger)]
    [ForeignKey('fk_colaborador_tipo_admissao', 'id_tipo_admissao',
      'tipo_admissao', 'id_tipo_admissao', SetNull, SetNull)]
    [Dictionary('id_tipo_admissao', 'Mensagem de validação', '', '', '',
      taCenter)]
    property id_tipo_admissao: nullable<Integer> read Fid_tipo_admissao
      write Fid_tipo_admissao;

    [Column('id_situacao_colaborador', ftInteger)]
    [ForeignKey('fk_colaborador_situacao_colaborador',
      'id_situacao_colaborador', 'situacao_colaborador',
      'id_situacao_colaborador', SetNull, SetNull)]
    [Dictionary('id_situacao_colaborador', 'Mensagem de validação', '', '', '',
      taCenter)]
    property id_situacao_colaborador: nullable<Integer>
      read Fid_situacao_colaborador write Fid_situacao_colaborador;

    [Restrictions([NotNull])]
    [Column('id_pessoa', ftInteger)]
    [ForeignKey('fk_colaborador_pessoa', 'id_pessoa', 'pessoa', 'id_pessoa',
      Cascade, Cascade)]
    [Dictionary('id_pessoa', 'Mensagem de validação', '', '', '', taCenter)]
    property id_pessoa: Integer read Fid_pessoa write Fid_pessoa;

    [Column('id_tipo_colaborador', ftInteger)]
    [ForeignKey('fk_colaborador_tipo_colaborador', 'id_tipo_colaborador',
      'tipo_colaborador', 'id_tipo_colaborador', SetNull, SetNull)]
    [Dictionary('id_tipo_colaborador', 'Mensagem de validação', '', '', '',
      taCenter)]
    property id_tipo_colaborador: nullable<Integer> read Fid_tipo_colaborador
      write Fid_tipo_colaborador;

    [Column('id_nivel_formacao', ftInteger)]
    [ForeignKey('fk_colaborador_nivel_formacao', 'id_nivel_formacao',
      'nivel_formacao', 'id_nivel_formacao', SetNull, SetNull)]
    [Dictionary('id_nivel_formacao', 'Mensagem de validação', '', '', '',
      taCenter)]
    property id_nivel_formacao: nullable<Integer> read Fid_nivel_formacao
      write Fid_nivel_formacao;

    [Column('id_cargo', ftInteger)]
    [ForeignKey('fk_colaborador_cargo', 'id_cargo', 'cargo', 'cargo',
      SetNull, SetNull)]
    [Dictionary('id_cargo', 'Mensagem de validação', '', '', '', taCenter)]
    property id_cargo: nullable<Integer> read Fid_cargo write Fid_cargo;

    [Column('id_setor', ftInteger)]
    [ForeignKey('fk_colaborador_setor', 'id_setor', 'setor', 'setor',
      SetNull, SetNull)]
    [Dictionary('id_setor', 'Mensagem de validação', '', '', '', taCenter)]
    property id_setor: nullable<Integer> read Fid_setor write Fid_setor;

    [Column('matricula', ftString, 15)]
    [Dictionary('matricula', 'Mensagem de validação', '', '', '',
      taLeftJustify)]
    property matricula: nullable<String> read Fmatricula write Fmatricula;

    [Column('tipo_sanguineo', ftString, 5)]
    [Dictionary('tipo_sanguineo', 'Mensagem de validação', '', '', '',
      taLeftJustify)]
    property tipo_sanguineo: nullable<String> read Ftipo_sanguineo
      write Ftipo_sanguineo;

    [Column('data_cadastro', ftDateTime)]
    [Dictionary('data_cadastro', 'Mensagem de validação', '', '', '', taCenter)]
    property data_cadastro: nullable<TDateTime> read Fdata_cadastro
      write Fdata_cadastro;

    [Column('data_admissao', ftDateTime)]
    [Dictionary('data_admissao', 'Mensagem de validação', '', '', '', taCenter)]
    property data_admissao: nullable<TDateTime> read Fdata_admissao
      write Fdata_admissao;

    [Column('vencimento_ferias', ftDateTime)]
    [Dictionary('vencimento_ferias', 'Mensagem de validação', '', '', '',
      taCenter)]
    property vencimento_ferias: nullable<TDateTime> read Fvencimento_ferias
      write Fvencimento_ferias;

    [Column('data_transferencia', ftDateTime)]
    [Dictionary('data_transferencia', 'Mensagem de validação', '', '', '',
      taCenter)]
    property data_transferencia: nullable<TDateTime> read Fdata_transferencia
      write Fdata_transferencia;

    [Column('fgts_data_opcao', ftDateTime)]
    [Dictionary('fgts_data_opcao', 'Mensagem de validação', '', '', '',
      taCenter)]
    property fgts_data_opcao: nullable<TDateTime> read Ffgts_data_opcao
      write Ffgts_data_opcao;

    [Column('fgts_conta', ftInteger)]
    [Dictionary('fgts_conta', 'Mensagem de validação', '', '', '', taCenter)]
    property fgts_conta: nullable<Integer> read Ffgts_conta write Ffgts_conta;

    [Column('pagamento_forma', ftString, 1)]
    [Dictionary('pagamento_forma', 'Mensagem de validação', '', '', '',
      taLeftJustify)]
    property pagamento_forma: nullable<String> read Fpagamento_forma
      write Fpagamento_forma;

    [Column('pagamento_banco', ftString, 15)]
    [Dictionary('pagamento_banco', 'Mensagem de validação', '', '', '',
      taLeftJustify)]
    property pagamento_banco: nullable<String> read Fpagamento_banco
      write Fpagamento_banco;

    [Column('pagamento_agencia', ftInteger)]
    [Dictionary('pagamento_agencia', 'Mensagem de validação', '', '', '',
      taCenter)]
    property pagamento_agencia: nullable<Integer> read Fpagamento_agencia
      write Fpagamento_agencia;

    [Column('pagamento_agencia_digito', ftInteger)]
    [Dictionary('pagamento_agencia_digito', 'Mensagem de validação', '', '', '',
      taCenter)]
    property pagamento_agencia_digito: nullable<Integer>
      read Fpagamento_agencia_digito write Fpagamento_agencia_digito;

    [Column('pagamento_conta', ftInteger)]
    [Dictionary('pagamento_conta', 'Mensagem de validação', '', '', '',
      taCenter)]
    property pagamento_conta: nullable<Integer> read Fpagamento_conta
      write Fpagamento_conta;

    [Column('pagamento_conta_digito', ftInteger)]
    [Dictionary('pagamento_conta_digito', 'Mensagem de validação', '', '', '',
      taCenter)]
    property pagamento_conta_digito: nullable<Integer>
      read Fpagamento_conta_digito write Fpagamento_conta_digito;

    [Column('exame_medido_ultimo', ftDateTime)]
    [Dictionary('exame_medido_ultimo', 'Mensagem de validação', '', '', '',
      taCenter)]
    property exame_medido_ultimo: nullable<TDateTime> read Fexame_medido_ultimo
      write Fexame_medido_ultimo;

    [Column('exame_medico_vencimento', ftDateTime)]
    [Dictionary('exame_medico_vencimento', 'Mensagem de validação', '', '', '',
      taCenter)]
    property exame_medico_vencimento: nullable<TDateTime>
      read Fexame_medico_vencimento write Fexame_medico_vencimento;

    [Column('pis_data_cadastro', ftDateTime)]
    [Dictionary('pis_data_cadastro', 'Mensagem de validação', '', '', '',
      taCenter)]
    property pis_data_cadastro: nullable<TDateTime> read Fpis_data_cadastro
      write Fpis_data_cadastro;

    [Column('pis_numero', ftInteger)]
    [Dictionary('pis_numero', 'Mensagem de validação', '', '', '', taCenter)]
    property pis_numero: nullable<Integer> read Fpis_numero write Fpis_numero;

    [Column('pis_banco', ftString, 15)]
    [Dictionary('pis_banco', 'Mensagem de validação', '', '', '',
      taLeftJustify)]
    property pis_banco: nullable<String> read Fpis_banco write Fpis_banco;

    [Column('pis_agencia', ftInteger)]
    [Dictionary('pis_agencia', 'Mensagem de validação', '', '', '', taCenter)]
    property pis_agencia: nullable<Integer> read Fpis_agencia
      write Fpis_agencia;

    [Column('pis_agencia_digito', ftInteger)]
    [Dictionary('pis_agencia_digito', 'Mensagem de validação', '', '', '',
      taCenter)]
    property pis_agencia_digito: nullable<Integer> read Fpis_agencia_digito
      write Fpis_agencia_digito;

    [Column('ctps_numero', ftString, 15)]
    [Dictionary('ctps_numero', 'Mensagem de validação', '', '', '',
      taLeftJustify)]
    property ctps_numero: nullable<String> read Fctps_numero write Fctps_numero;

    [Column('ctps_serie', ftString, 15)]
    [Dictionary('ctps_serie', 'Mensagem de validação', '', '', '',
      taLeftJustify)]
    property ctps_serie: nullable<String> read Fctps_serie write Fctps_serie;

    [Column('ctps_data_expedicao', ftDateTime)]
    [Dictionary('ctps_data_expedicao', 'Mensagem de validação', '', '', '',
      taCenter)]
    property ctps_data_expedicao: nullable<TDateTime> read Fctps_data_expedicao
      write Fctps_data_expedicao;

    [Column('ctps_uf', ftString, 2)]
    [Dictionary('ctps_uf', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property ctps_uf: nullable<String> read Fctps_uf write Fctps_uf;

    [Column('categoria_sefip', ftString, 2)]
    [Dictionary('categoria_sefip', 'Mensagem de validação', '', '', '',
      taLeftJustify)]
    property categoria_sefip: nullable<String> read Fcategoria_sefip
      write Fcategoria_sefip;

    [Column('observacoes', ftString, 8000)]
    [Dictionary('observacoes', 'Mensagem de validação', '', '', '',
      taLeftJustify)]
    property observacoes: nullable<String> read Fobservacoes write Fobservacoes;

    [Column('foto', ftBlob)]
    [Dictionary('foto', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property foto: TBlob read Ffoto write Ffoto;

    [Restrictions([NotNull])]
    [Column('desconto', ftBCD)]
    [Dictionary('desconto', 'Mensagem de validação', '0', '', '',
      taRightJustify)]
    property desconto: Double read Fdesconto write Fdesconto;

    [Restrictions([NotNull])]
    [Column('limite_credito', ftBCD)]
    [Dictionary('limite_credito', 'Mensagem de validação', '0', '', '',
      taRightJustify)]
    property limite_credito: Double read Flimite_credito write Flimite_credito;

    [Column('data_demissao', ftDateTime)]
    [Dictionary('data_demissao', 'Mensagem de validação', '', '', '', taCenter)]
    property data_demissao: nullable<TDateTime> read Fdata_demissao
      write Fdata_demissao;

    [Restrictions([NotNull])]
    [Column('salario', ftBCD)]
    [Dictionary('salario', 'Mensagem de validação', '0', '', '',
      taRightJustify)]
    property salario: Double read Fsalario write Fsalario;

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

  end;

implementation

constructor Tcolaborador.Create;
begin
end;

destructor Tcolaborador.Destroy;
begin
  inherited;
end;

initialization

TRegisterClass.RegisterEntity(Tcolaborador)

end.
