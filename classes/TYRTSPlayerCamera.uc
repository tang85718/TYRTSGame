class TYRTSPlayerCamera extends GamePlayerCamera;

function UpdateViewTarget(out TViewTarget OutVT, float DeltaTime)
{
	Super.UpdateViewTarget(OutVT, DeltaTime);
	OutVT.POV.Rotation.Pitch = -9000;   // ����ͷʼ������
}

DefaultProperties
{
	CameraStyle=FreeCam
}