﻿// Decompiled by AS3 Sorcerer 5.48
// www.as3sorcerer.com

//kabam.rotmg.game.commands.GiftStatusUpdateCommand

package kabam.rotmg.game.commands
{
    import robotlegs.bender.bundles.mvcs.Command;
    import com.company.assembleegameclient.game.GiftStatusModel;

    public class GiftStatusUpdateCommand extends Command 
    {

        [Inject]
        public var model:GiftStatusModel;
        [Inject]
        public var hasGift:Boolean;


        override public function execute():void
        {
            this.model.setHasGift(this.hasGift);
        }


    }
}//package kabam.rotmg.game.commands

