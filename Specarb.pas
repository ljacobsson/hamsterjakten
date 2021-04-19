program specialarbete;
{$M 10000, 0, 655360}
   uses crt,graph,bmpunit,mus;
   const deg=pi/180;
         rumnum=13;
         rum:array[1..rumnum,2..9] of byte=
         ((2,3,4,5,0,0,0,0),
          (1,8,0,0,0,0,0,0),
          (1,0,0,0,0,0,0,0),
          (1,0,0,0,0,0,0,0),
          (1,6,7,12,0,0,0,0),
          (5,0,0,0,0,0,0,0),
          (5,0,0,0,0,0,0,0),
          (2,9,10,0,0,0,0,0),
          (8,0,0,0,0,0,0,0),
          (8,0,0,0,0,0,0,0),
          (0,0,0,0,0,0,0,0),
          (13,6,5,0,0,0,0,0),
          (0,0,0,0,0,0,0,0));

      rumx:array[1..rumnum,2..9] of integer=
      ((3,160,100,317,0,0,0,0),
       (317,3,0,0,0,0,0,0),
       (160,0,0,0,0,0,0,0),
       (285,0,0,0,0,0,0,0),
       (3,160,100,160,0,0,0,0),
       (170,0,0,0,0,0,0,0),
       (230,0,0,0,0,0,0,0),
       (315,140,5,0,0,0,0,0),
       (150,0,0,0,0,0,0,0),
       (314,0,0,0,0,0,0,0),
       (0,0,0,0,0,0,0,0),
       (0,120,57,0,0,0,0,0),
       (0,0,0,0,0,0,0,0));

      rumy:array[1..rumnum,2..9] of integer=
      ((0,107,100,0,0,0,0,0),
       (0,0,0,0,0,0,0,0),
       (105,0,0,0,0,0,0,0),
       (100,0,0,0,0,0,0,0),
       (0,100,90,117,0,0,0,0),
       (80,0,0,0,0,0,0,0),
       (90,0,0,0,0,0,0,0),
       (0,100,0,0,0,0,0,0),
       (110,0,0,0,0,0,0,0),
       (110,0,0,0,0,0,0,0),
       (0,0,0,0,0,0,0,0),
       (0,90,100,0,0,0,0,0),
       (0,0,0,0,0,0,0,0));

      titta:array[1..rumnum] of string=
('Du står utanför ett fint hotell|på en av stadens finare gator.|En stor och vacker park breder|ut sig'+
       ' bredvid hotellet.|Tre bilar står parkerade på gatan.|En tidning Ligger på trotoaren.',
       'Du står utanför ett stort gammalt hus.',
       'Du är i lobbyn på hotellet.|Bakom disken står en mycket|gammal man. På ena väggen|hänger en ful tavla. '+
       'Du ser|också tre bord utan stolar.',
       'Du är i parken...',
       'Du är på gatans slut vid en liten|restaurang med uteservering och|allt.',
       'Du ser en gigantisk vakt som|skymmer dörren till baren.|Honom vill du nog inte|bråka med...',
       'Du är i den ryske fiskaren Alexandrij|Kroznyjs fiskemagasin. Det luktar|gammal fisk från fiskenätet som|'+
        'hänger på torkning i taket.',
       'Du har hamnat utanför en|affär som heter Bosses|livs. Du ser även en|bankomat och ett fint|äppelträd.',
       'Du är i en liten affär|där dom säljer det mesta.|Det sitter en anslagstavla|på väggen.',
       'Du är utanför ett litet|hus där en fönsterruta|har krossats.|En överfull soptunna står vid|gatans slut.',
       'Du är i ett väldigt litet hus|med pyttesmå möbler.|En liten gumma står och grejar|med något mitt på golvet.',
       'Du har kommit in i baren. Det sitter|en tuff kille vid det enda bordet|och dricker öl. Bartendern ser|'+
        'dock trevlig ut.',
       'Du har hamnat i ett underjordiskt rum|Du har ingen chans att ta dig|upp till den stängda luckan igen.|'+
        'I slutet av gången rinner en grön,|illaluktande sörja. En repstege leder|upp till ett brunsslock med '+
        'ett stort|hänglås.');

       hjalptext='Hjälp|'+
                      'Piltangenter: Navigera|'+
                      '  T: Se dig omkring|'+
                      '  I: Inventarier|'+
                      '  C: Räkna pengar|'+
                      ' F1: Denna meny|'+
                      ' F2: Spara spel|'+
                      ' F3: Hämta spel|'+
                      ' F4: Börja om|'+
                      ' F5: Använd mobiltelefon|'+
                      'ESC: Avsluta';


       events:array[1..rumnum,1..5] of string=(
       ('','Läs tidningen','','',''),
       ('Knacka på dörren','','','',''),
       ('Tala med receptionisten','','','',''),
       ('Titta i vattnet','','','',''),
       ('Läs på skylten','Rota i soptunnan','Kapa snöret och fånga hamstern','',''),
       ('Tala med dörrvakten','','','',''),
       ('Tala med fiskargubben','','','',''),
       ('Ta ett äpple','Ta ut pengar','','',''),
       ('Titta på anslagstavlan','Tala med expediten','Kolla vad som finns i hyllan','',''),
       ('Klättra in genom fönstret','Tala med fågeln','Rota i soptunnan','Ta en glasskärva',''),
       ('Öppna byrålåda','Klättra ut','Tala med gumman','',''),
       ('Tala med bartendern','Tala med den tuffa killen','','',''),
       ('Klättra upp','','','',''));

       inventarier:array[1..17] of string =(
       'VISA-kort',
       'Kundkorg med hamstermat i',
       'Paket med plåster',
       'Silverklocka',
       'Alvedon brustabletter',
       'Mobiltelefon [F5]',
       'Flaska med vatten',
       'Nyckel',
       'Havfull vattenflaska',
       'Vass glasskärva',
       'Pengar [C]',
       'Medlemskort',
       'Hamstermat',
       '50 ryska rubel',
       'Håv',
       'Hamster',
       'Pälsmössa');
       vanster=-1;
       hoger=1;
       upp=2;
       ner=3;

      {$i kropp}

      type
     fbdatatyp=object
     djup:integer;
end;
var v,x,y,skuld,visakort,cash,dir:integer;
    invent:array[1..25] of boolean;
    fb:array[0..16] of fbdatatyp;

    bgxcol,dettarum,key:byte;
    visagubbe:boolean;

