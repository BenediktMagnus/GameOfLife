unit Main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Spin;

type
  { TMainForm }
  TMainForm = class(TForm)
    PaintBox: TPaintBox;
    PanelConfig: TPanel;
    Edit_X: TSpinEdit;
    Edit_Y: TSpinEdit;
    Label_X: TLabel;
    Label_Y: TLabel;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.frm}

end.

