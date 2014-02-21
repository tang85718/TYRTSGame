class TYRTSGame extends FrameworkGame;

event PostLogin(PlayerController NewPlayer)
{
//	local vector fixedLocation;
    super.PostLogin(NewPlayer);

// 	fixedLocation.Z = 600;
// 	NewPlayer.SetLocation(fixedLocation);
}

DefaultProperties
{
	PlayerControllerClass = class'TYRTSPlayerController'
	HUDType = class'TYRTSMoblieHUD'
}
