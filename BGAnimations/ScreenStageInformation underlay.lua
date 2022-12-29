local t = Def.ActorFrame {};

t[#t+1] = LoadActor(GetBackgroundPath())..{
	InitCommand=cmd(show_background_properly);
};

if (GAMESTATE:IsSideJoined(PLAYER_1) and not GAMESTATE:IsSideJoined(PLAYER_2)) or (not GAMESTATE:IsSideJoined(PLAYER_1) and GAMESTATE:IsSideJoined(PLAYER_2)) then
	local pn = PLAYER_1;
	if GAMESTATE:IsSideJoined(PLAYER_2) then pn = PLAYER_2; end;
	local num = GetDiffNumberBall(GAMESTATE:GetCurrentSteps(pn));
	
	t[#t+1] = Def.Quad {
		InitCommand=cmd(y,SCREEN_BOTTOM-20;x,SCREEN_CENTER_X;scaletoclipped,300,30;diffuse,0,0,0,.96;faderight,.2;fadeleft,.2;diffusealpha,.85);
	};

	t[#t+1] = Def.Quad {
		InitCommand=function(self)
			(cmd(y,SCREEN_BOTTOM-35;x,SCREEN_CENTER_X;scaletoclipped,300,2;faderight,.2;fadeleft,.2;))(self);
			if num == 0 then self:diffuse(1,.6,0,1);
			elseif num == 1 then self:diffuse(1,0,1,1);
			elseif num == 2 then self:diffuse(.6,1,0,1);
			elseif num == 3 then self:diffuse(0,.8,1,1);
			elseif num == 4 then self:diffuse(.6,1,0,1);
			elseif num == 5 then self:diffuse(0,.8,1,1);
			end;
			self:diffusealpha(.85);
		end;
	};
	
	t[#t+1] = Def.Quad {
		InitCommand=function(self)
			(cmd(y,SCREEN_BOTTOM-5;x,SCREEN_CENTER_X;scaletoclipped,300,2;faderight,.2;fadeleft,.2;))(self);
			if num == 0 then self:diffuse(1,.6,0,1);
			elseif num == 1 then self:diffuse(1,0,1,1);
			elseif num == 2 then self:diffuse(.6,1,0,1);
			elseif num == 3 then self:diffuse(0,.8,1,1);
			elseif num == 4 then self:diffuse(.6,1,0,1);
			elseif num == 5 then self:diffuse(0,.8,1,1);
			end;
			self:diffusealpha(.85);
		end;
	};
	
	t[#t+1] =  LoadFont("_jnr_font")..{	
		OnCommand=function(self)
			(cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-27;zoom,.7;stoptweening;shadowlength,0))(self);
			local text = "";
			if num == 0 then text = text .. "S";
			elseif num == 1 then text = text .. "SP";
			elseif num == 2 then text = text .. "D";
			elseif num == 3 then text = text .. "DP";
			elseif num == 4 then text = text .. "HD";
			elseif num == 5 then text = text .. "C";
			else text = text .. "XX"; end;
			
			if GAMESTATE:GetCurrentSteps(pn):GetMeter() == 99 then
				text = text .. "??";
			elseif GAMESTATE:GetCurrentSteps(pn):GetMeter() > 99 then
				text = text .."+99";
			else
				text = text .. tostring(GAMESTATE:GetCurrentSteps(pn):GetMeter());
			end;
			
			if GAMESTATE:GetCurrentSteps(pn):GetLabel() ~= "" then
				text = text .. " - ";
				text = text .. GAMESTATE:GetCurrentSteps(pn):GetLabel();
			end;
			if GAMESTATE:GetCurrentSteps(pn):GetAuthorCredit() ~= "" then
				text = text .. " - ";
				text = text .. "by " ..GAMESTATE:GetCurrentSteps(pn):GetAuthorCredit();
			else
				text = text .. " - ";
				text = text .. "by UNKNOWN";
			end;
			self:settext(text);
		end;
	};
	
	t[#t+1] =  LoadFont("_jnr_font")..{	
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_BOTTOM-14;zoom,.55;stoptweening;shadowlength,0;settext,GAMESTATE:GetCurrentSteps(pn):GetChartName());
	};
	
