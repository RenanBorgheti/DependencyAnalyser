unit unPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.FileCtrl, Vcl.ExtDlgs, Vcl.ComCtrls;

type
  TFormPrincipal = class(TForm)
    otfArquivos: TOpenTextFileDialog;
    pnlTopo: TPanel;
    edtDirGrupoProjeto: TEdit;
    btnSelecionaProjeto: TButton;
    PageControl1: TPageControl;
    tsSelecaoArquivos: TTabSheet;
    lbgListaGroupsProjeto: TListBox;
    btnAdicionar: TButton;
    procedure btnSelecionaProjetoClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

procedure TFormPrincipal.btnAdicionarClick(Sender: TObject);
begin
  if FileExists(otfArquivos.FileName) then
    lbgListaGroupsProjeto.AddItem(otfArquivos.FileName, Nil);
end;

procedure TFormPrincipal.btnSelecionaProjetoClick(Sender: TObject);
begin
  otfArquivos.InitialDir := 'C:\';
  otfArquivos.Filter := 'GroupProject (*.groupproj)|*.groupproj';
  otfArquivos.Execute(Handle);

  if FileExists(otfArquivos.FileName) then
    edtDirGrupoProjeto.Text := otfArquivos.FileName;

end;

end.
