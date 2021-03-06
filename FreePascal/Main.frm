object MainForm: TMainForm
  Left = 309
  Height = 610
  Top = 250
  Width = 893
  Caption = 'Game of Life'
  ClientHeight = 610
  ClientWidth = 893
  OnCreate = FormCreate
  LCLVersion = '6.4'
  object PaintBox: TPaintBox
    Left = 0
    Height = 581
    Top = 0
    Width = 893
    Align = alClient
    Color = clBlack
    ParentColor = False
    OnMouseDown = PaintBoxMouseDown
    OnMouseMove = PaintBoxMouseMove
    OnMouseUp = PaintBoxMouseUp
    OnPaint = PaintBoxPaint
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
      Left = 50
      Height = 27
      Top = 1
      Width = 55
      Align = alLeft
      BorderSpacing.Left = 6
      MaxValue = 512
      MinValue = 1
      TabStop = False
      TabOrder = 1
      Value = 16
    end
    object Edit_Y: TSpinEdit
      AnchorSideLeft.Control = Edit_X
      AnchorSideLeft.Side = asrBottom
      AnchorSideTop.Control = Edit_X
      AnchorSideTop.Side = asrCenter
      Left = 174
      Height = 27
      Top = 1
      Width = 55
      Align = alLeft
      BorderSpacing.Left = 6
      MaxValue = 512
      MinValue = 1
      TabStop = False
      TabOrder = 0
      Value = 16
    end
    object Label_X: TLabel
      Left = 3
      Height = 27
      Top = 1
      Width = 41
      Align = alLeft
      BorderSpacing.Left = 2
      Caption = 'Rows:'
      Layout = tlCenter
      ParentColor = False
    end
    object Label_Y: TLabel
      Left = 113
      Height = 27
      Top = 1
      Width = 55
      Align = alLeft
      BorderSpacing.Left = 8
      Caption = 'Colums:'
      Layout = tlCenter
      ParentColor = False
    end
    object Button_Set: TButton
      AnchorSideLeft.Control = Edit_Y
      AnchorSideLeft.Side = asrBottom
      AnchorSideTop.Control = Edit_Y
      AnchorSideTop.Side = asrCenter
      Left = 237
      Height = 27
      Top = 1
      Width = 75
      Align = alLeft
      BorderSpacing.Left = 8
      Caption = 'Set'
      OnClick = Button_SetClick
      TabOrder = 2
    end
    object Button_StartStop: TButton
      AnchorSideLeft.Control = Button_Set
      AnchorSideLeft.Side = asrBottom
      AnchorSideTop.Control = Button_Set
      AnchorSideTop.Side = asrCenter
      Left = 320
      Height = 27
      Top = 1
      Width = 75
      Align = alLeft
      BorderSpacing.Left = 8
      Caption = 'Start'
      OnClick = Button_StartStopClick
      TabOrder = 3
    end
    object Edit_Interval: TSpinEdit
      AnchorSideLeft.Control = Label_Interval
      AnchorSideLeft.Side = asrBottom
      AnchorSideTop.Control = Label_Interval
      AnchorSideTop.Side = asrCenter
      Left = 480
      Height = 27
      Top = 1
      Width = 68
      Align = alLeft
      Alignment = taRightJustify
      BorderSpacing.Left = 4
      Increment = 10
      MaxValue = 10000
      MinValue = 10
      OnChange = Edit_IntervalChange
      TabOrder = 4
      Value = 500
    end
    object Label_Interval: TLabel
      AnchorSideLeft.Control = Button_StartStop
      AnchorSideLeft.Side = asrBottom
      AnchorSideTop.Control = Button_StartStop
      AnchorSideTop.Side = asrCenter
      Left = 419
      Height = 27
      Top = 1
      Width = 57
      Align = alLeft
      BorderSpacing.Left = 24
      Caption = 'Interval:'
      Layout = tlCenter
      ParentColor = False
    end
    object Label_Interval_ms: TLabel
      Left = 550
      Height = 27
      Top = 1
      Width = 20
      Align = alLeft
      BorderSpacing.Left = 2
      Caption = 'ms'
      Layout = tlCenter
      ParentColor = False
    end
  end
  object Timer_Game: TTimer
    Enabled = False
    OnTimer = Timer_GameTimer
    Left = 856
    Top = 576
  end
end
