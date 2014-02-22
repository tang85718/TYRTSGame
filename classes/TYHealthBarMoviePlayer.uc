class TYHealthBarMoviePlayer extends GFxMoviePlayer;

var GFxObject GFxBackground;

var int Width, Height;

function bool Start(optional bool StartPaused = false)
{   
    local float x0, y0, x1, y1;

    super.Start(StartPaused);
    Advance(0.0);
   
    GFxBackground = GetVariableObject("_root.Bg");

    GetVisibleFrameRect(x0, y0, x1, y1);
    Width = x0+x1;
    Height = y0+y1;
   
    return true;   
}

function SetStatusBarWidth(float StatusBarWidth)
{
	local GFxObject.ASDisplayInfo DI;
	DI.hasXScale = true;
	DI.XScale = StatusBarWidth;
   
	GFxBackground.SetDisplayInfo(DI);
}

function SetPosition(Vector ScreenPos)
{
    self.SetViewPort(ScreenPos.X, ScreenPos.Y, Width, Height);
}

DefaultProperties
{
}
