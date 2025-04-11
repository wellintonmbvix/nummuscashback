unit controller.dto.parametros.interfaces.impl;

interface

uses
  System.SysUtils,

  model.service.interfaces,
  model.service.interfaces.impl,
  model.service.scripts.interfaces,
  model.service.scripts.interfaces.impl,
  model.parametros,

  ormbr.objects.helper,
  dbcbr.mapping.explorer,
  ormbr.json,
  ormbr.rtti.helper,

  controller.dto.parametros.interfaces;

type
  TIPARAMETRO = class(TInterfacedObject, IPARAMETRO)
    private
      FEntity: TPARAMETROS;
      FService: IService<TPARAMETROS>;
      FServiceScripts: IServiceScripts;
    public
      constructor Create;
      destructor Destroy; override;
      class function New: IPARAMETRO;

      function Build: IService<TPARAMETROS>;
      function Factory: IServiceScripts;
  end;

implementation

{ TIPARAMETRO }

function TIPARAMETRO.Build: IService<TPARAMETROS>;
begin
  Result := FService
end;

constructor TIPARAMETRO.Create;
begin
  FEntity := TPARAMETROS.Create;
  FService := TServiceORMBr<TPARAMETROS>.New(FEntity);
  FServiceScripts := TServiceScripts.New;
end;

destructor TIPARAMETRO.Destroy;
begin
  FreeAndNil(FEntity);
  inherited;
end;

function TIPARAMETRO.Factory: IServiceScripts;
begin
  Result := FServiceScripts;
end;

class function TIPARAMETRO.New: IPARAMETRO;
begin
  Result := Self.Create;
end;

end.