function int2str(x:longint):string;
var s:string;
begin
   str(x,s);
   int2str:=s;
end;

procedure grafik(g1,g2:integer);
var errcode:integer;
begin
   initgraph(g1,g2,'bgi');
   ErrCode := GraphResult;
   if ErrCode <> grOk then begin
      writeln('Ditt grafikkort funkar inte');
      halt(0);
   end;
end;

procedure intro;
var key:char;
i:byte;
begin
   setrgbpalette(15,0,0,0);
   loadbg(27);
   delay(1000);
   for i:=1 to 63 do
   begin
       setrgbpalette(15,0,i,i);
       delay(10);
   end;
   delay(1000);
   for i:=63 downto 0 do
   begin
        setrgbpalette(15,0,i,i);
        delay(10);
   end;
   cleardevice;
   delay(1000);
   loadbg(28);
   for i:=1 to 63 do
   begin
        setrgbpalette(15,0,i,i);
        delay(10);
   end;
   delay(1000);
   for i:=63 downto 0 do
   begin
   setrgbpalette(15,0,i,i);
   delay(10);
   end;

   cleardevice;
   setcolor(15);
   rectangle(11,1,309,161);
   rectangle(13,3,307,159);
   settextstyle(1,0,5);
   outtextxy(15,5,'En morgon när borgmästaren vaknade');
   outtextxy(15,15,'upptäckte han att hans livskamrat,');
   outtextxy(15,25,'hamstern Roffe, var försvunnen. Det');
   outtextxy(15,35,'enda han såg var några smutsiga');
   outtextxy(15,45,'fotsteg som ledde från och till');
   outtextxy(15,55,'fönstret. Borgmästaren drog');
   outtextxy(15,65,'slutsatsen att någon hade varit där');
   outtextxy(15,75,'och stulit Roffe från honom. Han');
   outtextxy(15,85,'kastade sig på telefonen och ringde');
   outtextxy(15,95,'dig.');
   outtextxy(15,105,'Varför han ringde just dig vet du');
   outtextxy(15,115,'inte, men du antog uppdraget att');
   outtextxy(15,125,'försöka hitta hans hamster...');
   outtextxy(15,150,'Tryck [space] för att starta jakten');
   for i:=1 to 63 do begin
   setrgbpalette(15,i,i,i);
   delay(10);
   end;
   repeat
      key:=readkey;
   until key=' ';
   for i:=63 downto 0 do begin
   setrgbpalette(15,i,i,i);
   delay(10);
   end;
   cleardevice;
   setrgbpalette(15,63,63,63);
end;
procedure sudda(x,y,xsize,ysize:integer);
var a,b:integer;
begin
   for b:=y to y+ysize do
   for a:=x to x+xsize do if ((a<320) and (a>=0)) and ((b<150) and (b>=0)) then putpixel(a,b,bg^[a,b]);
end;

procedure eventtext(txt:string);
begin
   setfillstyle(1,0);
   bar(0,150,320,159);
   setcolor(10);
   outtextxy(1,151,txt);
   setcolor(1);
   line(0,160,320,160);
end;

procedure ritaben(x,y,yy:integer;typ:byte);
var benfel:integer;
a,b:integer;
bgpixel:byte;
begin
   if typ=0 then begin
      if dir=-1 then benfel:=2 else benfel:=0;
      for b:=0 to 4 do
      for a:=0 to 4 do
      begin
         bgpixel:=bgy^[x+dir*(b+1)+benfel,y+a+3];
      if (yy+7>fb[bgpixel-1].djup) then if ben[a,b]<>0 then begin putpixel(x+dir*(b+1)+benfel,y+a+3,ben[a,b]);end;
   end;
end;

if typ=1 then begin
   for b:=0 to 2 do
   for a:=0 to 4 do
   begin
      bgpixel:=bgy^[x+(b+1),y+a+3];
   if (yy+7>fb[bgpixel-1].djup) then if ben[a,b]<>0 then begin putpixel(x+(b+1),y+a+3,ben[a,b]);end;
end;
end;

end;
procedure ritakropp(x,y:integer;typ:byte);
var a,b:integer;
    bgpixel:byte;
begin
   if typ=0 then begin
      for b:=0 to 10 do
      for a:=0 to 10 do
      begin
         bgpixel:=bgy^[x+dir*(b-4),y+a-7];
      if (y+7>fb[bgpixel-1].djup) then if kropp[a,b]<>0 then begin putpixel(x+dir*(b-4),y+a-7,kropp[a,b]);end;
   end;
end;
if typ=1 then begin
   for b:=0 to 10 do
   for a:=0 to 10 do
   begin
      bgpixel:=bgy^[x+(b-4),y+a-7];
   if (y+7>fb[bgpixel-1].djup) then if kroppfb[a,b]<>0 then begin putpixel(x+(b-4),y+a-7,kroppfb[a,b]);end;
end;
end;

end;
procedure ritahuvud(x,y,yy:integer;typ:byte);
var i,a,b:integer;
    bgpixel:byte;
begin
   if typ=0 then begin
      for b:=0 to 5 do
      for a:=0 to 5 do
      begin
         bgpixel:=bgy^[x+dir*(b-1),y+a-10];
      if (yy+7>fb[bgpixel-1].djup) then if huvud[a,b]<>0 then begin putpixel(x+dir*(b-1),y+a-10,huvud[a,b]);end;
   end;
end;
if typ=1 then begin
   for b:=0 to 5 do
   for a:=0 to 5 do
   begin
      bgpixel:=bgy^[x+(b-1),y+a-10];
      if (yy+7>fb[bgpixel-1].djup) then if huvudfb[a,b]<>0 then begin
         if dir=ner then putpixel(x+(b-1),y+a-10,huvudfb[a,b]);
         if dir=upp then if (huvudfb[a,b]=4) or (huvudfb[a,b]=3) then putpixel(x+(b-1),y+a-10,42)else
                         putpixel(x+(b-1),y+a-10,huvudfb[a,b]);
      end;
   end;
end;

end;
procedure ritaarmar(x,y,yy:integer;typ:byte);
var a,b:integer;
    bgpixel:byte;
