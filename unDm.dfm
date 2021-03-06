object DM: TDM
  OldCreateOrder = False
  Left = 192
  Top = 119
  Height = 248
  Width = 481
  object DB: TDatabase
    DatabaseName = 'DBREZis'
    DriverName = 'STANDARD'
    KeepConnection = False
    LoginPrompt = False
    Params.Strings = (
      'PATH=db'
      'DEFAULT DRIVER=PARADOX'
      'ENABLE BCD=FALSE')
    SessionName = 'Default'
    Left = 80
    Top = 8
  end
  object tblREzis: TTable
    DatabaseName = 'DBREZis'
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftAutoInc
      end
      item
        Name = 'Type'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Om'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'tblREzisIndex1'
        Fields = 'id'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'rEzis'
    Left = 40
    Top = 56
  end
  object qRezis: TQuery
    DatabaseName = 'DBREZis'
    RequestLive = True
    SQL.Strings = (
      'select * from rezis')
    UpdateObject = usRezis
    Left = 144
    Top = 56
  end
  object usRezis: TUpdateSQL
    ModifySQL.Strings = (
      'update rezis'
      'set'
      '  Type = :Type,'
      '  Om = :Om'
      'where'
      '  id = :OLD_id')
    InsertSQL.Strings = (
      'insert into rezis'
      '  (Type, Om)'
      'values'
      '  (:Type, :Om)')
    DeleteSQL.Strings = (
      'delete from rezis'
      'where'
      '  id = :OLD_id')
    Left = 256
    Top = 56
  end
  object dsRezis: TDataSource
    DataSet = qRezis
    Left = 200
    Top = 56
  end
  object qryWork: TQuery
    DatabaseName = 'DBREZis'
    Left = 152
    Top = 128
  end
end
