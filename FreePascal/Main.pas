unit Main;

{$mode objfpc}{$H+}

interface

uses
  //System:
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Spin, Math,
  //Custom:
  UGrid;

type
  { TMainForm }
  TMainForm = class(TForm)
    procedure PaintBoxMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  public
    LastX, LastY: Int16;
  published
    Button_StartStop: TButton;
    Button_Set: TButton;
    Label_Interval: TLabel;
    Label_Interval_ms: TLabel;
    PaintBox: TPaintBox;
    PanelConfig: TPanel;
    Edit_X: TSpinEdit;
    Edit_Y: TSpinEdit;
    Label_X: TLabel;
    Label_Y: TLabel;
    Edit_Interval: TSpinEdit;
    Timer_Game: TTimer;
    procedure Button_SetClick(Sender: TObject);
    procedure Button_StartStopClick(Sender: TObject);
    procedure Edit_IntervalChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PaintBoxMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure PaintBoxMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure PaintBoxPaint(Sender: TObject);
    procedure Timer_GameTimer(Sender: TObject);
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

procedure TMainForm.PaintBoxMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  PosX, PosY: UInt16;
begin
  PosX := Floor(X / PaintBox.Width * Rows);
  PosY := Floor(Y / PaintBox.Height * Cols);

  if (PosX <> MainForm.LastX) or (PosY <> MainForm.LastY) then
  begin
    Grid.Field[PosX, PosY] := not Grid.Field[PosX, PosY];

    MainForm.LastX := PosX;
    MainForm.LastY := PosY;

    PaintBox.Invalidate;
  end;
end;

procedure TMainForm.PaintBoxMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if ssLeft in Shift then
    PaintBoxMouseDown(PaintBox, mbLeft, Shift, X, Y);
end;

procedure TMainForm.PaintBoxMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  MainForm.LastX := -1;
  MainForm.LastY := -1;
end;

procedure TMainForm.Button_SetClick(Sender: TObject);
begin
  Rows := Edit_X.Value;
  Cols := Edit_Y.Value;

  Grid.SetSize(Rows, Cols);

  PaintBox.Invalidate;
end;

procedure TMainForm.Button_StartStopClick(Sender: TObject);
begin
  Timer_Game.Enabled := not Timer_Game.Enabled;

  case Timer_Game.Enabled of
    true: Button_StartStop.Caption := 'Stop';
    false: Button_StartStop.Caption := 'Start';
  end;
end;

procedure TMainForm.Edit_IntervalChange(Sender: TObject);
begin
  Timer_Game.Interval := Edit_Interval.Value;
end;

procedure TMainForm.Timer_GameTimer(Sender: TObject);
begin
  Grid.Calculate;
  PaintBox.Invalidate;
end;

end.

