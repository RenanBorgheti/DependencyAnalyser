program DependencyAnalyser;

uses
  Vcl.Forms,
  unPrincipal in '..\Source\unPrincipal.pas' {FormPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
