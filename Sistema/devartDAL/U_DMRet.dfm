object DMRet: TDMRet
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Height = 143
  Width = 187
  object QryAux: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      '')
    SQLConnection = Con
    Left = 112
    Top = 40
  end
  object Con: TSQLConnection
    ConnectionName = 'FETEC2016'
    DriverName = 'DevartSQLServer'
    LoginPrompt = False
    Params.Strings = (
      'GetDriverFunc=getSQLDriverSQLServer'
      'LibraryName=dbexpsda40.dll'
      'VendorLib=sqloledb.dll'
      'BlobSize=-1'
      'SchemaOverride=%.dbo'
      'HostName=(local)'
      'DataBase=Estoque'
      'User_Name=sa'
      'Password=aram98'
      'ProductName=DevartSQLServer'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DBXCommonDriver210.' +
        'bpl'
      
        'MetaDataPackageLoader=TDBXDevartMSSQLMetaDataCommandFactory,DbxD' +
        'evartSQLServerDriver210.bpl'
      'DriverUnit=DBXDevartSQLServer')
    BeforeConnect = ConBeforeConnect
    Left = 32
    Top = 40
  end
end
