object Form1: TForm1
  Left = 224
  Top = 135
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Demo CheckSums'
  ClientHeight = 225
  ClientWidth = 386
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object Edit1: TEdit
    Left = 8
    Top = 8
    Width = 305
    Height = 24
    TabOrder = 0
    OnChange = Edit1Change
  end
  object Button1: TButton
    Left = 320
    Top = 8
    Width = 25
    Height = 25
    Caption = '...'
    TabOrder = 1
    OnClick = Button1Click
  end
  object ListBox1: TListBox
    Left = 8
    Top = 64
    Width = 369
    Height = 153
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Courier New'
    Font.Style = []
    ItemHeight = 17
    ParentFont = False
    TabOrder = 2
  end
  object Button2: TButton
    Left = 352
    Top = 8
    Width = 25
    Height = 25
    Caption = 'Go'
    Enabled = False
    TabOrder = 3
    OnClick = Button2Click
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 40
    Width = 369
    Height = 17
    Smooth = True
    TabOrder = 4
  end
  object OpenDialog1: TOpenDialog
    Title = 'Analyser ?'
    Left = 20
    Top = 20
  end
end
