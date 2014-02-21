class TYRTSAIController extends GameAIController;

var Actor Destination;

simulated event PostBeginPlay()
{
	`log("TYRTSAIController-PostBeginPlay");
	super.PostBeginPlay();
}

protected event ExecuteWhatToDoNext()
{
	`log("TYRTSAIController-ExecuteWhatToDoNext");
	//跳转到roaming(闲逛)状态
//	GotoState('Roaming');
}

state Roaming
{
Begin:
	`log("TYRTSAIController-roaming-state");
	//如果我们刚刚开始或者我们已经到达了特定目的地
	//随机地获取一个新的目的地
	if(Destination == none || Pawn.ReachedDestination(Destination))
	{
		Destination = FindRandomDest();
	}

	//找到一条到达目的地的路径，并移动到这个路径的下一个节点。
	MoveToward(FindPathToward(Destination), FindPathToward(Destination));

	//启动下一个决策循环
/*	LatentWhatToDoNext();*/
}

DefaultProperties
{
}
