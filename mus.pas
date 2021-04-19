unit mus; {Av lars Jacobsson}
interface
type LorR=(none,left,right,both);
 mousetype = object
oldx2,oldy2,oldx,oldy,oldbutton,x,y,button:integer;
visibility:boolean;
procedure reset;
procedure range(x1,y1,x2,y2:integer);
procedure put(x1,y1:integer);
procedure show;
procedure hide;
procedure GetEvent;
function pressed:LorR;
function move:boolean;
function click:boolean;
function Leftclick:boolean;
function Rightclick:boolean;
end;
var mouse:mousetype;
implementation
procedure mousetype.reset;
begin
asm
   mov ax,0
   int 33h
end;
end;

procedure mousetype.range(x1,y1,x2,y2:integer);
begin
asm
   mov ax,7
   mov cx,[x1]
   mov dx,[x2]
   int 33h
   mov ax,8
   mov cx,[y1]
   mov dx,[y2]
   int 33h
end;
end;

procedure mousetype.show;
begin
asm
   mov ax,1
   int 33h
end;
visibility:=true;
end;

procedure mousetype.put(x1,y1:integer);
begin
asm
   mov ax,4
   mov cx,[x1]
   mov dx,[y1]
   int 33h
end;
end;

procedure mousetype.hide;
begin
asm
   mov ax,2
   int 33h
end;
visibility:=false;

end;

procedure mousetype.GetEvent;
var xx,yy,bb:integer;
begin
asm
   mov ax,3
   int 33h
   mov [xx],cx
   mov [yy],dx
   mov [bb],bx
end;
    x:=xx;
    y:=yy;
    button:=bb;
end;
function mousetype.pressed:LorR;
begin
	GetEvent;
	if button=0 then pressed:=none;
	if button=1 then pressed:=left;
	if button=2 then pressed:=right;
	if button=3 then pressed:=both;
end;
function mousetype.move:boolean;
begin
	GetEvent;
	if (x<>oldx) or (y<>oldy) then move:=true else move:=false;
	oldx2:=oldx;
	oldy2:=oldy;
	oldx:=x;
	oldy:=y;
end;

function mousetype.click:boolean;
begin
	GetEvent;
	if (oldbutton-button<0) then click:=true else click:=false;
	oldbutton:=button;
end;

function mousetype.LeftClick:boolean;
begin
	GetEvent;
	if (oldbutton-button=-1) then leftclick:=true else leftclick:=false;
	oldbutton:=button;
end;

function mousetype.RightClick:boolean;
begin
	GetEvent;
	if (oldbutton-button=-2) then rightclick:=true else rightclick:=false;
	oldbutton:=button;
end;

begin

end.