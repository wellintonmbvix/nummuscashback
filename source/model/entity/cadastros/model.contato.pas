unit model.contato;

interface

uses
  Data.DB,
  System.Classes,
  System.SysUtils,
  System.Generics.Collections,

  // orm models
  model.contatoTelefone,
  model.contatoEmail,

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
  [Table('contato', '')]
  [PrimaryKey('id_contato', TAutoIncType.AutoInc,
                            TGeneratorType.SequenceInc,
                            TSortingOrder.NoSort,
                            True, 'Chave primária')]
  [Sequence('contato_id_contato_seq')]
  [OrderBy('id_contato')]
  Tcontato = class
  private
    { Private declarations }
    Fid_contato: Integer;
    Fid_pessoa: Integer;
    Fnome: String;
    Fcontato_telefone: TObjectList<Tcontato_telefone>;
    Fcontato_email: TObjectList<Tcontato_email>;
//    Fdt_alt: Nullable<TDateTime>;
//    Fdt_inc: Nullable<TDateTime>;
//    Fdt_hab: Nullable<TDateTime>;
  public 
    { Public declarations } 
    constructor Create;
    destructor Destroy; override;

    [Column('id_contato', ftInteger)]
    [Dictionary('id_contato', 'Mensagem de validação', '', '', '', taCenter)]
    property id_contato: Integer read Fid_contato write Fid_contato;

    [Restrictions([NotNull])]
    [Column('id_pessoa', ftInteger)]
    [ForeignKey('FK_CONTATO_PESSOA', 'id_pessoa', 'pessoa', 'id_pessoa',
      Cascade, Cascade)]
    [Dictionary('id_pessoa', 'Mensagem de validação', '', '', '', taCenter)]
    property id_pessoa: Integer read Fid_pessoa write Fid_pessoa;

    [Restrictions([NotNull])]
    [Column('nome', ftString, 100)]
    [Dictionary('nome', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property nome: String read Fnome write Fnome;

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


    [Association(TMultiplicity.OneToMany, 'id_contato', 'contato_telefone', 'id_contato')]
    [CascadeActions([TCascadeAction.CascadeAutoInc,
                     TCascadeAction.CascadeInsert,
                     TCascadeAction.CascadeUpdate,
                     TCascadeAction.CascadeDelete])]
    property contato_telefone: TObjectList<Tcontato_telefone> read Fcontato_telefone write Fcontato_telefone;

    [Association(TMultiplicity.OneToMany, 'id_contato', 'contato_email', 'id_contato')]
    [CascadeActions([TCascadeAction.CascadeAutoInc,
                     TCascadeAction.CascadeInsert,
                     TCascadeAction.CascadeUpdate,
                     TCascadeAction.CascadeDelete])]
    property contato_email: TObjectList<Tcontato_email> read Fcontato_email write Fcontato_email;

    procedure AdicionarContatoTelefone(nTipo: Integer = 1; aTel: String = '';
      nIdContato: Integer = 0);

    procedure AdicionarContatoEmail(nIdContato: Integer = 0; nTipo: Integer = 1;
      aEmail: String = '');
  end;

implementation

procedure Tcontato.AdicionarContatoEmail(nIdContato, nTipo: Integer;
  aEmail: String);
begin
  Fcontato_email.Add(Tcontato_email.Create);
  With Fcontato_email.Last Do
    Begin
      id_contato := nIdContato;
      id_tipo_email := nTipo;
      email := aEmail;
    End;
end;

procedure Tcontato.AdicionarContatoTelefone(nTipo: Integer = 1; aTel: String = ''; nIdContato: Integer = 0);
begin
  Fcontato_telefone.Add(Tcontato_telefone.Create);
  With Fcontato_telefone.Last Do
    Begin
      id_tipo_telefone := nTipo;
      id_contato := nIdContato;
      telefone := aTel;
    End;
end;

constructor Tcontato.Create;
begin
  Fcontato_telefone := TObjectList<Tcontato_telefone>.Create;
  Fcontato_email := TObjectList<Tcontato_email>.Create;
end;

destructor Tcontato.Destroy;
begin
  FreeAndNil(Fcontato_telefone);
  FreeAndNil(Fcontato_email);
  inherited;
end;

initialization
  TRegisterClass.RegisterEntity(Tcontato)

end.
