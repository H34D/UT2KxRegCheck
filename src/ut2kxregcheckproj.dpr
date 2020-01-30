program ut2kxregcheckproj;

uses
  Forms,
  ut2kxregcheck in 'ut2kxregcheck.pas' {ut2kxWin};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tut2kxWin, ut2kxWin);
  Application.Run;
end.
