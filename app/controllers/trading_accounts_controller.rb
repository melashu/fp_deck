class TradingAccountsController < ApplicationController

    def index
        @trading_accounts = TradingAccount.all.includes(:user).includes(:status).limit(50)
    end
end
