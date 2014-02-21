class TYRTSNPCPawn extends MobilePlaceablePawn;

DefaultProperties
{
	//设置默认的NPC网格物体
	Begin Object Class=SkeletalMeshComponent Name=NPCMesh0
		SkeletalMesh=SkeletalMesh'CH_LIAM_Cathode.Mesh.SK_CH_LIAM_Cathode'
		PhysicsAsset=PhysicsAsset'CH_AnimCorrupt.Mesh.SK_CH_Corrupt_Male_Physics'
		AnimSets(0)=AnimSet'CH_AnimHuman.Anims.K_AnimHuman_BaseMale'
		AnimtreeTemplate=AnimTree'CH_AnimHuman_Tree.AT_CH_Human'
	End Object
 
 	Mesh=NPCMesh0
 	Components.Add(NPCMesh0)

	bDontPossess = false
	//指向您的自定义AIController类 - 作为默认值
	ControllerClass=class'TYRTSAIController'
}
