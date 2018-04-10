﻿// Decompiled by AS3 Sorcerer 5.48
// www.as3sorcerer.com

//com.company.assembleegameclient.sound.SFX

package com.company.assembleegameclient.sound
{
    import flash.media.SoundTransform;
    import com.company.assembleegameclient.parameters.Parameters;
    import com.company.googleanalytics.GA;

    public class SFX 
    {

        private static var sfxTrans_:SoundTransform;


        public static function load():void
        {
            sfxTrans_ = new SoundTransform(((Parameters.data_.playSFX) ? 1 : 0));
        }

        public static function setPlaySFX(_arg_1:Boolean):void
        {
            GA.global().trackEvent("sound", ((_arg_1) ? "soundOn" : "soundOff"));
            Parameters.data_.playSFX = _arg_1;
            Parameters.save();
            SoundEffectLibrary.updateTransform();
        }

        public static function setSFXVolume(_arg_1:Number):void
        {
            Parameters.data_.SFXVolume = _arg_1;
            Parameters.save();
            SoundEffectLibrary.updateVolume(_arg_1);
        }


    }
}//package com.company.assembleegameclient.sound

