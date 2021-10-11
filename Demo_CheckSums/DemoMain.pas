unit DemoMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    ListBox1: TListBox;
    Button2: TButton;
    ProgressBar1: TProgressBar;
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

const
  DataBufferSize = 1024*1024;  

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses ChkSums;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    Edit1.Text := OpenDialog1.FileName;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  R8   : TSum8;
  R16  : TSum16;
  R32  : TSum32;
  R64  : TSum64;
  Data     : pByte;
  DataSize : LongInt;
  GT : LongWord;
  RSZ: LongWord;
begin
  Application.ProcessMessages;

  ListBox1.Items.BeginUpdate;
  try
    ListBox1.Clear;

    R8   := 0;
    R16  := 0;
    R32  := 0;
    R64  := 0;

    with TFileStream.Create(Edit1.Text, fmOpenRead) do
    try
      RSZ := 0;
      GT := GetTickCount;
      Data := AllocMem(DataBufferSize);
      repeat
        DataSize := Read(Data^, DataBufferSize);
        R8  := ChkSums.Sum8(Data^, DataSize, R8);
        R16 := ChkSums.Sum16(Data^, DataSize, R16);
        R32 := ChkSums.Sum32(Data^, DataSize, R32);
        R64 := ChkSums.Sum64(Data^, DataSize, R64);
        inc(RSZ, DataSize);
        Application.ProcessMessages;
      until DataSize < DataBufferSize;
      GT := GetTickCount-GT;
    finally
      FreeMem(Data, DataBufferSize);
      Free;
    end;

    ListBox1.Items.Add(format('Time calculation: %.3n sec', [GT*0.001]));
    ListBox1.Items.Add(format('Read bytes      : %.2n KBytes', [RSZ/1024]));

    ListBox1.Items.Add(format('8  bits: 0x%.2x', [R8]));
    ListBox1.Items.Add(format('16 bits: 0x%.4x', [R16]));
    ListBox1.Items.Add(format('32 bits: 0x%.8x', [R32]));
    ListBox1.Items.Add(format('64 bits: 0x%.16x', [R64]));
  finally
    ListBox1.Items.EndUpdate;
  end;

  ProgressBar1.Position := 0;
end;

procedure TForm1.Edit1Change(Sender: TObject);
var B : boolean;
const
  CCC : array[boolean] of TColor = (clGrayText, clWindowText);
  CCS : array[boolean] of TFontStyles = ([fsItalic],[]);
begin
  B := FileExists((Sender as TEdit).Text);
  (Sender as TEdit).Font.Color := CCC[B];
  (Sender as TEdit).Font.Style := CCS[B];
  Button2.Enabled := B;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Edit1.Text := 'File name...';
end;

end.
