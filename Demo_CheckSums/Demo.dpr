program Demo;

uses
  Forms,
  DemoMain in 'DemoMain.pas' {Form1},
  ChkSums in 'ChkSums.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
