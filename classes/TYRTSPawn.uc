class TYRTSPawn extends GamePawn;

simulated event PostBeginPlay()
{
	Super.PostBeginPlay();
	`log("TYRTSPawn-PostBeginPlay");
}

// simulated function bool CalcCamera(float fDeltaTime, out vector out_CamLoc, out rotator out_CamRot, out float out_FOV)
// {
// 	// �����һ�˳����λ�ú���ת��
// 	GetActorEyesViewPoint( out_CamLoc, out_CamRot );
// 	`log("================================================TYRTSPawn-CalcCamera");
// 	WorldInfo.Game.Broadcast(None, "TYRTSPawn-CalcCamera"$out_CamLoc$"and"$out_CamRot);
// 	return true;
// }   

defaultproperties
{
}