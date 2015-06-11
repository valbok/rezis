object frmMain: TfrmMain
  Left = 192
  Top = 119
  Width = 544
  Height = 375
  Caption = 'frmMain'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 536
    Height = 328
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 18
      Height = 13
      Caption = 'KU:'
    end
    object Label2: TLabel
      Left = 8
      Top = 40
      Width = 11
      Height = 13
      Caption = 'N:'
    end
    object eKu: TEdit
      Left = 32
      Top = 16
      Width = 57
      Height = 21
      TabOrder = 0
      Text = '100'
    end
    object Memo: TMemo
      Left = 1
      Top = 238
      Width = 534
      Height = 89
      Align = alBottom
      ScrollBars = ssVertical
      TabOrder = 1
    end
    object eN: TEdit
      Left = 32
      Top = 40
      Width = 57
      Height = 21
      TabOrder = 2
      Text = '3'
    end
    object btnSetN: TBitBtn
      Left = 32
      Top = 64
      Width = 57
      Height = 25
      Caption = 'Set N'
      TabOrder = 3
      OnClick = btnSetNClick
    end
    object pnlRX: TGroupBox
      Left = 240
      Top = 1
      Width = 168
      Height = 237
      Align = alRight
      Caption = 'RX:'
      TabOrder = 4
    end
    object pnlRight: TGroupBox
      Left = 408
      Top = 1
      Width = 127
      Height = 237
      Align = alRight
      Caption = 'Types:'
      TabOrder = 5
    end
    object btnRun: TBitBtn
      Left = 8
      Top = 96
      Width = 83
      Height = 25
      Caption = 'RUN'
      TabOrder = 6
      OnClick = btnRunClick
    end
  end
  object MainMenu: TMainMenu
    Left = 120
    Top = 8
    object File1: TMenuItem
      Caption = 'File'
      object miConnect: TMenuItem
        Caption = 'Connect'
        ShortCut = 120
        OnClick = miConnectClick
      end
      object miDisconnect: TMenuItem
        Caption = 'Disconnect'
        ShortCut = 123
        OnClick = miDisconnectClick
      end
    end
    object midb: TMenuItem
      Caption = 'db'
      OnClick = midbClick
    end
  end
end
