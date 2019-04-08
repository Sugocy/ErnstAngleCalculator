unit ErnstAngleCalculator;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Math, ExtCtrls, TeeProcs, TeEngine, Chart, Series,
  TeeFunci;

type
  TForm1 = class(TForm)
    edit_TR: TEdit;
    edit_T1: TEdit;
    label_TR: TLabel;
    label_T1: TLabel;
    button_Calculate: TButton;
    edit_angle: TEdit;
    axis: TChart;
    label_Angle: TLabel;
    Signal: TLineSeries;
    SNR: TLineSeries;
    button_Delete: TButton;
    TeeFunction1: THighTeeFunction;
    Label1: TLabel;
    procedure button_CalculateClick(Sender: TObject);
    procedure button_DeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}



function signalSteadyState(TR, T1, FA: Double): Double;
var
  E1, nom, den: Double;
begin
    E1 := exp(-1 * TR/T1);
    nom := (Sin( (pi/180)*(FA) ))  * (1-E1);
    den := 1 - (Cos( (pi/180)*(FA) )) * E1;
    Result := nom/den;
end;

function roundDecimal(inp : Double; ndec : integer): Double;
var
  Inp_Maxed : Double;
  Inp_Rounded : Integer;
begin
  Inp_Maxed := inp*Power(10,ndec);
  Inp_Rounded := round(Inp_Maxed);
  Result := Inp_Rounded / Power(10,ndec);
end;


procedure TForm1.button_CalculateClick(Sender: TObject);
var
  TR, T1, E1, FA : Extended;
  TRt, T1t, FAt : String;
  sig, FAm : double;
  ii, skip: Integer;
begin
   // Entry from from edits
   TRt := edit_TR.Text;
   T1t := edit_T1.Text;
   FAt := edit_angle.Text;

   // Clear Graph             
   Signal.Clear;

   // Calculate FA
   if (TRt <> '')  and (T1t <> '')  then
   begin
      TR := StrToFloat(TRt);
      T1 := StrToFloat(T1t);

      if (TR = 0) or (T1 = 0) then exit;

      // Calculate E1 - Haacke Ch18
      E1 := exp(-1*TR/T1);
      // Ernst angle in degrees
      FA := RadToDeg(ArcCos(E1));

      // Set output
      edit_angle.Text := FloatToStr(roundDecimal(FA,3));

      skip := 1;
   end;

   // Calculate TR
   if  (FAt <> '') and (T1t <> '')  and (skip <> 1)  then
   begin
       FA := StrToFloat(FAt);
       T1 := StrToFloat(T1t);

       // Calculate E1 - Haacke style one
       TR := -T1*Ln((Cos( (pi/180)*(FA)) ));
       // Set output

      edit_TR.Text := FloatToStr(roundDecimal(TR,3));
      //exit
      skip := 1;
   end;

      // Calculate T1
   if  (TRt <> '') and (FAt <> '') and (skip <> 1) then
   begin
      FA := StrToFloat(FAt);
      TR := StrToFloat(TRt);

      // Calculate E1 - Haacke style one
      T1 := (-1*TR)/Ln((Cos((pi/180)*(FA))));
      // Set output

      edit_T1.Text := FloatToStr(roundDecimal(T1,3));

      // Exit
      skip := 1;
   end;

   // Graphics
   for ii:=1 to 90 do
   begin
      FAm := ii ;
      sig := signalSteadyState(TR, T1, FAm);
      Signal.AddXY(FAm, sig);
   end;
   SNR.AddXY(FA, signalSteadyState(TR, T1, FA));

end;

procedure TForm1.button_DeleteClick(Sender: TObject);
begin

     Signal.Clear;
      SNR.Clear;
end;







end.
