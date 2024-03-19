class TradingAccountsController < ApplicationController

    def index
     @pagy, @trading_accounts = pagy(TradingAccount.trading_account_list(params))
    end
end
