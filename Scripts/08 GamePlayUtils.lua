--######################################################################################
--######################################################################################

--frame correspondiente de cada judgment
local TNSframe = {
	TapNoteScore_CheckpointHit = 0;
	TapNoteScore_W1 = 0;
	TapNoteScore_W2 = 0;
	TapNoteScore_W3 = 1;
	TapNoteScore_W4 = 2;
	TapNoteScore_W5 = 3;
	TapNoteScore_Miss = 4;
	TapNoteScore_CheckpointMiss = 4;
}

function GetPlayerJudgment( player )
return Def.ActorFrame {	
	--judges
	LoadActor(THEME:GetPathG("","judgelabels 1x5"))..{
		Name="judgm";
		OnCommand=cmd(stoptweening;pause;basezoom,.67;zoom,1.2;diffusealpha,0);
		NormalCommand=cmd(diffusealpha,1;glow,1,1,1,0;zoom,1.2;y,-57;linear,.12;y,-50;zoom,.78;linear,.3;diffusealpha,.8;sleep,0;glow,1,1,1,.4;linear,.3;diffusealpha,0;zoomx,1.5;zoomy,0);
	};
	--combo
	LoadFont("combo")..{
		Name="combo";
		OnCommand=cmd(stoptweening;basezoom,.67;zoom,.6;x,4;y,20;diffusealpha,0;textglowmode,'TextGlowMode_Inner');
		NormalCommand=cmd(diffusealpha,1;glow,1,1,1,0;y,-3;zoom,.6;linear,.12;y,-15;zoom,.54;linear,.3;diffusealpha,.8;sleep,0;glow,1,1,1,.4;linear,.3;diffusealpha,0;glow,1,1,1,0);
	};
	--label
	LoadActor(THEME:GetPathG("","label"))..{
		Name="label";
		OnCommand=cmd(stoptweening;y,-10;basezoom,.67;zoom,1.2;diffusealpha,0);
		NormalCommand=cmd(diffusealpha,1;glow,1,1,1,0;zoom,1.2;y,-20;linear,.12;zoom,.78;y,-23;linear,.3;diffusealpha,.8;sleep,0;glow,1,1,1,.4;linear,.3;diffusealpha,0;zoomx,1.5;zoomy,0);
	};
	
	--"PERFECT"!
	JudgmentMessageCommand=function(self,param)
		--no player, no job
		if param.Player ~= player then return end;
		--if param.HoldNoteScore then return end;
		
		local this = self:GetChildren();
		local iTns = TNSframe[param.TapNoteScore]
		
		this.judgm:stoptweening();
		--this.judgm:visible(true);
		this.judgm:setstate(iTns);
		
		this.combo:stoptweening();
		this.combo:diffusealpha(0);
		this.label:stoptweening();
		this.label:diffusealpha(0);
			
		if param.HasComboData then
			local combo = param.Misses or param.Combo;
		
			--color misses o RG
			local ccolor = color("1,1,1,1");
			
			if param.IsFailing then
				ccolor = color("1,0.3,0.3,1");
			end;
			
			--visibilidad
			if combo then
				--this.combo:visible(combo >= 4);
				this.combo:visible(true);
				--this.combo:stoptweening();
				this.combo:settextf("%03i",combo);
				this.combo:diffuse(ccolor);
				this.combo:queuecommand("Normal");		
		
				--this.label:visible(combo >= 4);
				this.label:visible(true);
				--this.label:stoptweening();
				this.label:diffuse(ccolor);
				this.label:queuecommand("Normal");
			end;
		else
			this.combo:visible(false);
			this.label:visible(false);
		end;
		
		this.judgm:queuecommand("Normal");
	end;
}
end;

function Actor:GetLifeMeterCommand( pn )
	local style = GAMESTATE:GetCurrentStyle():GetStyleType();

	if( (style=='StyleType_OnePlayerTwoSides') or (style=='StyleType_TwoPlayersSharedSides') ) then
		(cmd(stoptweening;FromTop,18.5;FromCenterX,0))(self);
		return;
	else
		if pn == PLAYER_1 then
			(cmd(stoptweening;FromTop,18.5;FromCenterX,-160))(self);
			return;
		end;
		
		if pn == PLAYER_2 then
			(cmd(stoptweening;rotationy,180;FromTop,18.5;FromCenterX,160))(self);
			return;
		end;
	end;
end;

--######################################################################################
--######################################################################################
-- code by xMAx