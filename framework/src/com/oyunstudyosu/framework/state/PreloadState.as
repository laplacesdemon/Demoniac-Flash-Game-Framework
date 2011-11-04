package com.oyunstudyosu.framework.state
{
	import com.oyunstudyosu.framework.FrameworkStates;
	import com.oyunstudyosu.framework.GameFramework;

	public class PreloadState extends State
	{
		public function PreloadState(framework:GameFramework) {
			super(framework);
			this._id = FrameworkStates.STATE_SYSTEM_PRELOAD;
		}
		
		override public function handle():void
		{
		}
	}
}