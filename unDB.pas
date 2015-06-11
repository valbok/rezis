unit unDB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, Grids, DBGrids;

type
  TfrmDB = class(TForm)
    gridDB: TDBGrid;
    NavigatorDB: TDBNavigator;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDB: TfrmDB;

implementation
uses unDM;
{$R *.dfm}

end.
