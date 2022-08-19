unit Cadastro.Model.Entidades.Factory;

interface

uses
  Cadastro.Model.Entidades.Interfaces;

type
   TModelEntidadesFactory = class(TInterfacedObject, IModelEntidadeFactory)
   private
      { Private declarations }
      fPessoa: IModelEntidade;
   public
      { Public declarations }
      constructor Create;
      destructor Destroy; override;
      class function New: IModelEntidadeFactory;
      function Pessoa: IModelEntidade;
    end;

implementation

uses
   Cadastro.Model.Entidades.Pessoa;

{ TModelEntidadesFactory }

destructor TModelEntidadesFactory.Destroy;
begin

   inherited;
end;

class function TModelEntidadesFactory.New: IModelEntidadeFactory;
begin
   Result := Self.Create;
end;

function TModelEntidadesFactory.Pessoa: IModelEntidade;
begin
   if not Assigned(fPessoa) then
      fPessoa := TModelEntidadePessoa.New;
   Result := fPessoa;
end;

constructor TModelEntidadesFactory.Create;
begin

end;

end.