begin
   for b:=0 to 1 do
   for a:=0 to 5 do begin
      if typ=0 then begin
         bgpixel:=bgy^[x+dir*b,y+a-3];
      if (yy+7>fb[bgpixel-1].djup) then if arm[a,b]<>0 then begin putpixel(x+dir*b,y+a-3,arm[a,b]);end;
   end;

if typ=1 then begin
   bgpixel:=bgy^[x+b,y+a-3];
if (yy+7>fb[bgpixel-1].djup) then if (arm[a,b]<>0) and (b<>1) then  putpixel(x+b,y+a-3,arm[a,b]);
end;

end;
end;
function upphojt(x,y:integer):integer;
var i:integer;
begin
   for i:=1 to y-1 do x:=x*x;
   if y=0 then upphojt:=1 else upphojt:=x;
end;

procedure laddabg(nr:integer);
var a,b,i:integer;
begin
   if nr=8 then setrgbpalette(13,63,63,0);
   loadbg(nr);
   for a:=0 to 16 do fb[a].djup:=0;
   for a:=0 to 48 do fb[a div 3].djup:=fb[a div 3].djup+  upphojt(10,2-(a mod 3)) *bgy^[a,0];

dettarum:=nr;
eventtext(':)');
end;

procedure ritagubbe;
var i,dr,bg,justering:integer;
begin
   if dir= upp then justering:=-2 else justering:=0;
   if dir<2 then begin
      ritaben(x+round(3*cos((v+180)*deg))-1,y+round(1*sin((v+180)*deg))-1,y,0);
      ritakropp(x,y,0);
      ritaben(x+round(3*cos(v*deg))-1,y+round(1*sin(v*deg))-1,y,0);
      ritahuvud(x,y+round(1*sin(2*v*deg))-2,y,0);
      ritaarmar(x,y+round(1*sin(2*v*deg))-2,y,0);
   end;
   if dir>1 then begin
      ritaben(x-3+justering,y+round(1*sin((v+180)*deg))-1,y,1);
      ritaben(x+1+justering,y+round(1*sin(v*deg))-1,y,1);
      if dir=upp then begin
         ritaarmar(x-3+justering,y-2,y,1);
         ritaarmar(x+5+justering,y-2,y,1);
      end;
      ritakropp(x+justering,y,1);
      if dir=ner then begin
         ritaarmar(x-3+justering,y-2,y,1);
         ritaarmar(x+5+justering,y-2,y,1);
      end;
      ritahuvud(x+justering,y-2,y,1);
   end;
   if (bgx^[x,y+7]>1) and (bgx^[x,y+7]<10) then
   begin
      bg:=bgx^[x,y+7];
      dr:=dettarum;
      laddabg(rum[dr, bg]);
      if rumx[dr,bg]>0 then x:=rumx[dr,bg];
      if rumy[dr,bg]>0 then y:=rumy[dr,bg];
      ritagubbe;
   end;
end;
procedure textruta(x1,y1:integer;text:string;keyout:byte);
var stbredd,textbredd,xsize,ysize,yy,xx,a,b,i:integer;
    key,nedhopp:byte;

begin
   nedhopp:=0;
   stbredd:=0;
   textbredd:=0;
   settextstyle(0,0,0);
   for i:=1 to length(text) do begin
      if textbredd>stbredd then stbredd:=textbredd;
      if text[i]='|' then begin inc(nedhopp);textbredd:=1; end else inc(textbredd);
   end;
   xsize:=stbredd*8+4;
   ysize:=10*(nedhopp+1)+3;
   if x1=0 then x1:=160-xsize div 2;
   if y1=0 then y1:=75-ysize div 2;
   for b:=y1+11 to y1+ysize do
   for a:=x1 to x1+xsize do begin
      putpixel(a,b,getpixel(a,b)+200);
   end;
   setfillstyle(1,14);
   bar(x1,y1,x1+xsize,y1+11);
   setcolor(25);
   rectangle(x1,y1,x1+xsize,y1+ysize);
   line(x1,y1+11,x1+xsize,y1+11);
   settextjustify(0,2);
   setcolor(0);
   yy:=0;
   xx:=0;
   for i:=1 to length(text) do begin
      inc(xx);

if text[i]<>'|' then outtextxy(x1+8*xx-4,y1+yy+3,text[i]) else begin inc(yy,10);xx:=0;setcolor(15);end;
end;
if keyout>1 then begin
   repeat
      key:=ord(readkey);
   until key=keyout;
end;
if keyout=1 then begin
   repeat
      key:=ord(readkey);
   until (upcase(chr(key))='J') or (upcase(chr(key))='N');
end;

if keyout<>0 then begin sudda(x1,y1,xsize,ysize);
if visagubbe then ritagubbe;end;
end;
procedure gameover;
var key:char;
begin
   delay(2000);
   textruta(0,0,'GAME OVER|Försök lösa problemet|på ett annat sätt|nästa gång...',32);
   cleardevice;
   delay(1000);
   setcolor(15);
   setrgbpalette(15,0,0,0);
   rectangle(11,71,309,106);
   rectangle(13,73,307,104);
   outtextxy(15,75,'Du har misslyckats att hjälpa');
   outtextxy(15,85,'borgmästaren med att hitta hans');
   outtextxy(15,95,'hamster. Du borde skämmas!');
   for i:=1 to 63 do begin
       setrgbpalette(15,i,i,i);
       delay(10);
   end;
   repeat
      key:=readkey;
   until key=' ';
   for i:=63 downto 0 do begin
       setrgbpalette(15,i,i,i);
       delay(10);
   end;
   cleardevice;
   closegraph;
   halt(0)
