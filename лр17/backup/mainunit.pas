unit MainUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TfMain }

  TfMain = class(TForm)
    lClock: TLabel;
    Timer1: TTimer;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;

var
  fMain: TfMain;

implementation

{$R *.lfm}

{ TfMain }

//procedure TfMain.FormKeyPress(Sender: TObject; var Key: Char);
//begin
//  if (Key = VK_SPACE) then Close; // Закрываем форму при нажатии Esc
//end;

procedure TfMain.FormShow(Sender: TObject);
begin
  Randomize;
end;

procedure TfMain.Timer1Timer(Sender: TObject);
var
  i: byte; // для получения случайного числа
begin
  // Меняем надпись метки:
  lClock.Caption := FormatDateTime('hh:nn:ss', Now);

  // Получаем случайное направление:
  i := Random(4);

  // Двигаем метку в зависимости от направления:
  case i of
    0: lClock.Left := lClock.Left + 50; // вправо
    1: lClock.Left := lClock.Left - 50; // влево
    2: lClock.Top := lClock.Top + 25; // вниз
    3: lClock.Top := lClock.Top - 25; // вверх
  end;

  // Проверяем границы формы:
  if lClock.Left < 0 then lClock.Left := 0;
  if lClock.Top < 0 then lClock.Top := 0;
  if (lClock.Left + lClock.Width) > fMain.Width then
    lClock.Left := fMain.Width - lClock.Width;
  if (lClock.Top + lClock.Height) > fMain.Height then
    lClock.Top := fMain.Height - lClock.Height;
end;

end.

