package vgdev.dodge.props 
{
	import flash.display.MovieClip;
	import vgdev.dodge.ContainerGame;
	import vgdev.dodge.mechanics.TimeScale;

	/**
	 * An abstract class containing functionality useful to all game objects
	 * @author 	Alexander Huynh
	 */
	class ABST_Prop 
	{
		/// A reference to the active instance of ContainerGame
		protected var cg:ContainerGame;
		
		/// The MovieClip associated with this object (The actual graphic on the stage.)
		public var mc_object:MovieClip;
		
		/// Indicates if this object should be removed
		protected var completed:Boolean = false;
		
		protected var dx:Number = 0;
		protected var dy:Number = 0;

		/**
		 * Should only be called through super(), never instantiated
		 * @param	_cg			The active instance of ContainerGame
		 */
		public function ABST_Prop(_cg:ContainerGame) 
		{
			cg = _cg;
		}
		
		/**
		 * Update this prop
		 * @return		true if the prop is done and should be cleaned up
		 */
		public function step():Boolean
		{
			return completed;
		}
		
		/**
		 * Returns a random Number between min and max, inclusive
		 * @param	min		The lower bound
		 * @param	max		The upper bound
		 * @return			A random Number between min and max
		 */
		protected function getRand(min:Number, max:Number):Number   
		{  
			return Math.random() * (max - min + 1) + min;  
		}
		
		/**
		 * Helper to change the value of a variable restricted within limits and influenced by the time scale
		 * @param	original		The original value
		 * @param	change			The amount to change by
		 * @param	limLow			The minimum amount
		 * @param	limHigh			The maximum amount
		 * @return					The original plus change, with respect to limits and time scale
		 */
		protected function changeWithLimit(original:Number, change:Number,
										   limLow:Number = int.MIN_VALUE, limHigh:Number = int.MAX_VALUE):Number
		{
			original += change * TimeScale.s_scale;
			if (original < limLow)
				original = limLow;
			else if (original > limHigh)
				original = limHigh;
			return original;
		}
	}
}