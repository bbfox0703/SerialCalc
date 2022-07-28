unit main0;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, md5;

const
  PasswordLength = 8;  // max 10



type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  iLead: integer;
  iStr: integer;
  i: integer;
  s1: String;
  src, dst, shash: String;
begin
  src := Edit3.Text;
  dst := '';
  Edit1.Text := UpperCase(MD5Print(MD5String(UpperCase(src))));
  shash := Copy(Edit1.Text, Length(Edit1.Text) - PasswordLength*3, PasswordLength*3);
  for i := 0 to PasswordLength - 1 do
  begin
    s1 := Copy(shash, i*3+1, 3);
    iStr := StrToInt('$' + s1) * 373;
    iLead := iStr mod 37;
    case iLead of
      0..7 : iLead := iLead + 50;
    else
      iLead := iLead + 89;
    end;
    dst := dst + Chr(iLead);
  end;
  Edit2.Text := dst;
end;

end.