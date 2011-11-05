package com.demoniac.state
{
	import com.demoniac.FrameworkStates;
	import com.demoniac.GameFramework;

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