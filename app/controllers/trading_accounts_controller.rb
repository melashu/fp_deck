class TradingAccountsController < ApplicationController

    def index
     @pagy, @trading_accounts = pagy(TradingAccount.trading_account_list(params))
    end

    def filter
        @number_of_record = TradingAccount.trading_account_list(params).count
         respond_to do |format|
             format.turbo_stream
         end
     end
end
