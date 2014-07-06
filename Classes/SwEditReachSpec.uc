/* =============================================================================
:: Copyright © 2006 Roman Dzieciol
============================================================================= */
class SwEditReachSpec extends BrushBuilder
    config;


var() config int MaxWindows;	// How many windows can open at once


event bool Build()
{
	local ReachSpec R;
	local int counter;
		
	foreach AllObjects(class'ReachSpec', R)
	{	
		if( R.Start.bSelected && R.End.bSelected )
		{
			R.Start.ConsoleCommand( "editobj "$ R.name );
			if( ++counter == MaxWindows )
				break;
		}
	}
	
		
	return false;
}


DefaultProperties
{
    MaxWindows=16
	ToolTip="SwEditReachSpec"
}
