unit model.contatoTelefone;

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
  [Table('contato_telefone', '')]
  [PrimaryKey('id_contato_telefone', TAutoIncType.AutoInc,
                                     TGeneratorType.SequenceInc,
                                     TSortingOrder.NoSort,
                                     True, 'Chave primária')]
  [Sequence('contato_telefone_id_contato_telefone_seq')]
  [OrderBy('id_contato_telefone')]
  Tcontato_telefone = class
  private
    { Private declarations }
    Fid_contato_telefone: Integer;
    Fid_tipo_telefone: Integer;
    Fid_contato: Integer;
    Ftelefone: String;
//    Fdt_alt: Nullable<TDateTime>;
//    Fdt_inc: Nullable<TDateTime>;
//    Fdt_hab: Nullable<TDateTime>;
  public
    { Public declarations }
    constructor Create;
    destructor Destroy; override;

    [Column('id_contato_telefone', ftInteger)]
    [Dictionary('id_contato_telefone', 'Mensagem de validação', '', '', '',
      taCenter)]
    property id_contato_telefone: Integer read Fid_contato_telefone
      write Fid_contato_telefone;

    [Restrictions([NotNull])]
    [Column('id_tipo_telefone', ftInteger)]
    [ForeignKey('FK_CONTATO_TELEFONE_TIPO_TELEFONE', 'id_tipo_telefone', 'tipo_telefone', 'id_tipo_telefone', None, None)]
    [Dictionary('id_tipo_telefone', 'Mensagem de validação', '', '', '',
      taCenter)]
    property id_tipo_telefone: Integer read Fid_tipo_telefone
      write Fid_tipo_telefone;

    [Restrictions([NotNull])]
    [Column('id_contato', ftInteger)]
    [ForeignKey('FK_CONTATO_TELEFONE_CONTATO', 'id_contato', 'contato', 'id_contato',
      Cascade, Cascade)]
    [Dictionary('id_contato', 'Mensagem de validação', '', '', '', taCenter)]
    property id_contato: Integer read Fid_contato write Fid_contato;

    [Restrictions([NotNull])]
    [Column('telefone', ftString, 20)]
    [Dictionary('telefone', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property telefone: String read Ftelefone write Ftelefone;

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

constructor Tcontato_telefone.Create;
begin
end;

destructor Tcontato_telefone.Destroy;
begin
  inherited;
end;

initialization

TRegisterClass.RegisterEntity(Tcontato_telefone)

end.
