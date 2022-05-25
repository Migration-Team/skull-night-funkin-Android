function onCreate()
	-- background shit
	makeLuaSprite('ringback', 'wwe/ringback', -500, -500);
	setLuaSpriteScrollFactor('ringback', 1, 1);

	makeLuaSprite('ringcurtains', 'wwe/ringcurtains', -500, -500);
	setLuaSpriteScrollFactor('ringcurtains', 0.9, 0.9);

	addLuaSprite('ringback', false);
	addLuaSprite('ringcurtains', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end