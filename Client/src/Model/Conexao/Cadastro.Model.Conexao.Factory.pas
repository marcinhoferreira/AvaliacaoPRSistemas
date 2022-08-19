unit Cadastro.Model.Conexao.Factory;

interface

uses
  Cadastro.Model.Conexao.Interfaces;

type
   TModelConexaoFactory = class(TInterfacedObject, IModelConexaoFactory)
   private
      { Private declarations }
   protected
      { Protected declarations }
   public
      { Public declarations }
      constructor Create;
      destructor Destroy; override;
      class function New: IModelConexaoFactory;
      function Conexao: IModelConexao;
      function Query: IModelQuery;
   end;

implementation

uses
  Cadastro.Model.Conexao.FireDAC.Conexao,
  Cadastro.Model.Conexao.FireDAC.Query;

{ TModelConexaoFactory }

function TModelConexaoFactory.Conexao: IModelConexao;
begin
   Result := TModelConexaoFireDACConexao.New;
end;

constructor TModelConexaoFactory.Create;
begin

end;

destructor TModelConexaoFactory.Destroy;
begin

  inherited;
end;

class function TModelConexaoFactory.New: IModelConexaoFactory;
begin
   Result := Self.Create;
end;

function TModelConexaoFactory.Query: IModelQuery;
begin
   Result := TModelConexaoFireDACQuery.New(Self.Conexao);
end;

end.