end;
procedure vinst;
var key:char;
i:byte;
begin
        textruta(0,0,'Du säger|Ja, det har jag gjort.',32);
        textruta(0,0,'Info|Borgmästaren släpper in dig...',32);
        loadbg(25);
        eventtext('Du> Jag har din hamster!');
        readkey;
        eventtext('Han> Du är min hjälte!');
        readkey;
        eventtext('Du> Tja, jag vet inte jag...');
        readkey;
        eventtext('Han> Här är belöningen på 5,000,000 kr');
        readkey;
   cleardevice;
   setcolor(15);
   setrgbpalette(15,0,0,0);
   rectangle(11,1,309,82);
   rectangle(13,3,307,80);
   outtextxy(15,5,'Nu har du fullt upp med att spendera');
   outtextxy(15,15,'dina 5,000,000 kronor. Du reser till');
   outtextxy(15,25,'en varm och solig strand och sätter');
   outtextxy(15,35,'sprätt på vartenda öre tillsammans');
   outtextxy(15,45,'med borgmästarens vackra dotter...');
   outtextxy(15,70,'Tryck [space] för att fortsätta');
   loadbg(29);
   for i:=1 to 63 do begin
       setrgbpalette(15,i,i,i);
       delay(10);
   end;
   repeat
      key:=readkey;
   until key=' ';
   for i:=63 downto 0 do begin
      setrgbpalette(15,i,i,i);
      delay(10);
   end;
   cleardevice;
   settextjustify(1,1);
   setcolor(10);
   outtextxy(160,100,'Tack för att du spelade klart spelet');
   readkey;
   cleardevice;
   delay(1000);
   outtextxy(160,100,'Hej då!');
   readkey;
   closegraph;
   clrscr;
   writeln('l-a-r-s@swipnet.se');
   halt(0);
end;
procedure musen;
begin
   if mouse.move then begin
      if not mouse.visibility then mouse.show;
      if bgx^[mouse.x div 2,mouse.y]>9 then eventtext(events[dettarum,bgx^[mouse.x div 2,mouse.y]-9]);
      if bgx^[mouse.x div 2,mouse.y]<10 then eventtext(':)');
   end;
   if mouse.leftClick then begin
      if (bgx^[mouse.x div 2,mouse.y]=10) and (abs(x-mouse.x div 2)<20) and (abs(mouse.y-y)<20) and
      (dettarum=2) then begin
         if mouse.visibility then mouse.hide;
         textruta(0,0,'Info|Knack, knack',32);
         textruta(0,0,'En röst säger|Har du hittat min hamster?',32);
         if invent[16] then begin
            vinst;
            end else begin
               textruta(0,0,'Du säger|Nej, men jag ska fortsätta leta...',32);
               textruta(0,0,'Rösten säger|Kom inte tillbaka förrän du|har hittat min söta hamster.',32);
            end;
            if not mouse.visibility then mouse.show;
         end;

      if (bgx^[mouse.x div 2,mouse.y]=10) and (abs(x-mouse.x div 2)<20) and (abs(mouse.y-y)<20) and
      (dettarum=3) then begin
         if mouse.visibility then mouse.hide;
         if not invent[12] then begin
            textruta(0,0,'Du säger|Hej. Jag skulle vilja ha ett|rum med fin utsikt.',32);
            textruta(0,0,'Receptionisten säger|Det blir 750 kronor.',32);
            if cash>=750 then begin textruta(0,0,'Du säger|Varsågod. Ge mig nyckeln nu.',32);
            dec(cash,750);
            textruta(0,0,'Receptionisten säger|Nyckeln sitter i dörren till|rummet. Här får du ditt medlemskort|'+
                         'som ger dig tillträde till baren.',32);
            invent[12]:=true;
            end else begin
               textruta(0,0,'Du säger|Tyvärr så har jag inte tillräckligt|med kontanter...',32);
               textruta(0,0,'Receptionisten säger|Du är välkommen tillbaka när du|har råd att bo på vårt fina|hotell.',32)
            end;
            end else textruta(0,0,'Info|Receptionisten ignorerar dig.',32);
            if not mouse.visibility then     mouse.show;
         end;


   if (bgx^[mouse.x div 2,mouse.y]=10) and (abs(x-mouse.x div 2)<20) and (abs(mouse.y-y)<20) and
   (dettarum=4) then begin
      if mouse.visibility then mouse.hide;
      if (not invent[7]) and (not invent[9]) then textruta(0,0,'Du tittar i det grumliga vattnet|Du hittar en flaska full'+
      'med|vatten och sjögräs.',32)
      else textruta(0,0,'Du tittar i det grumliga vattnet|Du ser en liten mört, men du|hinner inte fånga den.',32);
      invent[7]:=true;
      if not mouse.visibility then mouse.show;
   end;

