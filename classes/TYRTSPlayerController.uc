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

	end = Location + normal(vector(Rotation))*32768; // ���ٵ� "�����"
	traceHit = trace(loc, norm, end, Location, true,, hitInfo);

	if (traceHit == none)
	{
		ClientMessage("Nothing found, try again1");
		return;
	}

	//Ϊȷ����Ϣ����һ������
	ClientPlaySound(SoundCue'A_Vehicle_Cicada.SoundCues.A_Vehicle_Cicada_TargetLock');

	//Ĭ�����������ʱ����ʾ��������̨��Ϣ��
 	ClientMessage("Hit: "$traceHit$"  class: "$traceHit.class.outer.name$"."$traceHit.class);
 	ClientMessage("Location: "$loc.X$","$loc.Y$","$loc.Z);
 	ClientMessage("Material: "$hitInfo.Material$"  PhysMaterial: "$hitInfo.PhysMaterial);
	ClientMessage("Component: "$hitInfo.HitComponent);
}