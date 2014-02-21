class TYRTSPlayerController extends GamePlayerController;

auto state PlayerWaiting
{
	exec function StartFire(optional byte FireModeNum)
	{
		showTargetInfo();
	}
}

DefaultProperties
{
	InputClass=class'MobilePlayerInput';
	CameraClass=class'TYRTSPlayerCamera';
}

function showTargetInfo()
{
	local vector loc, norm, end;
	local TraceHitInfo hitInfo;
	local Actor traceHit;

	end = Location + normal(vector(Rotation))*32768; // 跟踪到 "无穷大"
	traceHit = trace(loc, norm, end, Location, true,, hitInfo);

	if (traceHit == none)
	{
		ClientMessage("Nothing found, try again1");
		return;
	}

	//为确认信息播放一个声音
	ClientPlaySound(SoundCue'A_Vehicle_Cicada.SoundCues.A_Vehicle_Cicada_TargetLock');

	//默认情况下在那时会显示４个控制台信息。
 	ClientMessage("Hit: "$traceHit$"  class: "$traceHit.class.outer.name$"."$traceHit.class);
 	ClientMessage("Location: "$loc.X$","$loc.Y$","$loc.Z);
 	ClientMessage("Material: "$hitInfo.Material$"  PhysMaterial: "$hitInfo.PhysMaterial);
	ClientMessage("Component: "$hitInfo.HitComponent);
}