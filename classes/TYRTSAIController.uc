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
	//��ת��roaming(�й�)״̬
//	GotoState('Roaming');
}

state Roaming
{
Begin:
	`log("TYRTSAIController-roaming-state");
	//������Ǹոտ�ʼ���������Ѿ��������ض�Ŀ�ĵ�
	//����ػ�ȡһ���µ�Ŀ�ĵ�
	if(Destination == none || Pawn.ReachedDestination(Destination))
	{
		Destination = FindRandomDest();
	}

	//�ҵ�һ������Ŀ�ĵص�·�������ƶ������·������һ���ڵ㡣
	MoveToward(FindPathToward(Destination), FindPathToward(Destination));

	//������һ������ѭ��
/*	LatentWhatToDoNext();*/
}

DefaultProperties
{
}
