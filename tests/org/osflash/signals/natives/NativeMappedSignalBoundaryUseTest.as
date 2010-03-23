package org.osflash.signals.natives
{
	import asunit.asserts.*;
	
	import asunit4.async.addAsync;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import org.osflash.signals.ISignal;
	
	public class NativeMappedSignalBoundaryUseTest
	{
		private var signalArrayOfFunctions:NativeMappedSignal;
		private var signalPassArray:NativeMappedSignal;
		private var signalPassArrayThroughFunction:NativeMappedSignal;
		private var sprite:Sprite;
		private const EventType:String = MouseEvent.CLICK;
		private const func1:Function = function ():String { return 'mapped arg 1'; }
		private const func2:Function = function ():String { return 'mapped arg 2'; }
		private const MappedArray:Array = [0, 1];
		
		[Before]
		public function setUp():void
		{
			sprite = new Sprite();
			signalArrayOfFunctions = new NativeMappedSignal(sprite, EventType).mapTo(func1, func2);
			signalPassArray = new NativeMappedSignal(sprite, EventType).mapTo(MappedArray);
			signalPassArrayThroughFunction = new NativeMappedSignal(sprite, EventType, MouseEvent, Array).mapTo(
				function ():Array {
					return MappedArray
				}
			);
		}
		
		[After]
		public function tearDown():void
		{
			signalArrayOfFunctions.removeAll();
			signalArrayOfFunctions = null;
			signalPassArray.removeAll()
			signalPassArray = null
			signalPassArrayThroughFunction.removeAll()
			signalPassArrayThroughFunction = null
		}
		
		public function testInstantiated():void
		{
			assertFalse('sprite has no click event listener to start', sprite.hasEventListener(EventType));
			
			assertTrue("NativeMappedSignal instantiated", signalArrayOfFunctions is NativeMappedSignal);
			assertTrue('implements ISignal', signalArrayOfFunctions is ISignal);
			assertSame('has only one value class', 1, signalArrayOfFunctions.valueClasses.length);
			assertSame('single value class is of type String', String, signalArrayOfFunctions.valueClasses[0]);
			
			assertTrue("NativeMappedSignal instantiated", signalPassArray is NativeMappedSignal);
			assertTrue('implements ISignal', signalPassArray is ISignal);
			assertSame('has only one value class', 1, signalPassArray.valueClasses.length);
			assertSame('single value class is of type String', String, signalPassArray.valueClasses[0]);
			
			assertTrue("NativeMappedSignal instantiated", signalPassArrayThroughFunction is NativeMappedSignal);
			assertTrue('implements ISignal', signalPassArrayThroughFunction is ISignal);
			assertSame('has only one value class', 1, signalPassArrayThroughFunction.valueClasses.length);
			assertSame('single value class is of type String', String, signalPassArrayThroughFunction.valueClasses[0]);
		}
		//////
		[Test]
		public function signal_array_of_functions_add_then_callback_called():void
		{
			signalArrayOfFunctions.add( addAsync(callbackTwoFunctions, 10) );
			sprite.dispatchEvent(new MouseEvent(EventType));
		}
		
		private function callbackTwoFunctions(argFunc1:Function, argFunc2:Function):void 
		{
			assertSame(func1, argFunc1)
			assertSame(func2, argFunc2)
		}
		
		[Test]
		public function signal_pass_array_add_then_array_callback_should_be_called():void
		{
			signalPassArray.add( addAsync(callbackArrayAsArg, 10) );
			sprite.dispatchEvent(new MouseEvent(EventType));
		}
		
		private function callbackArrayAsArg(argArray:Array):void 
		{
			assertSame(MappedArray, argArray)
		}
		
		[Test]
		public function signal_pass_array_through_function_add_then_array_callback_should_be_called():void
		{
			signalPassArrayThroughFunction.add( addAsync(callbackArrayAsArg, 10) );
			sprite.dispatchEvent(new MouseEvent(EventType));
		}
	}		
}