object dmConexaoLoja: TdmConexaoLoja
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 193
  Width = 330
  object Conexao: TFDConnection
    Params.Strings = (
      'DriverID=fB'
      'User_Name=sysdba'
      'Password=masterkey')
    LoginPrompt = False
    BeforeConnect = ConexaoBeforeConnect
    Left = 24
    Top = 16
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 120
    Top = 16
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 24
    Top = 80
  end
  object fdAux: TFDQuery
    Connection = Conexao
    Left = 112
    Top = 88
  end
end
