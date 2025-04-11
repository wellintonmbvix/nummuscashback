unit controller.dto.pdv_notas_fiscais_cab.interfaces;

interface

uses
  model.pdv_notas_fiscais_cab,

  //** ORMBr
  ormbr.types.blob,
  model.service.interfaces,
  model.service.scripts.interfaces;

type
  IPDV_NOTAS_FISCAIS_CAB = interface
    ['{97E63BC5-047E-4F75-9ED2-C82C4F7ED13E}']

    function Build: IService<TPDV_NOTAS_FISCAIS_CAB>;
    function Factory: IServiceScripts;
  end;

implementation

end.
