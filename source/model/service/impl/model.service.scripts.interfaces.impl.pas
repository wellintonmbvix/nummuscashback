unit model.service.scripts.interfaces.impl;

interface

uses
  System.StrUtils,
  System.Generics.Collections,
  System.SysUtils,
  System.Rtti,
  System.TypInfo,

  dbebr.factory.interfaces,
  dbebr.factory.firedac,
  cqlbr.select.mssql,
  cqlbr.serialize.mssql,
  ormbr.criteria.resultset,

  Firedac.Comp.Client,
  Firedac.Comp.DataSet,
  Firedac.UI.Intf,
  Firedac.VCLUI.Wait,
  Firedac.Comp.UI,

  model.service.scripts.interfaces,
  model.resource.interfaces;

type
  TServiceScripts = class(TInterfacedObject, IServiceScripts)
    private
      FConnection: IConnection;
      FConnectionORM: IDBConnection;
      FDGUIxWaitCursor: TFDGUIxWaitCursor;
    public
      constructor Create;
      destructor Destroy; override;
      class function New: IServiceScripts;

      function view_cadcliente(aFilter: String; var aList: TFDMemTable): IServiceScripts;
      function view_cadcolaborador(aFilter: String; var aList: TFDMemTable): IServiceScripts;
  end;

implementation

{ TServiceScripts }

uses
  cqlbr.interfaces,
  criteria.query.language,
  model.resource.impl.factory;

constructor TServiceScripts.Create;
begin
  FConnection := TResource.New.Connection;
  FConnectionORM := TFactoryFiredac.Create
    (TFDConnection(FConnection.Connect), dnMSSQL);
  FDGUIxWaitCursor := TFDGUIxWaitCursor.Create(nil);
end;

destructor TServiceScripts.Destroy;
begin
  FreeAndNil(FDGUIxWaitCursor);
  inherited;
end;

class function TServiceScripts.New: IServiceScripts;
begin
  Result := Self.Create;
end;

function TServiceScripts.view_cadcliente(aFilter: String;
  var aList: TFDMemTable): IServiceScripts;
var
  LSQL: String;
  LResultSet: IDBResultSet;
begin
  Result := Self;
  LSQL := TCQL.New(dbnMSSQL)
      .Select
          .Column('ID_CLIENTE')
          .Column('CODIGO')
          .Column('ID_EMPRESA')
          .Column('ID_PESSOA')
          .Column('NOME_PESSOA')
          .Column('NOME')
          .Column('ABREVIADO')
          .Column('CPFCNPJ')
          .Column('NOME_RAZAO')
          .Column('IE_RG')
          .Column('CEP')
          .Column('LOGRADOURO')
          .Column('NUMERO')
          .Column('COMPLEMENTO')
          .Column('BAIRRO')
          .Column('CIDADE')
          .Column('MUNICIPIO_IBGE')
          .Column('UF')
          .Column('TELEFONE')
          .Column('CELULAR')
          .Column('EMAIL')
          .Column('DATA_CADASTRO')
      .From('VW_CADCLIENTE')
      .Where(aFilter)
    .AsString;

  LResultSet := TCriteria.New.SetConnection(FConnectionORM).SQL(LSQL)
    .AsResultSet;

  if aList.Active then
    aList.EmptyDataSet;

  if LResultSet.RecordCount > 0 then
    aList.CloneCursor(TFDDataSet(LResultSet.DataSet));
end;

function TServiceScripts.view_cadcolaborador(aFilter: String;
  var aList: TFDMemTable): IServiceScripts;
var
  LSQL: String;
  LResultSet: IDBResultSet;
begin
  Result := Self;
  LSQL := TCQL.New(dbnMSSQL)
      .Select
        .Column('ID_COLABORADOR')
        .Column('CODIGO')
        .Column('NOME')
        .Column('ABREVIADO')
        .Column('CPF')
        .Column('RG')
      .From('VW_CADCOLABORADOR')
      .Where(aFilter)
    .AsString;


  LResultSet := TCriteria.New.SetConnection(FConnectionORM).SQL(LSQL)
    .AsResultSet;

  if aList.Active then
    aList.EmptyDataSet;

  if LResultSet.RecordCount > 0 then
    aList.CloneCursor(TFDDataSet(LResultSet.DataSet));
end;

end.
