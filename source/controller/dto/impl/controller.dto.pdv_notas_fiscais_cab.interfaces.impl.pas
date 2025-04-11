unit controller.dto.pdv_notas_fiscais_cab.interfaces.impl;

interface

uses
  System.SysUtils,

  model.service.interfaces,
  model.service.interfaces.impl,
  model.service.scripts.interfaces,
  model.service.scripts.interfaces.impl,
  model.pdv_notas_fiscais_cab,

  ormbr.objects.helper,
  dbcbr.mapping.explorer,
  ormbr.json,
  ormbr.rtti.helper,

  controller.dto.pdv_notas_fiscais_cab.interfaces;

type
  TIPDV_NOTAS_FISCAIS_CAB = class(TInterfacedObject, IPDV_NOTAS_FISCAIS_CAB)
    private
      FEntity: TPDV_NOTAS_FISCAIS_CAB;
      FService: IService<TPDV_NOTAS_FISCAIS_CAB>;
      FServiceScripts: IServiceScripts;
    public
      constructor Create;
      destructor Destroy; override;
      class function New: IPDV_NOTAS_FISCAIS_CAB;

      function Build: IService<TPDV_NOTAS_FISCAIS_CAB>;
      function Factory: IServiceScripts;

  end;

implementation

{ TIControllerPlenus }

function TIPDV_NOTAS_FISCAIS_CAB.Build: IService<TPDV_NOTAS_FISCAIS_CAB>;
begin
  Result := FService;
end;

constructor TIPDV_NOTAS_FISCAIS_CAB.Create;
begin
  FEntity := TPDV_NOTAS_FISCAIS_CAB.Create;
  FService := TServiceORMBr<TPDV_NOTAS_FISCAIS_CAB>.New(FEntity);
  FServiceScripts := TServiceScripts.New;
end;

destructor TIPDV_NOTAS_FISCAIS_CAB.Destroy;
begin
  FreeAndNil(FEntity);
  inherited;
end;

function TIPDV_NOTAS_FISCAIS_CAB.Factory: IServiceScripts;
begin
  Result := FServiceScripts;
end;

class function TIPDV_NOTAS_FISCAIS_CAB.New: IPDV_NOTAS_FISCAIS_CAB;
begin
  Result := Self.Create;
end;

end.
