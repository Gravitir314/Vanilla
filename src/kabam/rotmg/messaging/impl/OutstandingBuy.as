﻿// Decompiled by AS3 Sorcerer 5.48
// www.as3sorcerer.com

//kabam.rotmg.messaging.impl.OutstandingBuy

package kabam.rotmg.messaging.impl
{
    import kabam.rotmg.core.StaticInjectorContext;
    import kabam.rotmg.core.service.GoogleAnalytics;
    import com.company.assembleegameclient.util.Currency;

    internal class OutstandingBuy 
    {

        private var id_:String;
        private var price_:int;
        private var currency_:int;
        private var converted_:Boolean;

        public function OutstandingBuy(_arg_1:String, _arg_2:int, _arg_3:int, _arg_4:Boolean)
        {
            this.id_ = _arg_1;
            this.price_ = _arg_2;
            this.currency_ = _arg_3;
            this.converted_ = _arg_4;
        }

        public function record():void {
            var _local_1:GoogleAnalytics = StaticInjectorContext.getInjector().getInstance(GoogleAnalytics);
            if (_local_1) {
                switch (this.currency_) {
                    case Currency.GOLD:
                        _local_1.trackEvent("credits", ((this.converted_) ? "buyConverted" : "buy"), this.id_, this.price_);
                        return;
                    case Currency.FAME:
                        _local_1.trackEvent("credits", "buyFame", this.id_, this.price_);
                        return;
                    case Currency.GUILD_FAME:
                        _local_1.trackEvent("credits", "buyGuildFame", this.id_, this.price_);
                        return;
                }
            }
        }


    }
}//package kabam.rotmg.messaging.impl

