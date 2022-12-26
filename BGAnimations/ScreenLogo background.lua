return Def.ActorFrame {
	Def.Quad {
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;diffuse,0,0,0,1);
		OnCommand=cmd(diffusealpha,0;sleep,8;linear,.2;diffusealpha,1);
	};
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoom,WideScale(0.9,1.0););
	LoadActor(THEME:GetPathG("", "ScreenLogo/rest")) .. {
			InitCommand=cmd(x,80;y,-20;);
		OnCommand=cmd(diffusealpha,0;sleep,1.5;linear,1;diffusealpha,1),
	};
	LoadActor(THEME:GetPathG("", "ScreenLogo/letter a")) .. {
			InitCommand=cmd();
		OnCommand=cmd(zoom,3;x,-120;y,0;sleep,1;decelerate,0.5;zoom,1.01;x,-180;y,-20;),
	};
	LoadActor(THEME:GetPathG("", "ScreenLogo/letter m")) .. {
			InitCommand=cmd();
		OnCommand=cmd(zoom,3;x,120;y,0;sleep,1;decelerate,0.5;zoom,1.01;x,80;y,-20;),
	};
	LoadActor(THEME:GetPathG("", "ScreenLogo/swoosh")) .. {
			InitCommand=cmd(x,-180;y,16;);
		OnCommand=cmd(cropright,1;sleep,2.5;linear,0.5;cropright,0;),
	};
};