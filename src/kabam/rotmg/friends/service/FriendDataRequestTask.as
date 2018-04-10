﻿// Decompiled by AS3 Sorcerer 5.48
// www.as3sorcerer.com

//kabam.rotmg.friends.service.FriendDataRequestTask

package kabam.rotmg.friends.service
{
    import kabam.lib.tasks.BaseTask;
    import kabam.rotmg.appengine.api.AppEngineClient;
    import kabam.rotmg.account.core.Account;

    public class FriendDataRequestTask extends BaseTask 
    {

        [Inject]
        public var client:AppEngineClient;
        [Inject]
        public var account:Account;
        public var requestURL:String;
        public var xml:XML;


        override protected function startTask():void
        {
            this.client.setMaxRetries(8);
            this.client.complete.addOnce(this.onComplete);
            this.client.sendRequest(this.requestURL, this.account.getCredentials());
        }

        private function onComplete(_arg_1:Boolean, _arg_2:*):void
        {
            if (_arg_1)
            {
                this.xml = new XML(_arg_2);
                completeTask(true);
            }
            else
            {
                completeTask(false, _arg_2);
            };
        }


    }
}//package kabam.rotmg.friends.service

