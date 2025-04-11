unit controller.dto.parametros.interfaces;

interface

uses
  model.parametros,

  //** ORMBr
  ormbr.types.blob,
  model.service.interfaces,
  model.service.scripts.interfaces;

type
  IPARAMETRO = interface
    ['{0E70E028-C769-4185-81F4-965D3A424B9F}']

    function Build: IService<TPARAMETROS>;
    function Factory: IServiceScripts;
  end;

implementation

end.
