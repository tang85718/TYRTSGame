class TYRTSMoblieHUD extends MobileHUD;

var Font PlayerFont;
var float PlayerNameScale;

function DrawHUD()
{
	local float		    XL, YL, YPos;
//	local Vector2D      TextSize;
	local TYRTSNPCPawn  P;

	super.DrawHUD();
	foreach WorldInfo.AllPawns(class'TYRTSNPCPawn', P)
	{
// 		// �軭��ҵ�����ֵ
// 		Canvas.Font = PlayerFont;
// 		Canvas.SetDrawColorStruct(GreenColor);
// 		Canvas.TextSize(P.Health, TextSize.X, TextSize.Y);
// 		Canvas.SetPos(96 - (TextSize.X * PlayerNameScale / RatioX),0);
// 		Canvas.DrawText(P.Health,,PlayerNameScale / RatioX,PlayerNameScale / RatioY);
// 
// 		// �軭�������
//  		Canvas.SetPos(0, SizeY - 64);
//  		Canvas.TextSize(P.Tag, TextSize.X, TextSize.Y);
//  		Canvas.SetPos(128 - ((TextSize.X * PlayerNameScale / RatioX) / 2), SizeY - 28 - ((TextSize.Y * PlayerNameScale / RatioY) / 2));
//  		Canvas.DrawText(P.Tag,,PlayerNameScale / RatioX,PlayerNameScale / RatioY);
		RenderThreeDeeBox(P);
		RenderThreeDeeCircle(P);
	}

	Canvas.Font = class'Engine'.Static.GetTinyFont();
	Canvas.DrawColor = ConsoleColor;
	Canvas.StrLen("X", XL, YL);
	YPos = 0;
	ShowDebugInfo(YL, YPos);
}

function RenderThreeDeeCircle(Actor Actor)
{
  local Rotator Angle;
  local Vector Radius, Offsets[16];
  local Box ComponentsBoundingBox;
  local float Width, Height;
  local int i;

  if (Actor == None)
  {
    return;
  } 

  Actor.GetComponentsBoundingBox(ComponentsBoundingBox);

  Width = ComponentsBoundingBox.Max.X - ComponentsBoundingBox.Min.X;
  Height = ComponentsBoundingBox.Max.Y - ComponentsBoundingBox.Min.Y;

  Radius.X = (Width > Height) ? Width : Height;
  i = 0;

  for (Angle.Yaw = 0; Angle.Yaw < 65536; Angle.Yaw += 4096)
  {
    // ����ƫ��
    Offsets[i] = Actor.Location + (Radius >> Angle) + Vect(0.f, 0.f, 16.f);
    i++;
  }
      
  // �軭������
  for (i = 0; i < ArrayCount(Offsets); ++i)
  {
    if (i == ArrayCount(Offsets) - 1)
    {
      Draw3DLine(Offsets[i], Offsets[0], class'HUD'.default.RedColor);
    }
    else
    {
      Draw3DLine(Offsets[i], Offsets[i + 1], class'HUD'.default.WhiteColor);
    }
  }
}

