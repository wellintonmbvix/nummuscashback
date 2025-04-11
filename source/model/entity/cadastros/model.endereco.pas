unit model.endereco;

interface

uses
  DB, 
  Classes, 
  SysUtils, 
  Generics.Collections, 

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
  [Table('endereco', '')]
  [PrimaryKey('id_endereco', TAutoIncType.AutoInc,
                             TGeneratorType.SequenceInc,
                             TSortingOrder.NoSort,
                             True, 'Chave primária')]
  [Sequence('endereco_id_endereco_seq')]
  [OrderBy('id_endereco')]
  Tendereco = class
  private
    { Private declarations } 
    Fid_endereco: Nullable<Integer>;
    Fid_pessoa: Integer;
    Frotulo: String;
    Fcep: String;
    Flogradouro: String;
    Fnumero: Nullable<String>;
    Fcomplemento: Nullable<String>;
    Fbairro: String;
    Fcidade: String;
    Fmunicipio_ibge: Nullable<Integer>;
    Fuf: String;
    Fpais_ibge: Nullable<Integer>;
    Ffone: String;
    Fcelular: Nullable<String>;
    Fponto_referencia: Nullable<String>;
    Fdt_inc: Nullable<TDateTime>;
    Fdt_alt: Nullable<TDateTime>;
    Fdt_hab: Nullable<TDateTime>;
  public 
    { Public declarations } 
    [Column('id_endereco', ftInteger)]
    [Dictionary('id_endereco', 'Mensagem de validação', '', '', '', taCenter)]
    property id_endereco: Nullable<Integer> read Fid_endereco write Fid_endereco;

    [Restrictions([NotNull])]
    [Column('id_pessoa', ftInteger)]
    [ForeignKey('fk_endereco_pessoa', 'id_pessoa', 'pessoa', 'id_pessoa',
      Cascade, Cascade)]
    [Dictionary('id_pessoa', 'Mensagem de validação', '', '', '', taCenter)]
    property id_pessoa: Integer read Fid_pessoa write Fid_pessoa;

    [Restrictions([NotNull])]
    [Column('rotulo', ftString, 100)]
    [Dictionary('rotulo', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property rotulo: String read Frotulo write Frotulo;

    [Restrictions([NotNull])]
    [Column('cep', ftString, 9)]
    [Dictionary('cep', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property cep: String read Fcep write Fcep;

    [Restrictions([NotNull])]
    [Column('logradouro', ftString, 150)]
    [Dictionary('logradouro', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property logradouro: String read Flogradouro write Flogradouro;

    [Column('numero', ftString, 15)]
    [Dictionary('numero', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property numero: Nullable<String> read Fnumero write Fnumero;

    [Column('complemento', ftString, 100)]
    [Dictionary('complemento', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property complemento: Nullable<String> read Fcomplemento write Fcomplemento;

    [Restrictions([NotNull])]
    [Column('bairro', ftString, 100)]
    [Dictionary('bairro', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property bairro: String read Fbairro write Fbairro;

    [Restrictions([NotNull])]
    [Column('cidade', ftString, 100)]
    [Dictionary('cidade', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property cidade: String read Fcidade write Fcidade;

    [Column('municipio_ibge', ftInteger)]
    [Dictionary('municipio_ibge', 'Mensagem de validação', '', '', '', taCenter)]
    property municipio_ibge: Nullable<Integer> read Fmunicipio_ibge write Fmunicipio_ibge;

    [Restrictions([NotNull])]
    [Column('uf', ftString, 2)]
    [Dictionary('uf', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property uf: String read Fuf write Fuf;

    [Column('pais_ibge', ftInteger)]
    [Dictionary('pais_ibge', 'Mensagem de validação', '', '', '', taCenter)]
    property pais_ibge: Nullable<Integer> read Fpais_ibge write Fpais_ibge;

    [Restrictions([NotNull])]
    [Column('fone', ftString, 20)]
    [Dictionary('fone', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property fone: String read Ffone write Ffone;

    [Column('celular', ftString, 20)]
    [Dictionary('celular', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property celular: Nullable<String> read Fcelular write Fcelular;

    [Column('ponto_referencia', ftString, 8000)]
    [Dictionary('ponto_referencia', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property ponto_referencia: Nullable<String> read Fponto_referencia write Fponto_referencia;

    [Column('dt_inc', ftDateTime)]
    [Dictionary('dt_inc', 'Mensagem de validação', 'Now', '', '!##/##/####;1;_', taCenter)]
    property dt_inc: Nullable<TDateTime> read Fdt_inc write Fdt_inc;

    [Column('dt_alt', ftDateTime)]
    [Dictionary('dt_alt', 'Mensagem de validação', 'Now', '', '!##/##/####;1;_', taCenter)]
    property dt_alt: Nullable<TDateTime> read Fdt_alt write Fdt_alt;

    [Column('dt_hab', ftDateTime)]
    [Dictionary('dt_hab', 'Mensagem de validação', '', '', '', taCenter)]
    property dt_hab: Nullable<TDateTime> read Fdt_hab write Fdt_hab;

  end;

implementation

initialization
  TRegisterClass.RegisterEntity(Tendereco)

end.
