unit Main;

{$mode objfpc}{$H+}

interface

uses
  //System:
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Spin;
  //Custom:
  UGrid;

type
  { TMainForm }
  TMainForm = class(TForm)
    Button_Set: TButton;
    PaintBox: TPaintBox;
    PanelConfig: TPanel;
    Edit_X: TSpinEdit;
    Edit_Y: TSpinEdit;
    Label_X: TLabel;
    Label_Y: TLabel;
    procedure Button_SetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PaintBoxPaint(Sender: TObject);
  end;

var
  MainForm: TMainForm;
  Rows: UInt16 = 16;
  Cols: UInt16 = 16;
  Grid: TGrid;

implementation

{$R *.frm}

{ TMainForm }

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Edit_X.Value := Rows;
  Edit_Y.Value := Cols;

  Grid := TGrid.Create;

  Grid.SetSize(Rows, Cols);
end;

procedure TMainForm.PaintBoxPaint(Sender: TObject);
var
  EntryHeight, EntryWidth: UInt16;
  i, x, y: UInt16;
begin
  //Calculate row and col sizes:
  EntryWidth := Round(PaintBox.Width / Rows);
  EntryHeight := Round(PaintBox.Height / Cols);

  //Paint row and col borders:
  for i := 1 to Rows - 1 do
  begin
    x := EntryWidth * i - 1;
    PaintBox.Canvas.Line(x, 0, x, PaintBox.Height);
  end;
  for i := 1 to Cols - 1 do
  begin
    y := EntryHeight * i - 1;
    PaintBox.Canvas.Line(0, y, PaintBox.Width, y);
  end;

  //Paint entries:
  for x := 0 to Rows - 1 do
    for y := 0 to Cols - 1 do
      if Grid.Field[x, y] then
        PaintBox.Canvas.FillRect(EntryWidth * x, EntryHeight * y, EntryWidth * (x + 1) - 1, EntryHeight * (y + 1) - 1);
end;
procedure TMainForm.Button_SetClick(Sender: TObject);
begin
  Rows := Edit_X.Value;
  Cols := Edit_Y.Value;

  Grid.SetSize(Rows, Cols);

  PaintBox.Invalidate;
end;

end.

