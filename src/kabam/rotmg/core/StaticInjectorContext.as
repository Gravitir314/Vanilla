﻿// Decompiled by AS3 Sorcerer 5.48
// www.as3sorcerer.com

//kabam.rotmg.core.StaticInjectorContext

package kabam.rotmg.core
{
    import robotlegs.bender.framework.impl.Context;
    import org.swiftsuspenders.Injector;

    public class StaticInjectorContext extends Context 
    {

        public static var injector:Injector;

        public function StaticInjectorContext()
        {
            if (!StaticInjectorContext.injector)
            {
                StaticInjectorContext.injector = this.injector;
            };
        }

        public static function getInjector():Injector
        {
            return (injector);
        }


    }
}//package kabam.rotmg.core