end;

if GAMESTATE:IsSideJoined(PLAYER_1) and GAMESTATE:IsSideJoined(PLAYER_2) then
	--PLAYER 1
	local numP1 = GetDiffNumberBall(GAMESTATE:GetCurrentSteps(PLAYER_1));
	
	t[#t+1] = Def.Quad {
		InitCommand=cmd(y,SCREEN_BOTTOM-20;horizalign,left;x,95;scaletoclipped,300,30;diffuse,0,0,0,.96;faderight,.3;fadeleft,.05;diffusealpha,.85);
	};
	
	t[#t+1] = Def.Quad {
		InitCommand=function(self)
			(cmd(y,SCREEN_BOTTOM-35;horizalign,left;x,95;scaletoclipped,310,2;faderight,.3;fadeleft,.05))(self);
			if numP1 == 0 then self:diffuse(1,.6,0,1);
			elseif numP1 == 1 then self:diffuse(1,0,1,1);
			elseif numP1 == 2 then self:diffuse(.6,1,0,1);
			elseif numP1 == 3 then self:diffuse(0,.8,1,1);
			elseif numP1 == 4 then self:diffuse(.6,1,0,1);
			elseif numP1 == 5 then self:diffuse(0,.8,1,1);
			end;
			self:diffusealpha(.85);
		end;
	};
	t[#t+1] = Def.Quad {
		InitCommand=function(self)
			(cmd(y,SCREEN_BOTTOM-5;horizalign,left;x,95;scaletoclipped,310,2;faderight,.3;fadeleft,.05))(self);
			if numP1 == 0 then self:diffuse(1,.6,0,1);
			elseif numP1 == 1 then self:diffuse(1,0,1,1);
			elseif numP1 == 2 then self:diffuse(.6,1,0,1);
			elseif numP1 == 3 then self:diffuse(0,.8,1,1);
			elseif numP1 == 4 then self:diffuse(.6,1,0,1);
			elseif numP1 == 5 then self:diffuse(0,.8,1,1);
			end;
			self:diffusealpha(.85);
		end;
	};

	t[#t+1] =  LoadFont("_jnr_font")..{	
		OnCommand=function(self)
			(cmd(horizalign,left;x,110;y,SCREEN_BOTTOM-27;zoom,.7;stoptweening;shadowlength,0))(self);
			local text = "";
			if numP1 == 0 then text = text .. "S";
			elseif numP1 == 1 then text = text .. "SP";
			elseif numP1 == 2 then text = text .. "D";
			elseif numP1 == 3 then text = text .. "DP";
			elseif numP1 == 4 then text = text .. "HD";
			elseif numP1 == 5 then text = text .. "C";
			else text = text .. "XX"; end;
			
			if GAMESTATE:GetCurrentSteps(PLAYER_1):GetMeter() == 99 then
				text = text .. "??";
			elseif GAMESTATE:GetCurrentSteps(PLAYER_1):GetMeter() > 99 then
				text = text .."+99";
			else
				text = text .. tostring(GAMESTATE:GetCurrentSteps(PLAYER_1):GetMeter());
			end;
			
			if GAMESTATE:GetCurrentSteps(PLAYER_1):GetLabel() ~= "" then
				text = text .. " - ";
				text = text .. GAMESTATE:GetCurrentSteps(PLAYER_1):GetLabel();
			end;
			if GAMESTATE:GetCurrentSteps(PLAYER_1):GetAuthorCredit() ~= "" then
				text = text .. " - ";
				text = text .. "by " ..GAMESTATE:GetCurrentSteps(PLAYER_1):GetAuthorCredit();
			else
				text = text .. " - ";
				text = text .. "by UNKNOWN";
			end;
			self:settext(text);
		end;
	};

	t[#t+1] =  LoadFont("_jnr_font")..{		
		OnCommand=cmd(horizalign,left;x,110;y,SCREEN_BOTTOM-14;zoom,.55;stoptweening;shadowlength,0;settext,GAMESTATE:GetCurrentSteps(PLAYER_1):GetChartName());
	};

	--PLAYER 2
	local numP2	= GetDiffNumberBall(GAMESTATE:GetCurrentSteps(PLAYER_2));
	
	t[#t+1] = Def.Quad {
		InitCommand=cmd(y,SCREEN_BOTTOM-20;horizalign,right;x,SCREEN_RIGHT-95;scaletoclipped,300,30;diffuse,0,0,0,.96;fadeleft,.3;faderight,.05;diffusealpha,.85);
	};
	
	t[#t+1] = Def.Quad {
		InitCommand=function(self)
			(cmd(y,SCREEN_BOTTOM-35;horizalign,right;x,SCREEN_RIGHT-95;scaletoclipped,300,2;fadeleft,.3;faderight,.05;))(self);
			if numP1 == 0 then self:diffuse(1,.6,0,1);
			elseif numP1 == 1 then self:diffuse(1,0,1,1);
			elseif numP1 == 2 then self:diffuse(.6,1,0,1);
			elseif numP1 == 3 then self:diffuse(0,.8,1,1);
			elseif numP1 == 4 then self:diffuse(.6,1,0,1);
			elseif numP1 == 5 then self:diffuse(0,.8,1,1);
			end;
			self:diffusealpha(.85);
		end;
	};
	
	t[#t+1] = Def.Quad {
		InitCommand=function(self)
			(cmd(y,SCREEN_BOTTOM-5;horizalign,right;x,SCREEN_RIGHT-95;scaletoclipped,300,2;fadeleft,.3;faderight,.05;))(self);
			if numP1 == 0 then self:diffuse(1,.6,0,1);
			elseif numP1 == 1 then self:diffuse(1,0,1,1);
			elseif numP1 == 2 then self:diffuse(.6,1,0,1);
			elseif numP1 == 3 then self:diffuse(0,.8,1,1);
			elseif numP1 == 4 then self:diffuse(.6,1,0,1);
			elseif numP1 == 5 then self:diffuse(0,.8,1,1);
			end;
			self:diffusealpha(.85);
		end;
	};

	t[#t+1] =  LoadFont("_jnr_font")..{		
		OnCommand=function(self)
			(cmd(horizalign,right;x,SCREEN_RIGHT-110;y,SCREEN_BOTTOM-27;zoom,.7;stoptweening;shadowlength,0))(self);
			local text = "";
			if numP2 == 0 then text = text .. "S";
			elseif numP2 == 1 then text = text .. "SP";
			elseif numP2 == 2 then text = text .. "D";
			elseif numP2 == 3 then text = text .. "DP";
			elseif numP2 == 4 then text = text .. "HD";
			elseif numP2 == 5 then text = text .. "C";
			else text = text .. "XX"; end;
			
			if GAMESTATE:GetCurrentSteps(PLAYER_1):GetMeter() == 99 then
				text = text .. "??";
			elseif GAMESTATE:GetCurrentSteps(PLAYER_1):GetMeter() > 99 then
				text = text .."+99";
			else
				text = text .. tostring(GAMESTATE:GetCurrentSteps(PLAYER_2):GetMeter());
			end;

			if GAMESTATE:GetCurrentSteps(PLAYER_2):GetLabel() ~= "" then
				text = text .. " - ";
				text = text .. GAMESTATE:GetCurrentSteps(PLAYER_2):GetLabel();
			end;
			if GAMESTATE:GetCurrentSteps(PLAYER_2):GetAuthorCredit() ~= "" then
				text = text .. " - ";
				text = text .. "by " ..GAMESTATE:GetCurrentSteps(PLAYER_2):GetAuthorCredit();
			else
				text = text .. " - ";
				text = text .. "by UNKNOWN";
			end;
			self:settext(text);
		end;
	};

	t[#t+1] =  LoadFont("_jnr_font")..{	
		OnCommand=cmd(horizalign,right;x,SCREEN_RIGHT-110;y,SCREEN_BOTTOM-14;zoom,.55;stoptweening;shadowlength,0;settext,GAMESTATE:GetCurrentSteps(PLAYER_2):GetChartName());
	};
end;


return t;


