unit unMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, StdCtrls, Buttons;

type
  TfrmMain = class(TForm)
    pnlMain: TPanel;
    MainMenu: TMainMenu;
    File1: TMenuItem;
    miConnect: TMenuItem;
    miDisconnect: TMenuItem;
    midb: TMenuItem;
    eKu: TEdit;
    Label1: TLabel;
    Memo: TMemo;
    eN: TEdit;
    Label2: TLabel;
    btnSetN: TBitBtn;
    pnlRX: TGroupBox;
    pnlRight: TGroupBox;
    btnRun: TBitBtn;
    procedure miConnectClick(Sender: TObject);
    procedure miDisconnectClick(Sender: TObject);
    procedure midbClick(Sender: TObject);
    procedure btnSetNClick(Sender: TObject);
    procedure btnRunClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
        procedure recur(REc_count,glubina,endglubina:integer;
                        var ar_rx,ar_rxo,ar_id,ar_ido:array of integer;
                        var Ku_opt,K_nom:integer);
  end;

var
  frmMain: TfrmMain;
  RecordCountwork:integer;
  N:integer;

  KU_nom,KU_opt:integer;
  a_rx: array of Integer;
  a_rxo: array of Integer;  
  a_id: array of Integer;
  a_ido:array of integer;
  
  a_cb: array of TCheckBox;
  a_ot: array of TEdit;
  a_do: array of TEdit;
  a_lbl: array of TLabel;
implementation

uses unDm, unDB;

{$R *.dfm}

function Ku(var a_rx:array of integer):integer;
begin
 result:=round(a_rx[1]/a_rx[2] + a_rx[3]/a_rx[1] + 1);
end;
//++++++++++++++++++++++++++++++++++++++
procedure TfrmMain.miConnectClick(Sender: TObject);
var i:integer;
begin
 if dm.qRezis.Active then exit;
    dm.qRezis.Open;

    with dm do
    begin
       qryWork.CLose;
       qrywork.SQL.Text:='select distinct(type) from rezis';
       qryWork.Open;

       RecordCountWork:=qryWork.RecordCount;

       SetLength(a_cb,qryWork.RecordCount);

       for i:=0 to qryWork.RecordCount-1 do
       begin
          a_cb[i]:=TCHeckBox.Create(self);
          a_cb[i].Name:='cb'+intToStr(i);//qryWork.fieldByName('id').asinteger);
          a_cb[i].Caption:=qryWork.fieldByName('type').asstring;
          a_cb[i].Left:=5;
          a_cb[i].top:=i*20+15;
          a_cb[i].Parent:=pnlRight;
          qryWork.Next;
       end;


    end;
end;

procedure TfrmMain.miDisconnectClick(Sender: TObject);
var i:integer;
begin
  dm.DB.Connected:=false;

      for i:=0 to RecordCountWork-1 do
          a_cb[i].Free;

end;

procedure TfrmMain.midbClick(Sender: TObject);
begin
  frmDB.show;
end;

procedure TfrmMain.btnSetNClick(Sender: TObject);
var i:integer;
begin
       for i:=0 to N-1 do
       begin
          a_ot[i].Free;
          a_do[i].Free;
          a_lbl[i].Free;
       end;
       N:=StrToInt(eN.text);
       SetLength(a_ot,N);
       SetLength(a_do,N);
       SetLength(a_lbl,N);

       SetLength(a_rx,N);
       SetLength(a_rxo,N);       
       SetLength(a_id,N);
       SetLength(a_ido,N);


       for i:=0 to N-1 do
       begin
          a_ot[i]:=TEdit.Create(self);
          a_ot[i].Name:='eOt'+intToStr(i);
          a_ot[i].text:='0';
          a_ot[i].Left:=5;
          a_ot[i].width:=55;
          a_ot[i].top:=i*23+15;
          a_ot[i].Parent:=pnlrx;

          a_do[i]:=TEdit.Create(self);
          a_do[i].Name:='eDo'+intToStr(i);
          a_do[i].text:='1000000';
          a_do[i].Left:=95;
          a_do[i].width:=55;
          a_do[i].top:=i*23+15;
          a_do[i].Parent:=pnlrx;

          a_lbl[i]:=TLabel.Create(self);
          a_lbl[i].Name:='lbl'+intToStr(i);
          a_lbl[i].Caption:='< R'+intToStr(i)+' <';
          a_lbl[i].Left:=60;
          a_lbl[i].top:=i*23+15;
          a_lbl[i].Parent:=pnlrx;

       end;

