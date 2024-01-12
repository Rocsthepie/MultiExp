import backend.CoolUtil;

import psychlua.FunkinLua;
import psychlua.LuaUtils;

import sys.FileSystem;
import sys.io.File;

createGlobalCallback('createErrorMessage', function(message:String, ?condition:Bool):Void
{
	if (condition != null)
	{
		if (condition)
		{
			debugPrint(message, FlxColor.RED);
		}
	}
	else
	{
		debugPrint(message, FlxColor.RED);
	}
});

createGlobalCallback('createConditionalErrorMessage', function(condition:Bool, message:String):Bool
{
	if (condition)
	{
		debugPrint(message, FlxColor.RED);
		return true;
	}
	return false;
});

createGlobalCallback('justPressedAccept', function():Bool
{
	return (FlxG.keys.justPressed.ENTER || FlxG.keys.justPressed.SPACE);
});

createGlobalCallback('justPressedCancel', function():Bool
{
	return (FlxG.keys.justPressed.BACKSPACE || FlxG.keys.justPressed.ESCAPE);
});

createGlobalCallback('justPressedLeft', function():Bool
{
	return (FlxG.keys.justPressed.LEFT || FlxG.keys.justPressed.A);
});

createGlobalCallback('justPressedRight', function():Bool
{
	return (FlxG.keys.justPressed.RIGHT || FlxG.keys.justPressed.D);
});