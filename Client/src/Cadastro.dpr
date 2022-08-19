program Cadastro;

uses
  System.StartUpCopy,
  FMX.Forms,
  Cadastro.Classe.Pessoa in 'Classes\Cadastro.Classe.Pessoa.pas',
  Cadastro.Model.Conexao.Interfaces in 'Model\Conexao\Cadastro.Model.Conexao.Interfaces.pas',
  Cadastro.Model.Conexao.FireDAC.Conexao in 'Model\Conexao\Cadastro.Model.Conexao.FireDAC.Conexao.pas',
  Cadastro.Model.Conexao.FireDAC.Query in 'Model\Conexao\Cadastro.Model.Conexao.FireDAC.Query.pas',
  Cadastro.Model.Conexao.Factory in 'Model\Conexao\Cadastro.Model.Conexao.Factory.pas',
  Cadastro.Model.Entidades.Interfaces in 'Model\Entidades\Cadastro.Model.Entidades.Interfaces.pas',
  Cadastro.Model.Entidades.Pessoa in 'Model\Entidades\Cadastro.Model.Entidades.Pessoa.pas',
  Cadastro.Model.Entidades.Factory in 'Model\Entidades\Cadastro.Model.Entidades.Factory.pas',
  Cadastro.Model.Relatorios.Interfaces in 'Model\Relatorios\Cadastro.Model.Relatorios.Interfaces.pas',
  Cadastro.Model.Relatorios.FR.Pessoa in 'Model\Relatorios\Cadastro.Model.Relatorios.FR.Pessoa.pas',
  Cadastro.View.Cadastro in 'View\Cadastro.View.Cadastro.pas' {frmCadastro},
  Cadastro.Controller.Interfaces in 'Controller\Cadastro.Controller.Interfaces.pas',
  Cadastro.Controller in 'Controller\Cadastro.Controller.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmCadastro, frmCadastro);
  Application.Run;
end.
