object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Caption = 
    'Dependency Analyser - Controle de depend'#234'ncias para projetos Del' +
    'phi'
  ClientHeight = 361
  ClientWidth = 484
  Color = clBtnFace
  Constraints.MinHeight = 400
  Constraints.MinWidth = 500
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 484
    Height = 361
    ActivePage = tsSelecaoArquivos
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 128
    ExplicitTop = 128
    ExplicitWidth = 289
    ExplicitHeight = 193
    object tsSelecaoArquivos: TTabSheet
      Caption = 'Sele'#231#227'o dos grupos'
      ExplicitWidth = 281
      ExplicitHeight = 165
      object pnlTopo: TPanel
        Left = 0
        Top = 0
        Width = 476
        Height = 73
        Align = alTop
        TabOrder = 0
        ExplicitWidth = 496
        DesignSize = (
          476
          73)
        object edtDirGrupoProjeto: TEdit
          Left = 32
          Top = 27
          Width = 365
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          TextHint = 'Informe aqui o caminho do grupo de projetos'
          ExplicitWidth = 377
        end
        object btnSelecionaProjeto: TButton
          Left = 435
          Top = 25
          Width = 26
          Height = 25
          Anchors = [akTop, akRight]
          Caption = '...'
          TabOrder = 1
          OnClick = btnSelecionaProjetoClick
          ExplicitLeft = 447
        end
        object btnAdicionar: TButton
          Left = 403
          Top = 25
          Width = 26
          Height = 25
          Anchors = [akTop, akRight]
          Caption = '->'
          TabOrder = 2
          OnClick = btnAdicionarClick
        end
      end
      object lbgListaGroupsProjeto: TListBox
        Left = 0
        Top = 73
        Width = 476
        Height = 260
        Align = alClient
        ItemHeight = 13
        TabOrder = 1
      end
    end
  end
  object otfArquivos: TOpenTextFileDialog
    Left = 328
    Top = 144
  end
end
