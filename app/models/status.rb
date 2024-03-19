class Status < ApplicationRecord
    has_many :trading_accounts


    def calculate_previous_status
        beginning_of_last_month = Date.today.last_month.beginning_of_month
        end_of_last_month = Date.today.last_month.end_of_month
        current_month = current_month_stats
       last_month = trading_accounts.where(created_at: beginning_of_last_month..end_of_last_month).count
       diff = current_month - last_month
       if last_month.zero?
         100
       else
        ((diff.to_f/last_month)*100).round(0)
       end
    end

    def current_month_stats
        beginning_of_cureent_month = Date.today.beginning_of_month
        end_of_cureent_month = Date.today.end_of_month
        trading_accounts.where(created_at: beginning_of_cureent_month..end_of_cureent_month).count
    end
end
