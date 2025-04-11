program CashBackNummus;

uses
  {$IFDEF MSWINDOWS}
  {$IFDEF DEBUG}
  FastMM4,
  {$ENDIF }
  {$ENDIF }
  Vcl.Forms,
  System.SysUtils,
  uPrincipal in 'source\view\uPrincipal.pas' {fPrincipal},
  model.resource.interfaces in 'source\model\resource\model.resource.interfaces.pas',
  model.resource.impl.configuration in 'source\model\resource\impl\model.resource.impl.configuration.pas',
  model.resource.impl.connection.firedac in 'source\model\resource\impl\model.resource.impl.connection.firedac.pas',
  model.resource.impl.factory in 'source\model\resource\impl\model.resource.impl.factory.pas',
  routines in 'source\rotinas\routines.pas',
  model.service.interfaces in 'source\model\service\model.service.interfaces.pas',
  model.service.interfaces.impl in 'source\model\service\impl\model.service.interfaces.impl.pas',
  controller.dto.pdv_notas_fiscais_cab.interfaces in 'source\controller\dto\controller.dto.pdv_notas_fiscais_cab.interfaces.pas',
  controller.dto.pdv_notas_fiscais_cab.interfaces.impl in 'source\controller\dto\impl\controller.dto.pdv_notas_fiscais_cab.interfaces.impl.pas',
  controller.plenus in 'source\controller\controller.plenus.pas',
  model.service.scripts.interfaces in 'source\model\service\model.service.scripts.interfaces.pas',
  model.service.scripts.interfaces.impl in 'source\model\service\impl\model.service.scripts.interfaces.impl.pas',
  model.pdv_notas_fiscais_cab in 'source\model\entity\vendas\model.pdv_notas_fiscais_cab.pas',
  model.pdv_notas_fiscais_forma_pagamento in 'source\model\entity\vendas\model.pdv_notas_fiscais_forma_pagamento.pas',
  model.pdv_notas_fiscais_item in 'source\model\entity\vendas\model.pdv_notas_fiscais_item.pas',
  model.cliente in 'source\model\entity\cadastros\model.cliente.pas',
  model.colaborador in 'source\model\entity\cadastros\model.colaborador.pas',
  model.contato in 'source\model\entity\cadastros\model.contato.pas',
  model.contatoEmail in 'source\model\entity\cadastros\model.contatoEmail.pas',
  model.contatoTelefone in 'source\model\entity\cadastros\model.contatoTelefone.pas',
  model.pessoa in 'source\model\entity\cadastros\model.pessoa.pas',
  model.pessoaFisica in 'source\model\entity\cadastros\model.pessoaFisica.pas',
  model.pessoaJuridica in 'source\model\entity\cadastros\model.pessoaJuridica.pas',
  controller.dto.pessoa.interfaces in 'source\controller\dto\controller.dto.pessoa.interfaces.pas',
  model.endereco in 'source\model\entity\cadastros\model.endereco.pas',
  controller.dto.pessoa.interfaces.impl in 'source\controller\dto\impl\controller.dto.pessoa.interfaces.impl.pas',
  model.produto in 'source\model\entity\cadastros\model.produto.pas',
  model.parametros in 'source\model\entity\configuracoes\model.parametros.pas',
  controller.dto.parametros.interfaces in 'source\controller\dto\controller.dto.parametros.interfaces.pas',
  controller.dto.parametros.interfaces.impl in 'source\controller\dto\impl\controller.dto.parametros.interfaces.impl.pas',
  controller.dto.pdv_notas_fiscais_forma_pagamento.interfaces in 'source\controller\dto\controller.dto.pdv_notas_fiscais_forma_pagamento.interfaces.pas',
  controller.dto.pdv_notas_fiscais_forma_pagamento.interfaces.impl in 'source\controller\dto\impl\controller.dto.pdv_notas_fiscais_forma_pagamento.interfaces.impl.pas',
  controller.easy in 'source\controller\controller.easy.pas';

{$R *.res}

begin
  if ParamStr(1) <> '-cashnummus' then
    begin
      Application.MessageBox('Execução manual não permitida','CashBack - Nummus');
      Exit;
    end
  else if ParamStr(2) = '-consultar' then
    TControllerEasy.GetCashByCustomer
      else if ParamStr(2) = '-postar' then
        TControllerEasy.PostSalesOnNummus
          else if ParamStr(2) = '-cancelar' then
            TControllerEasy.CancelCashBackOnNummus
              else
                Exit;


  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfPrincipal, fPrincipal);
  Application.Run;
end.
