unit UnitMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Net.URLClient,
  System.Net.HttpClient, System.Net.HttpClientComponent;

type
  TForm1 = class(TForm)
    btnAction: TButton;
    NetHTTPClient1: TNetHTTPClient;
    NetHTTPRequest1: TNetHTTPRequest;
    Button1: TButton;
    procedure btnActionClick(Sender: TObject);
  private
    { Private declarations }
    Filecount : Integer;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure SaveReponseToFile(Response: IHTTPResponse;var ResultFile : string);
var
  filestream : TFileStream;
  Count : Integer;
begin
  try
    filestream := nil;
    ResultFile := '';
    if Assigned(Response) and (Response.ContentStream.Size > 0) then
    begin
      //Find ledigt filnavn
      Inc(Form1.Filecount);
      ResultFile := Format('%shttp%s%s', ['c:\data\', IntToStr(Form1.Filecount), '.png'{GetExtension(Response.MimeType)}]);
      while FileExists(ResultFile) do
      begin
        Inc(Form1.Filecount);
        ResultFile := Format('%shttp%s%s', ['c:\data\', IntToStr(Form1.Filecount), '.png'{GetExtension(Response.MimeType)}]);
      end;
      filestream := TFileStream.Create(ResultFile, fmCreate);
      Response.ContentStream.Position := 0;
      filestream.CopyFrom(Response.ContentStream, Response.ContentStream.Size);
    end;
  finally
    FreeAndNil(filestream);
  end;
end;

procedure TForm1.btnActionClick(Sender: TObject);
var
  Response : IHTTPResponse;
  ResultFile : string;
begin
  NetHTTPClient1.ContentType := '';
  NetHTTPRequest1.MethodString := 'GET';
  NetHTTPRequest1.Asynchronous := False;
  NetHTTPRequest1.Accept := '*/*';
  NetHTTPRequest1.ConnectionTimeout := 5000;
  Response := self.NetHTTPClient1.Get('http://integracja.gugik.gov.pl/cgi-bin/KrajowaIntegracjaEwidencjiGruntow?SERVICE=WMS&VERSION=1.3.0&CRS=EPSG:4326&REQUEST=' +
  'GetMap&BBOX=53.1983653383526,18.0774878168918,53.2052417527806,18.0945252085544&IgnoreIllegallayers=true&LAYERS=numery_dzialek,dzialki&STYLES=Default,Default&WIDTH=795&HEIGHT=536&FORMAT=image/png&EXEPTIONS=WMSXML');
  SaveReponseToFile(Response, ResultFile);
end;

end.
