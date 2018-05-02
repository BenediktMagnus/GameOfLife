object MainForm: TMainForm
  Left = 309
  Height = 610
  Top = 250
  Width = 893
  Caption = 'Game of Life'
  ClientHeight = 610
  ClientWidth = 893
  LCLVersion = '6.4'
  object PaintBox: TPaintBox
    Left = 0
    Height = 581
    Top = 0
    Width = 893
    Align = alClient
  end
  object PanelConfig: TPanel
    Left = 0
    Height = 29
    Top = 581
    Width = 893
    Align = alBottom
    ClientHeight = 29
    ClientWidth = 893
    TabOrder = 0
    object Edit_X: TSpinEdit
      AnchorSideLeft.Control = Label_X
      AnchorSideLeft.Side = asrBottom
      AnchorSideTop.Control = Label_X
      AnchorSideTop.Side = asrCenter
      Left = 51
      Height = 27
      Top = 1
      Width = 55
      Align = alLeft
      MaxValue = 512
      MinValue = 1
      TabOrder = 0
      Value = 16
    end
    object Edit_Y: TSpinEdit
      AnchorSideLeft.Control = Edit_X
      AnchorSideLeft.Side = asrBottom
      AnchorSideTop.Control = Edit_X
      AnchorSideTop.Side = asrCenter
      Left = 176
      Height = 27
      Top = 1
      Width = 55
      Align = alLeft
      MaxValue = 512
      MinValue = 1
      TabOrder = 1
      Value = 16
    end
    object Label_X: TLabel
      Left = 1
      Height = 27
      Top = 1
      Width = 50
      Align = alLeft
      Caption = ' Rows:  '
      Layout = tlCenter
      ParentColor = False
    end
    object Label_Y: TLabel
      Left = 106
      Height = 27
      Top = 1
      Width = 70
      Align = alLeft
      Caption = '   Colums:  '
      Layout = tlCenter
      ParentColor = False
    end
  end
end
