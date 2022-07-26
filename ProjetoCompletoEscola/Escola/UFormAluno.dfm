object fmAluno: TfmAluno
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Escola'
  ClientHeight = 402
  ClientWidth = 620
  Color = clBtnFace
  CustomTitleBar.BackgroundColor = clWhite
  CustomTitleBar.ForegroundColor = 65793
  CustomTitleBar.InactiveBackgroundColor = clWhite
  CustomTitleBar.InactiveForegroundColor = 10066329
  CustomTitleBar.ButtonForegroundColor = 65793
  CustomTitleBar.ButtonBackgroundColor = clWhite
  CustomTitleBar.ButtonHoverForegroundColor = 65793
  CustomTitleBar.ButtonHoverBackgroundColor = 16053492
  CustomTitleBar.ButtonPressedForegroundColor = 65793
  CustomTitleBar.ButtonPressedBackgroundColor = 15395562
  CustomTitleBar.ButtonInactiveForegroundColor = 10066329
  CustomTitleBar.ButtonInactiveBackgroundColor = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  StyleElements = [seFont, seClient]
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 80
    Height = 16
    Caption = 'Matr'#237'cula:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'SimSun'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 111
    Top = 8
    Width = 112
    Height = 16
    Caption = 'Nome do Aluno:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'SimSun'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 450
    Top = 8
    Width = 152
    Height = 16
    Caption = 'Data de Nascimento:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'SimSun'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 16
    Top = 48
    Width = 56
    Height = 16
    Caption = 'Nota 1:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'SimSun'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 90
    Top = 48
    Width = 56
    Height = 16
    Caption = 'Nota 2:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'SimSun'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 162
    Top = 48
    Width = 56
    Height = 16
    Caption = 'Nota 3:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'SimSun'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 499
    Top = 66
    Width = 41
    Height = 20
    Caption = 'M'#233'dia:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbNota: TLabel
    Left = 259
    Top = 66
    Width = 4
    Height = 16
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edMatricula: TEdit
    Left = 16
    Top = 24
    Width = 80
    Height = 21
    Enabled = False
    TabOrder = 0
  end
  object edNomeAluno: TEdit
    Left = 111
    Top = 24
    Width = 274
    Height = 21
    TabOrder = 1
  end
  object dtDataNascimento: TDateTimePicker
    Left = 450
    Top = 24
    Width = 152
    Height = 21
    Date = 44758.000000000000000000
    Time = 0.372351377314771500
    TabOrder = 2
  end
  object edNota1: TEdit
    Left = 16
    Top = 70
    Width = 56
    Height = 21
    TabOrder = 3
    OnExit = edNota1Exit
    OnKeyPress = edNota1KeyPress
  end
  object edNota2: TEdit
    Left = 90
    Top = 70
    Width = 56
    Height = 21
    TabOrder = 4
    OnExit = edNota2Exit
    OnKeyPress = edNota2KeyPress
  end
  object edNota3: TEdit
    Left = 162
    Top = 70
    Width = 56
    Height = 21
    TabOrder = 5
    OnExit = edNota3Exit
    OnKeyPress = edNota3KeyPress
  end
  object btSalvar: TButton
    Left = 111
    Top = 97
    Width = 89
    Height = 33
    Caption = 'Salvar'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 6
    OnClick = btSalvarClick
  end
  object gridAlunos: TDBGrid
    Left = 16
    Top = 136
    Width = 586
    Height = 199
    DataSource = dsAlunos
    DefaultDrawing = False
    DrawingStyle = gdsGradient
    GradientEndColor = clCream
    GradientStartColor = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = True
    ParentFont = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = False
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = gridAlunosDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'MATRICULA'
        Title.Caption = 'Matr'#237'cula'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATANASCIMENTO'
        Title.Caption = 'Nascimento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTA1'
        Title.Caption = 'Nota 1'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTA2'
        Title.Caption = 'Nota 2'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTA3'
        Title.Caption = 'Nota 3'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONCEITO'
        Title.Caption = 'Conceito'
        Visible = True
      end>
  end
  object btExcluir: TButton
    Left = 16
    Top = 341
    Width = 89
    Height = 33
    Caption = 'Excluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 8
    OnClick = btExcluirClick
  end
  object edMedia: TEdit
    Left = 546
    Top = 64
    Width = 56
    Height = 23
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    OnExit = edNota1Exit
  end
  object btInserir: TButton
    Left = 16
    Top = 97
    Width = 89
    Height = 33
    Caption = 'Inserir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 10
    OnClick = btInserirClick
  end
  object Timer1: TTimer
    Interval = 500
    OnTimer = Timer1Timer
    Left = 144
    Top = 344
  end
  object dsAlunos: TDataSource
    DataSet = qrAlunos
    OnDataChange = dsAlunosDataChange
    Left = 272
    Top = 344
  end
  object qrAlunos: TFDQuery
    Connection = dmConexao.Conexao
    SQL.Strings = (
      'select * from alunos')
    Left = 336
    Top = 344
  end
end
