﻿// Decompiled by AS3 Sorcerer 5.48
// www.as3sorcerer.com

//com.google.analytics.core.DomainNameMode

package com.google.analytics.core
{
    public class DomainNameMode 
    {

        public static const none:DomainNameMode = new DomainNameMode(0, "none");
        public static const auto:DomainNameMode = new DomainNameMode(1, "auto");
        public static const custom:DomainNameMode = new DomainNameMode(2, "custom");

        private var _value:int;
        private var _name:String;

        public function DomainNameMode(_arg_1:int=0, _arg_2:String="")
        {
            _value = _arg_1;
            _name = _arg_2;
        }

        public function valueOf():int
        {
            return (_value);
        }

        public function toString():String
        {
            return (_name);
        }


    }
}//package com.google.analytics.core

