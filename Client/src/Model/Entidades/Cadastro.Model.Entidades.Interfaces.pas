unit Cadastro.Model.Entidades.Interfaces;

interface

uses
  Data.DB;

type
   IModelEntidade = interface
      ['{B119FD9D-1CE9-47EA-8DF4-CB172DBACBE8}']
      function DataSet(const Value: TDataSource): IModelEntidade; overload;
      function DataSet(const Value: TDataSet): IModelEntidade; overload;
      procedure Open(const AWhere: String = '');
   end;

   IModelEntidadeFactory = interface
      ['{C7B61B5D-962F-4D5C-81BE-C96BBE4F61DF}']
      function Pessoa: IModelEntidade;
   end;

implementation

end.
