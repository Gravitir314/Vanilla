﻿// Decompiled by AS3 Sorcerer 5.48
// www.as3sorcerer.com

//kabam.rotmg.game.view.PortalPanelMediator

package kabam.rotmg.game.view
{
    import robotlegs.bender.bundles.mvcs.Mediator;
    import com.company.assembleegameclient.ui.panels.PortalPanel;
    import kabam.rotmg.game.signals.ExitGameSignal;

    public class PortalPanelMediator extends Mediator 
    {

        [Inject]
        public var view:PortalPanel;
        [Inject]
        public var exitGameSignal:ExitGameSignal;


        override public function initialize():void
        {
            this.view.exitGameSignal.add(this.onExitGame);
        }

        private function onExitGame():void
        {
            this.exitGameSignal.dispatch();
        }

        override public function destroy():void
        {
            this.view.exitGameSignal.remove(this.onExitGame);
        }


    }
}//package kabam.rotmg.game.view

