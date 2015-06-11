program proRezis;

uses
  Forms,
  unMain in 'unMain.pas' {frmMain},
  unDm in 'unDm.pas' {DM: TDataModule},
  unDB in 'unDB.pas' {frmDB};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmDB, frmDB);
  Application.Run;
end.
