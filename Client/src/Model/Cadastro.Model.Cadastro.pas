unit Cadastro.Model.Cadastro;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.FMXUI.Wait,
  FireDAC.Phys.MSSQLDef, FireDAC.Comp.Client, FireDAC.Phys.ODBCBase,
  FireDAC.Phys.MSSQL, Data.DB, FireDAC.Comp.UI, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TModelCadastro = class(TDataModule)
    conConexao: TFDConnection;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    trTransacao: TFDTransaction;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    qryPessoas: TFDQuery;
    qryPessoasid_pessoa: TFDAutoIncField;
    qryPessoascpf: TLargeintField;
    qryPessoasrg: TLargeintField;
    qryPessoasnome: TStringField;
    qryPessoasmae_nome: TStringField;
    qryPessoaspai_nome: TStringField;
    qryEnderecos: TFDQuery;
    dsPessoas: TDataSource;
    qryEnderecosid_pessoa: TIntegerField;
    qryEnderecoscep: TIntegerField;
    qryEnderecosendereco: TStringField;
    qryEnderecosnumero: TStringField;
    qryEnderecoscidade: TStringField;
    qryEnderecosestado: TStringField;
    procedure DataModuleDestroy(Sender: TObject);
    procedure qryPessoasAfterOpen(DataSet: TDataSet);
    procedure qryPessoasBeforeClose(DataSet: TDataSet);
    procedure qryEnderecosBeforeInsert(DataSet: TDataSet);
    procedure qryEnderecosBeforeEdit(DataSet: TDataSet);
    procedure qryPessoasAfterPost(DataSet: TDataSet);
    procedure qryPessoasBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ModelCadastro: TModelCadastro;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TModelCadastro.DataModuleDestroy(Sender: TObject);
begin
   if conConexao.Connected then
      conConexao.Close;
end;

procedure TModelCadastro.qryEnderecosBeforeEdit(DataSet: TDataSet);
begin
   if not (TFDQuery(DataSet).MasterSource.State In dsEditModes) then
      TFDQuery(DataSet).MasterSource.DataSet.Edit;
end;

procedure TModelCadastro.qryEnderecosBeforeInsert(DataSet: TDataSet);
begin
   if not (TFDQuery(DataSet).MasterSource.State In dsEditModes) then
      TFDQuery(DataSet).MasterSource.DataSet.Edit;
end;

procedure TModelCadastro.qryPessoasAfterOpen(DataSet: TDataSet);
begin
   qryEnderecos.Open();
end;

procedure TModelCadastro.qryPessoasAfterPost(DataSet: TDataSet);
begin
   if qryEnderecos.State In dsEditModes then
      qryEnderecos.Post;
end;

procedure TModelCadastro.qryPessoasBeforeClose(DataSet: TDataSet);
begin
   qryEnderecos.Close();
end;

procedure TModelCadastro.qryPessoasBeforeDelete(DataSet: TDataSet);
begin
   qryEnderecos.Delete;
end;

end.
