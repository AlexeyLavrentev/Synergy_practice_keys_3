unit WebModuleUnit1;

interface

uses
  System.SysUtils, System.Classes, Web.HTTPApp, FireDAC.Comp.Client,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.Stan.Param, Data.DB;

type
  TWebModule1 = class(TWebModule)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    procedure WebModule1DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModule1: TWebModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TWebModule1.WebModule1DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  HTML: string;
begin
  // Пример запроса на получение списка книг
  FDQuery1.SQL.Text := 'SELECT * FROM Книги';
  FDQuery1.Open;

  // Формирование HTML-ответа
  HTML := '<html><body><h1>Список книг</h1><ul>';
  while not FDQuery1.Eof do
  begin
    HTML := HTML + '<li>' + FDQuery1.FieldByName('Название').AsString + ' - ' +
      FDQuery1.FieldByName('Автор').AsString + '</li>';
    FDQuery1.Next;
  end;
  HTML := HTML + '</ul></body></html>';

  // Отправка HTML-ответа клиенту
  Response.Content := HTML;
  Handled := True;
end;

end.