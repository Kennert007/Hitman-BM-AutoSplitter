state("HitmanBloodMoney", "Steam")
{
	byte Load : 0x005FC9C, 0x0;
	int Start : 0x042DF64, 0x20;
	short AllLevels : 0x005DB64, 0x0;
	int End : 0x01A1A74, 0x54;
}

state("HitmanBloodMoney", "Retail")
{
	byte Load : 0x005FDCC, 0x0;
	int Start : 0x042EF64, 0x20;
	short AllLevels : 0x005DD14, 0x0;
	int End : 0x01A22B4, 0x54;
}

startup
{
    settings.Add("am", true, "All Levels");
    settings.SetToolTip("am", "Choose which levels to split after");
	
	settings.Add("level1", true, "A Vintage Year", "am");
	settings.Add("level2", true, "Curtains Down", "am");
	settings.Add("level3", true, "Flatline", "am");
	settings.Add("level4", true, "A New Life", "am");
	settings.Add("level5", true, "The Murder of Crows", "am");
	settings.Add("level6", true, "You Better Watch Out...", "am");
	settings.Add("level7", true, "Death on The Mississippi", "am");
	settings.Add("level8", true, "Till Death Do Us Part", "am");
	settings.Add("level9", true, "A House of Cards", "am");
	settings.Add("level10", true, "A Dance With The Devil", "am");
	settings.Add("level11", true, "Amendment XXV", "am");
	settings.Add("level12", true, "Requiem", "am");
	
	settings.Add("option1", false, "Game Time");
	settings.SetToolTip("option1", "Enables loadless time, to see it switch livesplit comparison to Game Time");
}

init
{
	if (modules.First().ModuleMemorySize == 0x05C8000)
	version = "Steam";
	if (modules.First().ModuleMemorySize == 0x05C0000)
	version = "Retail";
}

start
{
	return(
	(current.Start == 0 && old.Start == 270794752)
	);
}

split
{
	return(
	(settings["level1"] && current.AllLevels == 2040 && old.AllLevels != current.AllLevels)||
	(settings["level2"] && current.AllLevels == 4488 && old.AllLevels != current.AllLevels)||
	(settings["level3"] && current.AllLevels == 3737 && old.AllLevels != current.AllLevels)||
	(settings["level4"] && current.AllLevels == 4679 && old.AllLevels != current.AllLevels)||
	(settings["level5"] && current.AllLevels == 5685 && old.AllLevels != current.AllLevels)||
	(settings["level6"] && current.AllLevels == 3653 && old.AllLevels != current.AllLevels)||
	(settings["level7"] && current.AllLevels == 3428 && old.AllLevels != current.AllLevels)||
	(settings["level8"] && current.AllLevels == 1634 && old.AllLevels != current.AllLevels)||
	(settings["level9"] && current.AllLevels == 2703 && old.AllLevels != current.AllLevels)||
	(settings["level10"] && current.AllLevels == 3026 && old.AllLevels != current.AllLevels)||
	(settings["level11"] && current.AllLevels == 3121 && old.AllLevels != current.AllLevels)||
	(settings["level12"] && current.End == 825193317 && current.End != old.End && current.AllLevels == 4446)
	);
}

isLoading
{
	return settings["option1"] && current.Load == 0;
}