﻿// Decompiled by AS3 Sorcerer 5.48
// www.as3sorcerer.com

//kabam.rotmg.pets.controller.reskin.ReskinPetFlowStartCommand

package kabam.rotmg.pets.controller.reskin
{
    import robotlegs.bender.bundles.mvcs.Command;
    import kabam.rotmg.dialogs.control.OpenDialogSignal;
    import kabam.rotmg.pets.view.PetFormView;

    public class ReskinPetFlowStartCommand extends Command 
    {

        [Inject]
        public var openDialog:OpenDialogSignal;


        override public function execute():void
        {
            this.openDialog.dispatch(new PetFormView());
        }


    }
}//package kabam.rotmg.pets.controller.reskin