end;
procedure GetR(index:integer;var r:integer;var id:integer);
begin
  with dm Do
  begin
    qRezis.First;
    qRezis.MoveBy(index);
    r:=qRezis.fieldByName('Om').asInteger;
    id:=qRezis.fieldByName('id').asInteger;
  end;
end;

procedure TfrmMain.recur(REc_count,glubina,endglubina:integer;
                        var ar_rx,ar_rxo,ar_id,ar_ido:array of integer;
                        var Ku_opt,K_nom:integer);
var i,j:integer;
begin
     inc(glubina);
     for i:=0 to Rec_Count-1 do
     begin
        GetR(i,ar_rx[glubina-1],ar_id[glubina-1]);

        if glubina >=endglubina then
        begin
                    if abs(Ku_opt-Ku(ar_rx)) <= abs(Ku_opt-Ku_nom) then
                    begin
                       Ku_opt:=Ku(ar_rx);
                       for j:=0 to glubina-1 do
                       begin
                          ar_rxo[j]:=ar_rx[j];
                          ar_ido[j]:=ar_id[j];
                       end;
                    end;
           exit;
        end;
        recur(REc_count,glubina,endglubina,
              ar_rx,ar_rxo,ar_id,ar_ido,
              Ku_opt,K_nom);
{        for j:=0 to qRezis.RecordCount-1 do
        begin
            GetR(j,r2,idr2);
            for k:=0 to qRezis.RecordCount-1 do
            begin
                    GetR(k,r3,idr3);
                    if abs(Ku_opt-Ku(r1,r2,r3)) <= abs(Ku_opt-Ku_nom) then
                    begin
                       Ku_opt:=Ku(r1,r2,r3);
                       r1o:=r1;
                       r2o:=r2;
                       r3o:=r3;
                    end;
            end;
        end;}

end;
end;
procedure TfrmMain.btnRunClick(Sender: TObject);
var i,j,k:integer;
//  a_rx: array
        r1,r2,r3:integer;
        r1o,r2o,r3o:integer;
        idr1,idr2,idr3:integer;


begin
  Memo.Clear;
  kU_opt:=1000000;

  KU_nom:=StrToInt(eKu.text);
  recur(dm.qRezis.RecordCount,
        0,N,a_rx,a_rxo,a_id,a_ido,
              Ku_opt,KU_nom);

{  with dm do
  begin
     for i:=0 to qRezis.RecordCount-1 do
     begin
        GetR(i,r1,idr1);
        for j:=0 to qRezis.RecordCount-1 do
        begin
            GetR(j,r2,idr2);
            for k:=0 to qRezis.RecordCount-1 do
            begin
                    GetR(k,r3,idr3);
                    if abs(Ku_opt-Ku(r1,r2,r3)) <= abs(Ku_opt-Ku_nom) then
                    begin
                       Ku_opt:=Ku(r1,r2,r3);
                       r1o:=r1;
                       r2o:=r2;
                       r3o:=r3;
                    end;
            end;
        end;

     end;
  end;}
Memo.Lines.Add('Ku_opt ='+intToStr(ku_opt));
 for i:=0 to N-1 do
 begin
   Memo.Lines.Add('ro'+intToStr(i)+' ='+intToStr(a_rxo[i]));
//   Memo.Lines.Add('r'+intToStr(i)+' ='+intToStr(a_rx[i]));
 end;
   
end;

end.
