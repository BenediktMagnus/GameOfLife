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
    FRows, FCols: UInt16;
    function Neighbours (x, y: UInt16): Byte;
  public
    procedure SetSize (ARows, ACols: UInt16);
    procedure Calculate;
    property Field: TField read FField;
  end;

implementation

procedure TGrid.SetSize (ARows, ACols: UInt16);
begin
  SetLength(FField, 0, 0); //Delete the grid first.
  SetLength(FField, ARows, ACols);

  FRows := ARows;
  FCols := ACols;
end;

procedure TGrid.Calculate;
var
  x, y: UInt16;
  LField: TField;
begin
  SetLength(LField, FRows, FCols);

  for x := 0 to FRows - 1 do
    for y := 0 to FCols - 1 do
      case Neighbours(x, y) of
        0, 1, 4, 5, 6, 7, 8: LField[x, y] := false;
        2: LField[x, y] := FField[x, y];
        3: LField[x, y] := true;
      end;

  FField := LField;
end;

function TGrid.Neighbours (x, y: UInt16): Byte;
var
  x1, y1: Int16;
begin
  Result := 0;

  for x1 := x - 1 to x + 1 do
    for y1 := y - 1 to y + 1 do
      if (x1 >= 0) and (x1 < FRows) and (y1 >= 0) and (y1 < FCols) and FField[x1, y1] then
        Inc(Result);

  if FField[x, y] then
    Dec(Result);
end;

end.