if (bgx^[mouse.x div 2,mouse.y]=10) and (abs(x-mouse.x div 2)<20) and (abs(mouse.y-y)<20) and
(dettarum=7) then begin
   if mouse.visibility then mouse.hide;
   if (not invent[15]) then begin
      textruta(0,0,'Du säger|Ursäkta mig. Har du sett en hamster|här i närheten?',32);
      textruta(0,0,'Fiskarn säger på knagglig svenska|Nej, men om du har 50 ryska rubel så|kan du få köpa en håv av mig.|'+
                   'Det kan ju vara bra att ha om|du ska på hamskerjakt.',32);
      if invent[14] then begin
         textruta(0,0,'Du säger|Hmm, jag har bara 45 rubel...',32);
         if invent[4] then begin textruta(0,0,'Fiskarn säger|Det är en välding fin klocka du har...',32);
         textruta(0,0,'Du säger|Varsågod, du får den av mig',32);
         textruta(0,0,'Info|Du köper fiskargubbens håv för|45 rubel och en silverklocka.|På köpet får du en fin|pälsmössa.'
         ,32);
         invent[4]:=false;
         invent[14]:=false;
         invent[15]:=true;
         invent[17]:=true;
         end else textruta(0,0,'Fiskarn säger|Det räcker tyvärr inte.',32);
         end else begin
            textruta(0,0,'Du säger|Nej, det har jag tyvärr inte.',32);
            textruta(0,0,'Fiskarn säger|Då kan jag inte hjälpa dig.',32);
         end;
      end
      else textruta(0,0,'Info|Du vill inte störa honom mer.',32);
      invent[7]:=true;
      if not mouse.visibility then mouse.show;
   end;
   if (bgx^[mouse.x div 2,mouse.y]=10) and (abs(x-mouse.x div 2)<30) and (abs(mouse.y-y)<20) and
   (dettarum=12) then begin
      if mouse.visibility then mouse.hide;
      textruta(0,0,'Bartendern säger|Välkommen till min bar. Vill du ha|något att dricka?',32);
      textruta(0,0,'Du säger|Nej tack. Jag letar efter en hamster.|Har du sett nån?',32);
      textruta(0,0,'Bartendern säger|Öhm... Nej, jag vet inget|om nån hamster...',32);
      if not mouse.visibility then mouse.show;
   end;
   if (bgx^[mouse.x div 2,mouse.y]=11) and (abs(x-mouse.x div 2)<30) and (abs(mouse.y-y)<20) and
      (dettarum=12) then begin
      if mouse.visibility then mouse.hide;
      if not invent[14] then begin
         textruta(0,0,'Du säger|Tjenare. Har du sett en vilsen|hamster i krokarna?',32);
         textruta(0,0,'Killen säger|Nej, men har du sett min mobiltelefon?',32);
         if invent[6] then begin
            textruta(0,0,'Du säger|Är det den här?',32);
            textruta(0,0,'Info|Du räcker fram mobiltelefonen|du hittade i soptunnan.',32);
            textruta(0,0,'Killen säger|Tack så jättemycket. Ska du ha|hittelön också?',32);
            textruta(0,0,'Du säger|Ehmm.. Ja tack...',32);
            textruta(0,0,'Killen säger|Hmm.. Här får du 45 ryska rubel,|det är allt jag har.|Förresten... Jag tror jag såg|'+
                         'en hamster på uteserveringen.',32);
            invent[6]:=false;
            invent[14]:=true;
            end else begin
               textruta(0,0,'Du säger|Nej, tyvärr...',32);
               textruta(0,0,'Killen säger|Lämna mig i fred då.',32);
            end;
            end else begin
               textruta(0,0,'Du säger|Snygg frisyr du har.',32);
               textruta(0,0,'Killen säger|Jag tar gärna komplimanger,|men helst inte från dig.',32);
            end;
            if not mouse.visibility then  mouse.show;
         end;

      if (bgx^[mouse.x div 2,mouse.y]=11) and (abs(x-mouse.x div 2)<20) and (abs(mouse.y-y)<20) and
         (dettarum=1) then begin
         if mouse.visibility then mouse.hide;
         loadbg(20);
         repeat until keypressed;
         laddabg(dettarum);
         ritagubbe;
      end;
      if (bgx^[mouse.x div 2,mouse.y]=10) and (abs(x-mouse.x div 2)<20) and (abs(mouse.y-y)<20) and
         (dettarum=5) then begin
         if mouse.visibility then mouse.hide;
         loadbg(21);
         repeat until keypressed;
         laddabg(dettarum);
         ritagubbe;
         if not mouse.visibility then mouse.show;
      end;
      if (bgx^[mouse.x div 2,mouse.y]=11) and (abs(x-mouse.x div 2)<20) and (abs(mouse.y-y)<20) and
         (dettarum=5) then begin
         if mouse.visibility then mouse.hide;
         if not invent[6] then textruta(0,0,'Info|Ojdå, du hittade en mobiltelefon...',32)else
         textruta(0,0,'Info|Du hittar bara en massa skräp',32);
         invent[6]:=true;
         if not mouse.visibility then mouse.show;
      end;
      if (bgx^[mouse.x div 2,mouse.y]=12) and (abs(x-mouse.x div 2)<20) and (abs(mouse.y-y)<20) and
      (dettarum=5) then begin
         if mouse.visibility then mouse.hide;
         if not invent[16] then
         if invent[10] then begin
            textruta(0,0,'Info|Du skär av repet med din glasskärva|Nu är det bara till att fånga|den vilda hamstern.',32);
            if invent[15] then begin
               textruta(0,0,'Info|Snabbt som attan fångar du den|lilla rackaren i din hov.|Du tar hamstern under armen|'+
               'och går in igen.|Smart som du är lägger du|din pälsmössa på hamsterns|plats, så att ingen märker att|'+
               'den saknas.',32);
               invent[16]:=true;
               invent[10]:=false;
               invent[17]:=false;
               x:=160;
               y:=115;
               laddabg(12);
               ritagubbe;
               end else begin
                  textruta(0,0,'Info|Den lilla gynnaren är för snabb för|dig. Han springer snabbt ut på|den trafikerade'+
                  'vägen där det|sker en hemsk olycka...',32);
                  gameover;
               end;
               end else textruta(0,0,'Info|Du har inget att kapa repet med...',32) else
               textruta(0,0,'Info|Du behöver inte kapa repet igen.|Låt pälsmössan ligga.',32);
               if not mouse.visibility then mouse.show;
            end;

         if (bgx^[mouse.x div 2,mouse.y]=10) and (abs(x-mouse.x div 2)<20) and (abs(mouse.y-y)<20) and
            (dettarum=6) then begin
            if mouse.visibility then mouse.hide;
            textruta(0,0,'Du säger|Godagens, jag vill in.',32);
            textruta(0,0,'Vakten säger|Får jag se ditt medlemskort?',32);
            if invent[12] then begin
               textruta(0,0,'Info|Du visar stolt upp ditt medlemskort|och vakten släpper in dig.',32);
               x:=200;
               y:=95;
               laddabg(12);
               ritagubbe;
               end else begin
                  textruta(0,0,'Du säger|Jag har inget, men jag ska|in ändå...',32);
                  textruta(0,0,'Vakten säger|Är du uppkäftig eller?',32);
                  textruta(0,0,'Du säger|Flytta på dig, tjockis',32);
                  textruta(0,0,'Vakten säger|Nä nu jävlar',32);
                  setrgbpalette(13,63,63,0);
                  loadbg(23);
                  delay(2500);
                  visagubbe:=false;
                  textruta(0,1,'Info|Vakten buntade ihop dig ordentligt|och hängde upp dig i taklampan.|Du har hamnat i ett '+
                  'väldigt taskigt|läge...',32);
                  delay(1000);
                  if invent[10] then begin
                     textruta(0,10,'Info|Du kommer på att du har en vass|glasskärva på dig.|Du skär av sladden med den.'+
                     'Därefter|lagar du sladden, för att slippa|ytterligare problem med den sura|vakten',32);
                     laddabg(dettarum);
                     x:=160;
                     y:=100;
                     ritagubbe;
                  end
                  else begin
                     textruta(0,10,'Info|Synd att du inte hade något|vasst föremål på dig.|Du hänger och dinglar i några|'+
                     'timmar innan det svartnar för|dina ögon.',32);
                     gameover;
                     laddabg(dettarum);
                  end;
               end;
               visagubbe:=true;
               if not mouse.visibility then     mouse.show;
            end;
            if (bgx^[mouse.x div 2,mouse.y]=10) and (abs(x-mouse.x div 2)<20) and (abs(mouse.y-y)<20) and
               (dettarum=9) then begin
               if mouse.visibility then mouse.hide;
               loadbg(22);
               repeat until keypressed;
               laddabg(dettarum);
               ritagubbe;
            end;

         if (bgx^[mouse.x div 2,mouse.y]=10) and (abs(x-mouse.x div 2)<20) and (abs(mouse.y-y)<20) and
         (dettarum=8) then begin
            if mouse.visibility then mouse.hide;
            textruta(0,0,'Info|Du äter ett äpple...|Nu har du nya krafter!',32);
            if not mouse.visibility then     mouse.show;
         end;
         if (bgx^[mouse.x div 2,mouse.y]=11) and (abs(x-mouse.x div 2)<20) and (abs(mouse.y-y)<20) and
         (dettarum=8) then begin
            if mouse.visibility then mouse.hide;
            if visakort<100 then textruta(0,0,'Info|Du har under 100 kronor på kortet',32)else
            begin
               textruta(0,0,'Info|Du tömmer kontot. Det finns|ingen anledning att spara på|pengarna...|Du har nu '
               +int2str(cash+visakort)+' kronor i fickan.',32);
               cash:=cash+visakort;
               visakort:=0;
            end;
            if not mouse.visibility then mouse.show;
         end;
      
      if (bgx^[mouse.x div 2,mouse.y]=12) and (abs(x-mouse.x div 2)<20) and (abs(mouse.y-y)<20) and
      (dettarum=10) then begin
         if mouse.visibility then mouse.hide;
         if not invent[3] then textruta(0,0,'Info|Du rotar bland de stinkande soporna.|I botten av soptunnan hittar du|'+
         +'ett paket med plåster, som du stoppar|i din byxficka.',32)else
         textruta(0,0,'Info|Du hittar inget intressant.',32);
         invent[3]:=true;
         if not mouse.visibility then mouse.show;
      end;

   if (bgx^[mouse.x div 2,mouse.y]=11) and (abs(x-mouse.x div 2)<20) and (abs(mouse.y-y)<50) and
   (dettarum=10) then begin
      if mouse.visibility then mouse.hide;
      textruta(0,0,'Du säger|Godag herr Skata',32);
      if not invent[4] then begin
         textruta(0,0,'Skatan säger|Kvillevitt',32);
         textruta(0,0,'Info|En silverklocka faller ur|näbben på skatan.|Du plockar upp den.',32);
         invent[4]:=true;
         end else textruta(0,0,'Skatan säger|Kviddelivitt',32);
         if not mouse.visibility then        mouse.show;
      end;
   
   if (bgx^[mouse.x div 2,mouse.y]=10) and (abs(x-mouse.x div 2)<20) and (abs(mouse.y-y)<20) and
   (dettarum=10) then begin
      if mouse.visibility then mouse.hide;
      textruta(0,0,'Info|Du skär av pulsådern på en|glasbit i fönstret.|Det gör fruktansvärt ont och du|börjar bli yr i '+
      'huvudet...',32);
      if invent[3] then begin
         textruta(0,0,'Info|Tur att du har några plåster|på dig.|Du stoppar blodflödet och känner|dig genast mycket bättre.'
         ,32);
         laddabg(11);
         x:=120;y:=87;
         ritagubbe;
         end else begin textruta(0,0,'Info|Sakta men säkert flyger du|till himlen...',32);gameover;end;
         if not mouse.visibility then     mouse.show;
      end;

   if (bgx^[mouse.x div 2,mouse.y]=11) and (abs(x-mouse.x div 2)<20) and (abs(mouse.y-y)<20) and
   (dettarum=9) then begin
      if mouse.visibility then mouse.hide;
      textruta(0,0,'Expediten säger|Kan jag hjälpa dig?',32);
      if not invent[2] then begin
         textruta(0,0,'Du säger|Nej tack. Jag tittar bara lite.',32);
         end else begin
            textruta(0,0,'Du säger|Jag vill betala för denna|påsen med hamstermat.',32);
            textruta(0,0,'Expediten säger|Det blir 97 kronor.',32);
            if cash<97 then begin
               textruta(0,0,'Du säger|Oj, jag har visst inte råd.',32);
               textruta(0,0,'Expediten säger|Fattiglapp!     ',32);
               textruta(0,0,'Info|Du ställer tillbaka varan|i hyllan.',32);
               end else begin
                  textruta(0,0,'Info|Du betalar snällt.',32);
                  dec(cash,97);
                  invent[13]:=true;
               end;
               invent[2]:=false;
            end;
            if not mouse.visibility then     mouse.show;
         end;
         if (bgx^[mouse.x div 2,mouse.y]=12) and (abs(x-mouse.x div 2)<20) and (abs(mouse.y-y)<20) and
         (dettarum=9) then begin
            if mouse.visibility then mouse.hide;
            if (not invent[2]) and (not invent[13]) then begin
               textruta(0,0,'Info|Hyllan är full av mat|för ganagare. Du tar|en påse med hamstermat.',32);
               textruta(0,0,'Info|Glöm inte att betala|för påsen!',32);
               invent[2]:=true;
               end else textruta(0,0,'Info|Du nöjer dig med en påse.',32);
            
            if not mouse.visibility then     mouse.show;
         end;
      
      if (bgx^[mouse.x div 2,mouse.y]=13) and (abs(x-mouse.x div 2)<20) and (abs(mouse.y-y)<20) and
      (dettarum=10) then begin
         if mouse.visibility then mouse.hide;
         if not invent[10] then textruta(0,0,'Info|Du plockar upp en vass glasskräva|från det krossade fönstret.',32)
         else textruta(0,0,'Info|Du har redan en glasbit',32);
         invent[10]:=true;
         if not mouse.visibility then     mouse.show;
      end;
   
   if (bgx^[mouse.x div 2,mouse.y]=10) and (abs(x-mouse.x div 2)<20) and (abs(mouse.y-y)<20) and
   (dettarum=11) then begin
      if mouse.visibility then mouse.hide;
      if not invent[5] then textruta(0,0,'Du öppnar byrålådan|Du hittar en burk med alvedon|brustabletter. '+
      'Du tar upp dom|ur byrålådan.',32)
      else textruta(0,0,'Du öppnar byrålådan|Den är tom',32);
      invent[5]:=true;
      if not mouse.visibility then mouse.show;
   end;
   if (bgx^[mouse.x div 2,mouse.y]=11) and (abs(x-mouse.x div 2)<20) and (abs(mouse.y-y)<20) and
   (dettarum=11) then begin
      if mouse.visibility then mouse.hide;
      textruta(0,0,'Info|Du klättrar försiktigt ut|genom fönstret samtidigt|som du hojtar ett glatt|hej då till gumman',32);
      laddabg(10);
      x:=115;y:=110;
      ritagubbe;
      if not mouse.visibility then mouse.show;
   end;

