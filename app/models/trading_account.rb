class TradingAccount < ApplicationRecord
  belongs_to :status
  belongs_to :user
end
