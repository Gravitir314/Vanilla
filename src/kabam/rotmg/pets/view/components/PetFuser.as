﻿// Decompiled by AS3 Sorcerer 5.48
// www.as3sorcerer.com

//kabam.rotmg.pets.view.components.PetFuser

package kabam.rotmg.pets.view.components
{
    import flash.display.Sprite;
    import org.osflash.signals.Signal;
    import kabam.rotmg.pets.view.components.slot.PetFeedFuseSlot;
    import kabam.rotmg.pets.util.PetsViewAssetFactory;
    import kabam.rotmg.pets.data.PetSlotsState;
    import kabam.rotmg.pets.data.PetVO;

    public class PetFuser extends Sprite 
    {

        public const openPetPicker:Signal = new Signal(String);

        private var leftSlot:PetFeedFuseSlot = new PetFeedFuseSlot();
        private var arrow:FeedFuseArrow = PetsViewAssetFactory.returnPetFeederArrow();
        private var rightSlot:PetFeedFuseSlot = PetsViewAssetFactory.returnPetFuserRightSlot();
        private var state:PetSlotsState;

        public function PetFuser()
        {
            this.leftSlot.showFamily = true;
            addChild(this.leftSlot);
            addChild(this.arrow);
            addChild(this.rightSlot);
            this.leftSlot.openPetPicker.addOnce(this.onOpenLeftPetPicker);
            this.rightSlot.openPetPicker.addOnce(this.onOpenRightPetPicker);
        }

        public function initialize(_arg_1:PetSlotsState):void
        {
            this.state = _arg_1;
            this.setPet(this.state.leftSlotPetVO, PetSlotsState.LEFT);
            if (this.state.rightSlotPetVO)
            {
                this.setPet(this.state.rightSlotPetVO, PetSlotsState.RIGHT);
            };
            this.updateHighlights();
        }

        public function setPet(_arg_1:PetVO, _arg_2:String):void
        {
            var _local_3:PetFeedFuseSlot;
            if (_arg_1)
            {
                _local_3 = ((_arg_2 == PetSlotsState.LEFT) ? this.leftSlot : this.rightSlot);
                _local_3.setPet(_arg_1);
            };
        }

        private function onOpenLeftPetPicker():void
        {
            this.openPetPicker.dispatch(PetSlotsState.LEFT);
        }

        private function onOpenRightPetPicker():void
        {
            this.openPetPicker.dispatch(PetSlotsState.RIGHT);
        }

        public function updateHighlights():void
        {
            if (this.state.isAcceptableFuseState())
            {
                this.arrow.highlight(true);
                this.rightSlot.highlight(true);
                this.leftSlot.highlight(true);
            }
            else
            {
                this.rightSlot.highlight((this.state.rightSlotPetVO == null));
                this.leftSlot.highlight((this.state.leftSlotPetVO == null));
                this.arrow.highlight(false);
            };
        }


    }
}//package kabam.rotmg.pets.view.components

