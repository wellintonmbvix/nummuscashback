unit model.service.scripts.interfaces;

interface

uses
  FireDAC.Comp.Client;

type
  IServiceScripts = interface
    ['{F07BCE23-E739-4A69-8188-5EA265D1DB00}']

    function view_cadcliente(aFilter: String; var aList: TFDMemTable): IServiceScripts;
    function view_cadcolaborador(aFilter: String; var aList: TFDMemTable): IServiceScripts;
  end;

implementation

end.
