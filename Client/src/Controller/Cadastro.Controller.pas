unit Cadastro.Controller;

interface

uses
  SysUtils,
  Cadastro.Model.Entidades.Factory,
  Cadastro.Controller.Interfaces,
  Cadastro.Model.Entidades.Interfaces;

Type
   TController = class(TInterfacedObject, IController)
   private
      { Private declarations }
      fModelEntidades: IModelEntidadeFactory;
   public
      { Public declarations }
      constructor Create;
      destructor Destroy; override;
      class function New: IController;
      function Entidades: IModelEntidadeFactory;
   end;

implementation

{ TController }

constructor TController.Create;
begin
   fModelEntidades := TModelEntidadesFactory.New;
end;

destructor TController.Destroy;
begin
  inherited;
end;

function TController.Entidades: IModelEntidadeFactory;
begin
   Result := fModelEntidades;
end;

class function TController.New: IController;
begin
   Result := Self.Create;
end;

end.
