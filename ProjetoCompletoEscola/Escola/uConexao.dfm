object dmConexao: TdmConexao
  OldCreateOrder = False
  Height = 74
  Width = 353
  object Conexao: TFDConnection
    Params.Strings = (
      'DriverID=FB'
      'User_Name=sysdba'
      'Password=masterkey')
    LoginPrompt = False
    BeforeConnect = ConexaoBeforeConnect
    Left = 24
    Top = 16
  end
  object qrAuxiliar: TFDQuery
    Connection = Conexao
    Left = 88
    Top = 16
  end
end