function RenderThreeDeeBox(Actor Actor)
{
	local Box ComponentsBoundingBox;
	local Vector BoundingBoxCoordinates[8];
	local int i;

	if (Actor == None)
	{
		return;
	} 

	Actor.GetComponentsBoundingBox(ComponentsBoundingBox);

	// Z1
	// X1, Y1
	BoundingBoxCoordinates[0].X = ComponentsBoundingBox.Min.X;
	BoundingBoxCoordinates[0].Y = ComponentsBoundingBox.Min.Y;
	BoundingBoxCoordinates[0].Z = ComponentsBoundingBox.Min.Z;
	
	// X2, Y1
	BoundingBoxCoordinates[1].X = ComponentsBoundingBox.Max.X;
	BoundingBoxCoordinates[1].Y = ComponentsBoundingBox.Min.Y;
	BoundingBoxCoordinates[1].Z = ComponentsBoundingBox.Min.Z;
	// X2, Y2
	BoundingBoxCoordinates[2].X = ComponentsBoundingBox.Max.X;
	BoundingBoxCoordinates[2].Y = ComponentsBoundingBox.Max.Y;
	BoundingBoxCoordinates[2].Z = ComponentsBoundingBox.Min.Z;
	// X1, Y2
	BoundingBoxCoordinates[3].X = ComponentsBoundingBox.Min.X;
	BoundingBoxCoordinates[3].Y = ComponentsBoundingBox.Max.Y;
	BoundingBoxCoordinates[3].Z = ComponentsBoundingBox.Min.Z;

	// Z2
	// X1, Y1
	BoundingBoxCoordinates[4].X = ComponentsBoundingBox.Min.X;
	BoundingBoxCoordinates[4].Y = ComponentsBoundingBox.Min.Y;
	BoundingBoxCoordinates[4].Z = ComponentsBoundingBox.Max.Z;
	// X2, Y1
	BoundingBoxCoordinates[5].X = ComponentsBoundingBox.Max.X;
	BoundingBoxCoordinates[5].Y = ComponentsBoundingBox.Min.Y;
	BoundingBoxCoordinates[5].Z = ComponentsBoundingBox.Max.Z;
	// X2, Y2
	BoundingBoxCoordinates[6].X = ComponentsBoundingBox.Max.X;
	BoundingBoxCoordinates[6].Y = ComponentsBoundingBox.Max.Y;
	BoundingBoxCoordinates[6].Z = ComponentsBoundingBox.Max.Z;
	// X1, Y2
	BoundingBoxCoordinates[7].X = ComponentsBoundingBox.Min.X;
	BoundingBoxCoordinates[7].Y = ComponentsBoundingBox.Max.Y;
	BoundingBoxCoordinates[7].Z = ComponentsBoundingBox.Max.Z;

	for (i = 0; i < 4; ++i)
	{
		Draw3DLine(BoundingBoxCoordinates[i], BoundingBoxCoordinates[(i == 3) ? 0 : i + 1], class'HUD'.default.WhiteColor);
	}

	for (i = 4; i < 8; ++i)
	{
		Draw3DLine(BoundingBoxCoordinates[i], BoundingBoxCoordinates[(i == 7) ? 4 : i + 1], class'HUD'.default.RedColor);
	}

	for (i = 0; i < 4; ++i)
	{
		Draw3DLine(BoundingBoxCoordinates[i], BoundingBoxCoordinates[i + 4], class'HUD'.default.GreenColor);
	}
}

/**
 * ����Ҫ�Ļ���λ�ô��軭һ�������CanvasIcon ��
 */
final function DrawIconStretched(CanvasIcon Icon, float X, float Y, optional float ScaleX, optional float ScaleY)
{
	if (Icon.Texture != None)
	{
		// ��֤�����Ƿ���Ч
		if (ScaleX <= 0.f)
		{
			ScaleX = 1.f;
		}

		if (ScaleY <= 0.f)
		{
			ScaleY = 1.f;
		}

		if (Icon.UL == 0.f)
		{
			Icon.UL = Icon.Texture.GetSurfaceWidth();
		}

		if (Icon.VL == 0.f)
		{
			Icon.VL = Icon.Texture.GetSurfaceHeight();
		}

		// ���û���λ��
		Canvas.SetPos(X, Y);

		// �軭��ͼ
		Canvas.DrawTileStretched(Icon.Texture, Abs(Icon.UL) * ScaleX, Abs(Icon.VL) * ScaleY, Icon.U, Icon.V, Icon.UL, Icon.VL,, true, true);
   }
}

DefaultProperties
{
	PlayerFont="UI_Fonts.MultiFonts.MF_HudLarge"
	PlayerNameScale=0.25
}
