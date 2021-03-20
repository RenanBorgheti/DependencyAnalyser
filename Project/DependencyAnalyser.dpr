program DependencyAnalyser;

uses
  Vcl.Forms,
  SimpleGraph in '..\Source\SimpleGraph.pas',
  UnPrincipal in '..\Source\UnPrincipal.pas' {FormPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
