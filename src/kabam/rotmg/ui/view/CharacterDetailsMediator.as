﻿// Decompiled by AS3 Sorcerer 5.48
// www.as3sorcerer.com

//kabam.rotmg.ui.view.CharacterDetailsMediator

package kabam.rotmg.ui.view
{
    import robotlegs.bender.bundles.mvcs.Mediator;
    import kabam.rotmg.ui.model.HUDModel;
    import kabam.rotmg.ui.signals.HUDModelInitialized;
    import kabam.rotmg.ui.signals.UpdateHUDSignal;
    import kabam.rotmg.ui.signals.NameChangedSignal;
    import com.company.assembleegameclient.ui.icons.IconButtonFactory;
    import com.company.assembleegameclient.objects.ImageFactory;
    import kabam.rotmg.chat.model.TellModel;
    import com.company.googleanalytics.GA;
    import com.company.assembleegameclient.parameters.Parameters;
    import com.company.assembleegameclient.ui.options.Options;
    import com.company.assembleegameclient.objects.Player;

    public class CharacterDetailsMediator extends Mediator 
    {

        [Inject]
        public var view:CharacterDetailsView;
        [Inject]
        public var hudModel:HUDModel;
        [Inject]
        public var initHUDModelSignal:HUDModelInitialized;
        [Inject]
        public var updateHUD:UpdateHUDSignal;
        [Inject]
        public var nameChanged:NameChangedSignal;
        [Inject]
        public var iconButtonFactory:IconButtonFactory;
        [Inject]
        public var imageFactory:ImageFactory;
        [Inject]
        public var tellModel:TellModel;


        override public function initialize():void
        {
            this.injectFactories();
            this.view.init(this.hudModel.getPlayerName(), this.hudModel.getButtonType());
            this.updateHUD.addOnce(this.onUpdateHUD);
            this.updateHUD.add(this.onDraw);
            this.nameChanged.add(this.onNameChange);
            this.view.gotoNexus.add(this.onGotoNexus);
            this.view.gotoOptions.add(this.onGotoOptions);
        }

        private function injectFactories():void
        {
            this.view.iconButtonFactory = this.iconButtonFactory;
            this.view.imageFactory = this.imageFactory;
        }

        override public function destroy():void
        {
            this.updateHUD.remove(this.onDraw);
            this.nameChanged.remove(this.onNameChange);
            this.view.gotoNexus.remove(this.onGotoNexus);
            this.view.gotoOptions.remove(this.onGotoOptions);
        }

        private function onGotoNexus():void
        {
            this.tellModel.clearRecipients();
            this.hudModel.gameSprite.gsc_.escape();
            GA.global().trackEvent("enterPortal", "Nexus Button");
            Parameters.data_.needsRandomRealm = false;
            Parameters.save();
        }

        private function onGotoOptions():void
        {
            this.hudModel.gameSprite.mui_.clearInput();
            GA.global().trackEvent("options", "Options Button");
            this.hudModel.gameSprite.addChild(new Options(this.hudModel.gameSprite));
        }

        private function onUpdateHUD(_arg_1:Player):void
        {
            this.view.update(_arg_1);
        }

        private function onDraw(_arg_1:Player):void
        {
            this.view.draw(_arg_1);
        }

        private function onNameChange(_arg_1:String):void
        {
            this.view.setName(_arg_1);
        }


    }
}//package kabam.rotmg.ui.view

