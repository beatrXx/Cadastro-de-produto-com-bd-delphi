object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 295
  ClientWidth = 423
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 88
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 136
    Top = 120
    Width = 31
    Height = 13
    Caption = 'Label2'
  end
  object Label3: TLabel
    Left = 184
    Top = 192
    Width = 170
    Height = 13
    Caption = 'asdasdjskladjsaldjlaskjdsalkdjsakdjs'
    Color = clBackground
    ParentColor = False
  end
  object Panel1: TPanel
    Left = 0
    Top = -1
    Width = 425
    Height = 41
    TabOrder = 0
    object lblEspecificacoes: TLabel
      Left = 160
      Top = 39
      Width = 69
      Height = 13
      Caption = 'Especifica'#231#245'es'
    end
    object btnNovo: TButton
      Left = 105
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Novo'
      TabOrder = 0
    end
    object btnListar: TButton
      Left = 186
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Listar'
      TabOrder = 1
      OnClick = btnListarClick
    end
    object btnInserir: TButton
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Inserir'
      TabOrder = 2
      OnClick = btnInserirClick
    end
  end
  object Dados: TPageControl
    Left = 0
    Top = 38
    Width = 425
    Height = 259
    ActivePage = pagDados
    Align = alCustom
    TabOrder = 1
    object pagDados: TTabSheet
      Caption = 'Dados'
      object lblNome: TLabel
        Left = 16
        Top = 16
        Width = 31
        Height = 13
        Caption = 'Nome:'
      end
      object lblModelo: TLabel
        Left = 16
        Top = 48
        Width = 38
        Height = 13
        Caption = 'Modelo:'
      end
      object lblData: TLabel
        Left = 182
        Top = 16
        Width = 81
        Height = 13
        Caption = 'Data de Cria'#231#227'o:'
      end
      object lblPreco: TLabel
        Left = 14
        Top = 80
        Width = 31
        Height = 13
        Caption = 'Pre'#231'o:'
      end
      object lblEspecificacoess: TLabel
        Left = 14
        Top = 149
        Width = 73
        Height = 13
        Caption = 'Especifica'#231#245'es:'
      end
      object txtNome: TEdit
        Left = 60
        Top = 13
        Width = 77
        Height = 21
        TabOrder = 0
      end
      object txtModelo: TEdit
        Left = 60
        Top = 45
        Width = 77
        Height = 21
        TabOrder = 1
      end
      object DateTimePicker1: TDateTimePicker
        Left = 182
        Top = 35
        Width = 81
        Height = 21
        Date = 43997.000000000000000000
        Time = 0.797386180558532900
        TabOrder = 2
      end
      object txtPreco: TEdit
        Left = 60
        Top = 77
        Width = 77
        Height = 21
        TabOrder = 3
      end
      object Memo1: TMemo
        Left = 14
        Top = 168
        Width = 387
        Height = 49
        Lines.Strings = (
          '')
        TabOrder = 4
      end
      object cbNacional: TCheckBox
        Left = 182
        Top = 79
        Width = 107
        Height = 17
        Caption = 'Produto Nacional'
        TabOrder = 5
      end
    end
    object pagBuscar: TTabSheet
      Caption = 'Buscar'
      ImageIndex = 1
      object lblBuscaNome: TLabel
        Left = 92
        Top = 39
        Width = 31
        Height = 13
        Caption = 'Nome:'
      end
      object lblBuscaCodigo: TLabel
        Left = 92
        Top = 112
        Width = 37
        Height = 13
        Caption = 'C'#243'digo:'
      end
      object txtNomeBuscar: TEdit
        Left = 92
        Top = 58
        Width = 121
        Height = 21
        TabOrder = 0
      end
      object txtCodigoBuscar: TEdit
        Left = 92
        Top = 131
        Width = 121
        Height = 21
        TabOrder = 1
      end
      object btnBuscaNome: TButton
        Left = 219
        Top = 56
        Width = 49
        Height = 25
        Caption = 'Buscar'
        TabOrder = 2
        OnClick = btnBuscaNomeClick
      end
      object btnBuscaCodigo: TButton
        Left = 219
        Top = 129
        Width = 49
        Height = 25
        Caption = 'Buscar'
        TabOrder = 3
        OnClick = btnBuscaCodigoClick
      end
      object btnApagarCodigo: TButton
        Left = 274
        Top = 129
        Width = 49
        Height = 25
        Caption = 'Apagar'
        TabOrder = 4
        OnClick = btnApagarCodigoClick
      end
      object btnApagarNome: TButton
        Left = 274
        Top = 56
        Width = 49
        Height = 25
        Caption = 'Apagar'
        TabOrder = 5
        OnClick = btnApagarNomeClick
      end
    end
    object Listar: TTabSheet
      Caption = 'Listar'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 230
      object DBGrid1: TDBGrid
        Left = 62
        Top = 221
        Width = 320
        Height = 120
        DataSource = DataSource1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object Memo2: TMemo
        Left = 0
        Top = 0
        Width = 417
        Height = 231
        Align = alClient
        Lines.Strings = (
          '')
        TabOrder = 1
      end
    end
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLNCLI11.1;Persist Security Info=False;User ID=sa;Init' +
      'ial Catalog=cadastro;Data Source=(local);Use Procedure for Prepa' +
      're=1;Auto Translate=True;Packet Size=4096;Workstation ID=LAPTOP-' +
      'L7QCTLPK;Initial File Name="";Use Encryption for Data=False;Tag ' +
      'with column collation when possible=False;MARS Connection=False;' +
      'DataTypeCompatibility=0;Trust Server Certificate=False;Server SP' +
      'N="";Application Intent=READWRITE;password="123456"'
    LoginPrompt = False
    Provider = 'SQLNCLI11.1'
    Left = 288
    Top = 7
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Produtos')
    Left = 360
    Top = 7
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 396
    Top = 22
  end
end
