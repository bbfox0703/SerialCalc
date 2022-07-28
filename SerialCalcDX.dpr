program SerialCalcDX;

uses
  Vcl.Forms,
  main0 in 'main0.pas' {Form1},
  md5 in 'md5.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
