unit UGrid;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  TField = Array of Array of Boolean;

type
  TGrid = class
  protected
    FField: TField;
  public
    procedure SetSize (ARows, ACols: SizeInt);
    property Field: TField read FField;
  end;

implementation

procedure TGrid.SetSize (ARows, ACols: SizeInt);
var
  i: Integer;
begin
  SetLength(FField, ARows);
  for i := Low(FField) to High(FField) do
    SetLength(FField[i], ARows);
end;

end.

