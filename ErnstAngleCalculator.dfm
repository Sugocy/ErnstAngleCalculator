object Form1: TForm1
  Left = 1730
  Top = 476
  Width = 634
  Height = 207
  Caption = 'Ernst Angle Calculator'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object label_TR: TLabel
    Left = 18
    Top = 16
    Width = 22
    Height = 16
    Caption = 'TR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object label_T1: TLabel
    Left = 18
    Top = 43
    Width = 19
    Height = 16
    Caption = 'T1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object label_Angle: TLabel
    Left = 18
    Top = 110
    Width = 41
    Height = 16
    Caption = 'Angle'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 544
    Top = 152
    Width = 72
    Height = 13
    Caption = 'Q. van Houtum'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object edit_TR: TEdit
    Left = 68
    Top = 16
    Width = 60
    Height = 21
    TabOrder = 0
  end
  object edit_T1: TEdit
    Left = 68
    Top = 44
    Width = 60
    Height = 21
    TabOrder = 1
  end
  object button_Calculate: TButton
    Left = 68
    Top = 72
    Width = 61
    Height = 22
    Caption = 'Calculate'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = button_CalculateClick
  end
  object edit_angle: TEdit
    Left = 68
    Top = 110
    Width = 60
    Height = 21
    TabOrder = 3
  end
  object axis: TChart
    Left = 136
    Top = 16
    Width = 457
    Height = 129
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    MarginBottom = 0
    MarginLeft = 5
    MarginRight = 10
    MarginTop = 0
    Title.Text.Strings = (
      '-')
    Title.Visible = False
    LeftAxis.LabelsOnAxis = False
    Legend.Visible = False
    View3D = False
    View3DWalls = False
    BevelOuter = bvNone
    BevelWidth = 0
    Color = clMenu
    TabOrder = 4
    object Signal: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      Title = 'Signal'
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
      object TeeFunction1: THighTeeFunction
      end
    end
    object SNR: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clBlack
      Title = 'SNR'
      LineBrush = bsClear
      Pointer.InflateMargins = True
      Pointer.Style = psCircle
      Pointer.Visible = True
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
  end
  object button_Delete: TButton
    Left = 568
    Top = 8
    Width = 25
    Height = 25
    Caption = 'Del'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = button_DeleteClick
  end
end
