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
    PaintBox: TPaintBox;
    PanelConfig: TPanel;
    Edit_X: TSpinEdit;
    Edit_Y: TSpinEdit;
    Label_X: TLabel;
    Label_Y: TLabel;
    procedure FormCreate(Sender: TObject);
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
end.