if (bgx^[mouse.x div 2,mouse.y]=12) and (abs(x-mouse.x div 2)<20) and (abs(mouse.y-y)<20) and
(dettarum=11) then begin
   if mouse.visibility then mouse.hide;
   textruta(0,0,'Du säger|Godag tant. Hur står det till?',32);
   textruta(0,0,'Gumman säger|Jag har så fruktansvärt ont|i skenbenet. Kan du ge mig|ett glas alvedon?',32);
   if (not invent[5]) and (not invent[7]) then begin
      textruta(0,0,'Du säger|Nej, tyvärr',32);
      textruta(0,0,'Gumman säger|Kom tillbaka när du har fixat|fram grejorna åt mig.',32);
   end;

if (invent[5]) and (not invent[7]) then begin
   textruta(0,0,'Du säger|Jag har alvedon, men inget vatten...',32);
   textruta(0,0,'Gumman säger|Kom tillbaka när du har skaffat|vatten åt mig.',32);
end;
if (invent[7]) and (not invent[5]) then begin
   textruta(0,0,'Du säger|Jag har vatten, men ingen|alvedon...',32);
   textruta(0,0,'Gumman säger|Kom tillbaka när du har hittat|alvedon åt mig.',32);
end;
if (invent[5]) and (invent[7]) then begin
   textruta(0,0,'Info|Du trycker ner en brustablett|alvedon i din vattenflaska och|räcker den till gumman.',32);
   textruta(0,0,'Gumman säger|Du var mig en rask pojke.|Som tack ska du få en nyckel|som jag hittade i går.',32);
   invent[9]:=true;
   invent[8]:=true;
