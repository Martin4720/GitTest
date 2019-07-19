object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'FMain'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnAction: TButton
    Left = 288
    Top = 160
    Width = 75
    Height = 25
    Caption = 'btnAction'
    TabOrder = 0
    OnClick = btnActionClick
  end
  object Button1: TButton
    Left = 40
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
  end
  object NetHTTPClient1: TNetHTTPClient
    Asynchronous = False
    ConnectionTimeout = 60000
    ResponseTimeout = 60000
    HandleRedirects = True
    AllowCookies = True
    UserAgent = 'Embarcadero URI Client/1.0'
    Left = 432
    Top = 152
  end
  object NetHTTPRequest1: TNetHTTPRequest
    Asynchronous = False
    ConnectionTimeout = 60000
    ResponseTimeout = 60000
    Client = NetHTTPClient1
    Left = 376
    Top = 208
  end
end
