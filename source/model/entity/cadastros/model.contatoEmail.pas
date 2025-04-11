unit model.contatoEmail;

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
  [Table('contato_email', '')]
  [PrimaryKey('id_contato_email', TAutoIncType.AutoInc,
                                  TGeneratorType.SequenceInc,
                                  TSortingOrder.NoSort,
                                  True, 'Chave primária')]
  [Sequence('contato_email_id_contato_email_seq"')]
  [OrderBy('id_contato_email')]
  Tcontato_email = class
  private
    { Private declarations }
    Fid_contato_email: Nullable<Integer>;
    Fid_tipo_email: Integer;
    Fid_contato: Integer;
    Femail: String;
//    Fdt_alt: Nullable<TDateTime>;
//    Fdt_inc: Nullable<TDateTime>;
//    Fdt_hab: Nullable<TDateTime>;
  public 
    { Public declarations } 
    constructor Create;
    destructor Destroy; override;

    [Column('id_contato_email', ftInteger)]
    [Dictionary('id_contato_email', 'Mensagem de validação', '', '', '', taCenter)]
    property id_contato_email: Nullable<Integer> read Fid_contato_email write Fid_contato_email;

    [Restrictions([NotNull])]
    [Column('id_contato', ftInteger)]
    [ForeignKey('FK_CONTATO_TELEFONE_CONTATO', 'id_contato', 'contato', 'id_contato',
      Cascade, Cascade)]
    [Dictionary('id_contato', 'Mensagem de validação', '', '', '', taCenter)]
    property id_contato: Integer read Fid_contato write Fid_contato;

    [Restrictions([NotNull])]
    [Column('id_tipo_email', ftInteger)]
    [ForeignKey('FK_CONTATO_EMAIL_TIPO_EMAIL', 'id_tipo_email', 'tipo_email', 'id_tipo_email', None, None)]
    [Dictionary('id_tipo_email', 'Mensagem de validação', '', '', '', taCenter)]
    property id_tipo_email: Integer read Fid_tipo_email write Fid_tipo_email;

    [Restrictions([NotNull])]
    [Column('email', ftString, 255)]
    [Dictionary('email', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property email: String read Femail write Femail;

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

constructor Tcontato_email.Create;
begin

end;

destructor Tcontato_email.Destroy;
begin

  inherited;
end;

initialization
  TRegisterClass.RegisterEntity(Tcontato_email)

end.
