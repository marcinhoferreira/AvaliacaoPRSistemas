unit Cadastro.Controller.Interfaces;

interface

uses
   Cadastro.Model.Entidades.Interfaces;

type
   IController = interface
      ['{25D5A6E9-DC2C-463E-95CE-36F5C7468869}']
      function Entidades: IModelEntidadeFactory;
   end;

implementation

end.