end;
if not mouse.visibility then mouse.show;
end;

if (bgx^[mouse.x div 2,mouse.y]=10) and (abs(x-mouse.x div 2)<20) and (abs(mouse.y-y)<20) and
(dettarum=13) then begin
   if mouse.visibility then mouse.hide;
   if not invent[8] then begin
      textruta(0,0,'Info|Du klättrar upp, men du får|inte upp låset, så du klättrar|ner igen.',32);
      delay(1000);
      textruta(0,0,'Info|Nu är det rätt kört för|din del...',32);
      gameover;
      end else begin
         textruta(0,0,'Info|Du klättrar upp för stegen.|Du testar att öppna låset med|nyckeln du fick av den|lilla gumman...'
         ,32);
         textruta(0,0,'Info|Låset öppnas och du kravlar dig upp|genom brunnen...',32);
         laddabg(5);
         x:=155;y:=120;
         ritagubbe;
      end;
   
   if not mouse.visibility then mouse.show;
end;
end;



end;
procedure inventproc;
var i,show:integer;
inv:string;
begin
   j:=1;
      repeat
         if j=1 then inv:='Inventarier' else inv:='Inventarier (forts)';
         show:=0;
         for i:=j to 17 do begin
            if invent[i] then
            begin
               inc(show);
               inv:=inv+'|'+inventarier[i];
               if show=10 then begin
                  j:=i+1;
                  i:=17;
               end;
            end;
         end;
         if inv<>'Inventarier (forts)' then textruta(0,0,inv,32);
      until show<10;
   end;
   procedure mobil;
   var markor:byte;
   key:char;
       nummer:array[0..9] of char;
   tfn:string;
   begin
      loadbg(24);
      textruta(0,1,'Info|Slå nummer',0);
      markor:=0;
      tfn:='         ';
      for i:=0 to 9 do nummer[i]:=' ';
      repeat
         key:=readkey;
         if (ord(key)=8) and (markor>0) then begin
            dec(markor);
            setcolor(0);
            outtextxy(123+8*markor,58,nummer[markor]);
         end;
         if markor<9 then
         case key of
         '0'..'9':begin
            nummer[markor]:=key;
            setcolor(15);
            outtextxy(123+8*markor,58,nummer[markor]);
            inc(markor);
         end;
      end;
   until (ord(key)=27) or (ord(key)=13);
laddabg(dettarum);
ritagubbe;
if ord(key)=13 then begin
   for i:=0 to 9 do tfn[i+1]:=nummer[i];
   if (tfn='321345') or (tfn='020234543') then begin
      if tfn='321345' then begin
         textruta(1,1,'Borgmästaren säger|Har du hittat Roffe än eller?',32);
         textruta(100,1,'Du säger|Nej, men jag jobbar på det.',32);
      end;
      if tfn='020234543' then begin
         textruta(1,1,'Telefonisten säger|Finax telefonlån god middag.',32);
         textruta(50,1,'Du säger|Hej, jag vill låna 5000 kronor.',32);
         if skuld=0 then begin
            textruta(1,1,'Telefonisten säger|Okej.',32);
            textruta(0,0,'Info|Du talar om ditt kontonummer|och får besked om att pengarna|finns på ditt konto.|'+
            'Du lägger på luren...',32);
            inc(skuld,5000);
            inc(visakort,5000);
            end else begin
               textruta(1,1,'Telefonisten säger|Du måste betala tillbaka din|skuld på 5000 innan du kan|låna nya pengar. ',32);
               textruta(0,0,'Info|Du säger några fula ord|och lägger på luren.',32);
            end;
         end;
         end else textruta(0,0,'Info|Numret har ingen abonent...',32);
      end;
   end;
procedure startvarden;
begin
   invent[1]:=true;
   for i:=2 to 17 do invent[i]:=false;
   visakort:=800;
   visagubbe:=true;
   loadbg(26);
   dir:=hoger;
   x:=150;
   y:=120;
   laddabg(2);
   mouse.range(0,0,639,149);

