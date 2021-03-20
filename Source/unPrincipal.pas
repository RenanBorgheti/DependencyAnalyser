unit UnPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, SimpleGraph, Vcl.Buttons,
  System.ImageList, Vcl.ImgList, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtDlgs;

type
  TFormPrincipal = class(TForm)
    pnlTopo: TPanel;
    pnlPrincipal: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ImageList1: TImageList;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    edtDirGrupoProjeto: TEdit;
    btnSelecionaProjeto: TButton;
    btnAdicionar: TButton;
    lbgListaGroupsProjeto: TListBox;
    otfArquivos: TOpenTextFileDialog;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormDblClick(Graph: TSimpleGraph; GraphObject: TGraphObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnSelecionaProjetoClick(Sender: TObject);
  private
    { Private declarations }
    FGraph: TSimpleGraph;

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

procedure TFormPrincipal.FormCreate(Sender: TObject);
var
  Node: TPolygonalNode;
  Link: TGraphLink;

begin
  FGraph := TSimpleGraph.Create(Self);
  FGraph.Parent := pnlPrincipal;
  FGraph.Align := alClient;
  FGraph.ChangeZoom(150, zoCenter);

  FGraph.SetBounds(10, 10, 400, 400);
  FGraph.BeginUpdate;

  Node := TRectangularNode.Create(FGraph);
  Node.SetBounds(25, 25, 100, 50);
  Node.Text := 'teste retangulo';
  // Node.Options

  Node := TRectangularNode.Create(FGraph);
  Node.SetBounds(200, 200, 50, 100);
  FGraph.OnObjectDblClick := FormDblClick;

  Link := TGraphLink.Create(FGraph);
  Link.Link(FGraph.Objects[0], FGraph.Objects[1]);

  Node := TTriangularNode.Create(FGraph);
  Node.SetBounds(50, 50, 100, 100);

  Node := TRhomboidalNode.Create(FGraph);
  Node.SetBounds(50, 110, 100, 100);

  Node := TPentagonalNode.Create(FGraph);
  Node.SetBounds(150, 160, 100, 100);

  Node := THexagonalNode.Create(FGraph);
  Node.SetBounds(70, 200, 100, 100);

  FGraph.EndUpdate;
end;

procedure TFormPrincipal.FormDblClick(Graph: TSimpleGraph;
  GraphObject: TGraphObject);
Const
  CAzul = $00FBC7B3;
  CVermelho = clRed;
begin
  if Not(GraphObject is TPolygonalNode) then
    exit;

  if TPolygonalNode(GraphObject).Brush.Color = CVermelho then
    TPolygonalNode(GraphObject).Brush.Color := CAzul
  else
    TPolygonalNode(GraphObject).Brush.Color := CVermelho;

end;

procedure TFormPrincipal.SpeedButton1Click(Sender: TObject);
begin
  FGraph.ChangeZoom(FGraph.Zoom - 20, zoCenter);
end;

procedure TFormPrincipal.SpeedButton2Click(Sender: TObject);
begin
  FGraph.ChangeZoom(FGraph.Zoom + 20, zoCenter);
end;

end.
