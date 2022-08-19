unit Cadastro.Model.Conexao.FireDAC.Conexao;

interface

uses
  Cadastro.Model.Conexao.Interfaces,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  FireDAC.Phys.MSSQLDef, FireDAC.Phys.MSSQL;

type
   TModelConexaoFireDACConexao = class(TInterfacedObject, IModelConexao)
   private
      { Private declarations }
      fDriverLink: TFDPhysMSSQLDriverLink;
      fConexao: TFDConnection;
   protected
      { Protected declarations }
   public
      { Public declarations }
      constructor Create;
      destructor Destroy; override;
      class function New: IModelConexao;
      function Connection: TObject;
      function Driver: String;
   end;

implementation

uses
   SysUtils, System.IOUtils;

{ TModelConexaoFireDACConexao }

function TModelConexaoFireDACConexao.Connection: TObject;
begin
   Result := fConexao;
end;

constructor TModelConexaoFireDACConexao.Create;
var
   AHomePath: String;
begin
   AHomePath := ExtractFilePath(ParamStr(0));
   fConexao := TFDConnection.Create(Nil);
   fDriverLink := TFDPhysMSSQLDriverLink.Create(Nil);

   with fConexao do
      begin
         ConnectedStoredUsage := ConnectedStoredUsage - [auDesignTime, auRunTime];
         Params.DriverID := 'MSSQL';
         Params.Values['Server'] := 'marcio-vaio\SQLExpress';
         Params.DataBase := 'dados';
         Params.UserName := 'sa';
         Params.Password := 'Le@l#123';
         Connected := True;
      end;
end;

destructor TModelConexaoFireDACConexao.Destroy;
begin
   FreeAndNil(fConexao);
   FreeAndNil(fDriverLink);
   inherited;
end;

function TModelConexaoFireDACConexao.Driver: String;
begin
   Result := fConexao.Params.DriverID;
end;

class function TModelConexaoFireDACConexao.New: IModelConexao;
begin
   Result := Self.Create;
end;

end.
