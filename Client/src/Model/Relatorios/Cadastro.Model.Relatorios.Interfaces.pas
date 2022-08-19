unit Cadastro.Model.Relatorios.Interfaces;

interface

uses
   Classes;

type
   IModelRelatorio = interface
      ['{75D1B5E8-7256-43B7-92E4-361B757C6D41}']
      procedure Executa(const Previa: Boolean = True);
   end;

implementation

end.
