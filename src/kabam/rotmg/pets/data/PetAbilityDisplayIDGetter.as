﻿// Decompiled by AS3 Sorcerer 5.48
// www.as3sorcerer.com

//kabam.rotmg.pets.data.PetAbilityDisplayIDGetter

package kabam.rotmg.pets.data
{
import com.company.assembleegameclient.objects.ObjectLibrary;

public class PetAbilityDisplayIDGetter
    {


        public function getID(_arg_1:int):String
        {
            return (String(ObjectLibrary.getPetDataXMLByType(_arg_1).@id));
        }


    }
}//package kabam.rotmg.pets.data

