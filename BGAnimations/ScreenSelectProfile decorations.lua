local t = Def.ActorFrame {}

------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------
--Sonidos
t[#t+1] = LoadActor( THEME:GetPathS("","CW/S_CMD_MOVE") )..{
	LocalProfileChangeMessageCommand=cmd(play);
	HideProfileChangesMessageCommand=cmd(play);
};

------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------

--1st Player
t[#t+1] = SimplePlatPiu(110,SCREEN_HEIGHT-160)..{ OffCommand=cmd(visible,false); };
t[#t+1] = PlayerMessage(PLAYER_1)..{
	OnCommand=cmd(x,-110;y,SCREEN_HEIGHT-110;linear,.4;x,110);
	PlayerAlreadyJoinedMessageCommand=function(self,params)
		if params.Player == PLAYER_1 then
			self:visible(false);
		end;
	end;
	OffCommand=cmd(visible,false); 
};

--2nd Player
t[#t+1] = SimplePlatPiu(SCREEN_WIDTH-110,SCREEN_HEIGHT-160)..{ OffCommand=cmd(visible,false); };
t[#t+1] = PlayerMessage(PLAYER_2)..{
	OnCommand=cmd(x,SCREEN_WIDTH+110;y,SCREEN_HEIGHT-110;linear,.4;x,SCREEN_WIDTH-110);
	PlayerAlreadyJoinedMessageCommand=function(self,params)
		if params.Player == PLAYER_2 then
			self:visible(false);
		end;
	end;
	OffCommand=cmd(visible,false); 
};

------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------
t[#t+1] = LoadFont("Common Bold")..{
	InitCommand=function(self)
		self:x(5);
		self:y(15);
		self:horizalign('HorizAlign_Left');
		self:settext("V1.0.1");
		self:zoom(.5);
	end;
}

return t