end;
procedure saveproc;
var f:text;
begin
         assign(f,'game.sav');
         rewrite(f);
           writeln(f,'Varning! Ändra inte innehållet i denna fil!');
         for i:=1 to 17 do
           if invent[i] then writeln(f,random(50)) else writeln(f,random(50)+50);
           writeln(f,x);
           writeln(f,y);
           writeln(f,dir);
           writeln(f,dettarum);
           writeln(f,skuld+2356);
           writeln(f,visakort+4323);
           writeln(f,cash+3465);
         close(f);
end;
procedure resetsavegame;
begin
   startvarden;
   saveproc;
end;

   procedure save;
   var key:char;
   f:text;
   begin
      textruta(0,0,'Vill du spara?|     J/N',0);
      repeat
         key:=upcase(readkey);
      until (key='J') or (key='N');
      sudda(100,50,160,70);
      if key='J' then saveproc;
      ritagubbe;
   end;
   procedure load;
   var key:char;
   f:text;
   tom:string;
   inv:byte;
   fusk:boolean;
   begin
      textruta(0,0,'Vill du hämta sparat spel?|          J/N',0);
      repeat
         key:=upcase(readkey);
      until (key='J') or (key='N');
      if key='J' then begin
         fusk:=false;
         assign(f,'game.sav');
         reset(f);
           readln(f,tom);
         for i:=1 to 17 do begin
              readln(f,inv);
              if inv < 50 then invent[i]:=true else invent[i]:=false;
              if inv > 100 then fusk:=true;
           end;
           readln(f,x);
           readln(f,y);
           readln(f,dir);
           readln(f,dettarum);
           readln(f,skuld);
           readln(f,visakort);
           readln(f,cash);
         close(f);
         dec(skuld,2356);
         dec(visakort,4323);
         dec(cash,3465);

         if (fusk) or (x>320) or (y>150) or (skuld>5800) or (skuld<0) or (visakort>5800) or (cash>5800) then begin
            textruta(0,0,'Fusk!|Du har försökt modifiera|den sparade filen...|Fy på dig!',32);
            resetsavegame;
            gameover;
         end;
      end;

   laddabg(dettarum);
   ritagubbe;
end;
procedure rumevents;
var blink:byte;
begin
   if dettarum=8 then begin
      blink:=random(1000);
      if blink=0 then setrgbpalette(13,63,63,0);
      if blink=1 then setrgbpalette(13,40,40,40);
   end;
   if (dettarum=6) and (invent[16]) then begin
      textruta(0,0,'Info|Dörrvakten ser att du har kidnappat|hamstern. Har ger dig ett ordentligt|kok stryk och slänger '+
                   'ner både dig|och hamstern genom luckan i golvet...',32);
      x:=120;
      y:=90;
      laddabg(13);
      ritagubbe;
   end;
   if (dettarum=8) and (invent[2]) then begin
      textruta(0,0,'Info|Du glömde betala för|hamstermaten...|Polisen haffar dig!',32);
      gameover;
   end;
   if (dettarum=1) and (invent[16]) and (invent[7]) then begin
      textruta(0,0,'Info|Hamstern verkar väldigt utmattad.|Hans puls blir allt svagare...',32);
      if invent[13] then begin textruta(0,0,'Info|Du stoppar in lite hamstermat|i munnen på den lilla gynnaren|'+
      'och ger honom den sista|slurken i vattenflaskan.|Snart mår han mycket bättre.',32);
      invent[7]:=false;
   end
   else begin
      textruta(0,0,'Info|ååh nej! Hamsterstackarn drar|sin sista suck i dina armar...',32);
      gameover;
   end;
end;
end;

procedure startover;
var key:char;
begin
   textruta(0,0,'Vill du börja om?|       J/N',0);
   repeat
      key:=upcase(readkey);
   until (key='J') or (key='N');
   if key='J' then startvarden else laddabg(dettarum);

ritagubbe;
end;
procedure quit;
var key:char;
begin
   textruta(0,0,'Vill du avsluta?|      J/N',0);
   repeat
      key:=upcase(readkey);
   until (key='J') or (key='N');
   if key='J' then begin
      closegraph;
      halt(0);
   end;
   laddabg(dettarum);
   ritagubbe;
end;

procedure knapptryck;
begin
   if upcase(chr(key))='I' then inventproc;
   if upcase(chr(key))='T' then textruta(0,0,'Du ser dig omkring...|'+titta[dettarum],32);
   if upcase(chr(key))='C' then textruta(0,0,'Du räknar dina pengar|Du har '+int2str(cash)+' kronor',32);
   if (key=27) then quit;
   if key=59 then textruta(0,0,hjalptext,32);
   if (key=63) then if (invent[6]) then mobil else textruta(0,0,'Info|Du har ingen telefon...',32);
   if (key=60) then save;
   if (key=61) then load;
   if (key=62) then startover;

if key=72 then begin
   dir:=upp;
   bgxcol:=0;
   for i:=-4 to 2 do if (bgx^[x+i,y+4]=1) then inc(bgxcol);
   if bgxcol=0 then begin
      sudda(x-8,y-15,16,25);
      inc(v,70);
      dec(y,2);
      ritagubbe;
   end;
end;
if key=80 then begin
   dir:=ner;
   bgxcol:=0;
   for i:=-2 to 4 do if (bgx^[x+i,y+8]=1) then inc(bgxcol);
   if bgxcol=0 then begin
      sudda(x-8,y-13,16,23);
      inc(v,70);
      inc(y,2);
      ritagubbe;
   end;
end;
if key=75 then begin
   dir:=vanster;
   if (bgx^[x+5*dir,y+6]<>1) then begin
      sudda(x-7,y-13,13,21);
      dec(v,40);
      dec(x,2);
      ritagubbe;
   end;
end;
if key=77 then begin
   dir:=hoger;
   if (bgx^[x+5*dir,y+6]<>1) then begin
      sudda(x-6,y-13,13,21);
      inc(v,40);
      inc(x,2);
      ritagubbe;
   end;
end;
end;
procedure game;
begin
   ritagubbe;
   repeat
      musen;
      key:=0;
      if keypressed then begin
         key:=ord(readkey);
         if mouse.visibility then mouse.hide;
         knapptryck;
      end;

   rumevents;

until 1=2;
end;
begin
   new(bg);
   new(bgy);
   new(bgx);
   i:=installuserdriver('svga256',nil);
   grafik(i,0);
   intro;
   startvarden;
   game;
   closegraph;
end.