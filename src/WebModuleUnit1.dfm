object WebModule1: TWebModule1
  OldCreateOrder = False
  Height = 600
  Width = 800
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=MSSQL'
      'Server=localhost'
      'Database=LibraryDB'
      'User_Name=sa'
      'Password=your_password')
    LoginPrompt = False
    Connected = True
    Left = 32
    Top = 16
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM Книги')
    Left = 32
    Top = 64
  end
end
