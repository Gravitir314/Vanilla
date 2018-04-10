﻿// Decompiled by AS3 Sorcerer 5.72
// www.as3sorcerer.com

//io.decagames.rotmg.friends.commands.FriendActionCommand

package io.decagames.rotmg.friends.commands{
    import kabam.rotmg.appengine.api.AppEngineClient;
    import kabam.rotmg.account.core.Account;
    import io.decagames.rotmg.friends.model.FriendRequestVO;
    import io.decagames.rotmg.ui.popups.signals.ShowPopupSignal;
    import io.decagames.rotmg.ui.popups.signals.RemoveLockFade;
    import kabam.rotmg.game.signals.AddTextLineSignal;
    import io.decagames.rotmg.friends.config.FriendsActions;
    import kabam.rotmg.chat.model.ChatMessage;
    import io.decagames.rotmg.ui.popups.modal.error.ErrorModal;
    import kabam.rotmg.text.view.stringBuilder.LineBuilder;

    public class FriendActionCommand {

        [Inject]
        public var client:AppEngineClient;
        [Inject]
        public var account:Account;
        [Inject]
        public var vo:FriendRequestVO;
        [Inject]
        public var showPopup:ShowPopupSignal;
        [Inject]
        public var removeFade:RemoveLockFade;
        [Inject]
        public var addTextLine:AddTextLineSignal;


        public function execute():void{
            if (this.vo.request == FriendsActions.INVITE){
                this.addTextLine.dispatch(ChatMessage.make("", "Friend request sent"));
            };
            var _local_1:String = FriendsActions.getURL(this.vo.request);
            var _local_2:Object = this.account.getCredentials();
            _local_2["targetName"] = this.vo.target;
            this.client.complete.addOnce(this.onComplete);
            this.client.sendRequest(_local_1, _local_2);
        }

        private function onComplete(_arg_1:Boolean, _arg_2:*):void{
            if (this.vo.callback){
                this.vo.callback(_arg_1, _arg_2, this.vo.target);
            } else {
                if (!_arg_1){
                    this.showPopup.dispatch(new ErrorModal(350, "Friends List Error", LineBuilder.getLocalizedStringFromKey(_arg_2)));
                    this.removeFade.dispatch();
                };
            };
        }


    }
}//package io.decagames.rotmg.friends.commands

