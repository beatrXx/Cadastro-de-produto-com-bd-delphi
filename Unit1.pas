unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    btnInserir: TButton;
    btnNovo: TButton;
    btnListar: TButton;
    Dados: TPageControl;
    pagDados: TTabSheet;
    pagBuscar: TTabSheet;
    Listar: TTabSheet;
    lblNome: TLabel;
    txtNome: TEdit;
    lblModelo: TLabel;
    txtModelo: TEdit;
    DateTimePicker1: TDateTimePicker;
    lblData: TLabel;
    txtPreco: TEdit;
    lblPreco: TLabel;
    Memo1: TMemo;
    lblEspecificacoes: TLabel;
    lblEspecificacoess: TLabel;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    cbNacional: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblBuscaNome: TLabel;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    lblBuscaCodigo: TLabel;
    txtNomeBuscar: TEdit;
    txtCodigoBuscar: TEdit;
    btnBuscaNome: TButton;
    btnBuscaCodigo: TButton;
    Memo2: TMemo;
    btnApagarCodigo: TButton;
    btnApagarNome: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnBuscaNomeClick(Sender: TObject);
    procedure btnBuscaCodigoClick(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
    procedure btnApagarCodigoClick(Sender: TObject);
    procedure btnApagarNomeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure limpar;
    procedure preencheCampos;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnApagarCodigoClick(Sender: TObject);
begin
   ADOQuery1.SQL.Text := 'delete produtos where codigo = :cod';
   ADOQuery1.Parameters.ParamByName('cod').Value := txtCodigoBuscar.Text;
   ADOQuery1.ExecSQL;

   if ADOQuery1.RowsAffected > 0 then
   begin
     ShowMessage('Registro apagado com sucesso!');
   end
   else
    ShowMessage('Registro não existente.');

end;

procedure TForm1.btnApagarNomeClick(Sender: TObject);
begin
   ADOQuery1.SQL.Text := 'delete produtos where nome = :nom';
   ADOQuery1.Parameters.ParamByName('nom').Value := txtNomeBuscar.Text;
   ADOQuery1.ExecSQL;

   if ADOQuery1.RowsAffected > 0 then
   begin
     ShowMessage('Registro apagado com sucesso!');
   end
   else
    ShowMessage('Registro não existente.');

end;

procedure TForm1.btnBuscaCodigoClick(Sender: TObject);
begin
  ADOQuery1.SQL.Text := 'select * from Produtos where codigo = :cod';
  ADOQuery1.Parameters.ParamByName('cod').Value := txtCodigoBuscar.Text;
  ADOQuery1.Open;
  preencheCampos;
end;

procedure TForm1.btnBuscaNomeClick(Sender: TObject);
begin
  ADOQuery1.SQL.Text := 'select * from Produtos where nome like '''+txtNomeBuscar.Text+'''';
  ADOQuery1.Open;
  preencheCampos;
end;

procedure TForm1.btnInserirClick(Sender: TObject);
begin
 ADOQuery1.SQL.Text := 'insert into produtos (Nome, DataCriacao, Preço, Modelo, Especificações, Nacional)' +
  'values (:Nome, :DataCriacao, :Preço, :Modelo, :Especificações, :Nacional)';

  ADOQuery1.Parameters.ParamByName('Nome').Value := txtNome.Text;
  ADOQuery1.Parameters.ParamByName('DataCriacao').Value := DateTimePicker1.Date;
  ADOQuery1.Parameters.ParamByName('Preço').Value := strtofloat(txtPreco.Text);
  ADOQuery1.Parameters.ParamByName('Modelo').Value := txtModelo.Text;
  ADOQuery1.Parameters.ParamByName('Especificações').Value := Memo1.Text;
  ADOQuery1.Parameters.ParamByName('Nacional').Value := cbNacional.Checked;

  try
    ADOQuery1.ExecSQL;
    showMessage('Dados inseridos com sucesso!');
    limpar;
  except
     showMessage('Erro ao tentar inserir dados');
  end;

end;

procedure TForm1.btnListarClick(Sender: TObject);
begin
  memo2.Clear;
  ADOQuery1.SQL.Text := 'select codigo, nome from produtos';
  ADOQuery1.Open;
  ADOQuery1.First;

  while not (ADOQuery1.Eof) do
    begin

      memo2.Lines.Add(ADOQuery1.FieldByName('codigo').AsString + ' - '+ADOQuery1.FieldByName('nome').AsString);
      ADOQuery1.Next;

    end;

end;

procedure TForm1.FormShow(Sender: TObject);
begin
  ADOconnection1.ConnectionString := 'Provider=SQLNCLI11.1;Persist Security Info=False;User ID=sa;Initial Catalog=cadastro;Data Source=(local);Initial File Name="";Server SPN="";password=123456';
  ADOconnection1.Connected := true;
end;

procedure TForm1.limpar;
begin
 txtNome.Clear;
 DateTimePicker1.CleanupInstance;
 txtPreco.Clear;
 txtModelo.Clear;
 Memo1.Clear;
 cbNacional.Checked := false;
end;

procedure TForm1.preencheCampos;
begin
    if not ADOQuery1.IsEmpty then

    begin
      txtNome.Text := ADOQuery1.FieldByName('nome').AsString;
      txtModelo.Text := ADOQuery1.FieldByName('Modelo').AsString;
      DateTimePicker1.Date := ADOQuery1.FieldByName('DataCriacao').AsDateTime;
      txtPreco.Text := ADOQuery1.FieldByName('Preço').AsString;
      cbNacional.Checked := ADOQuery1.FieldByName('Nacional').AsBoolean;
      memo1.Text := ADOQuery1.FieldByName('Especificações').AsString;
      dados.ActivePageIndex := 0;
      showMessage('Informação preenchida com sucesso');
    end
    else
      showMessage('Não existe registro para o filtro');

end;

end.
