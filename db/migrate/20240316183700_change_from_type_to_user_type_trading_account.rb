class ChangeFromTypeToUserTypeTradingAccount < ActiveRecord::Migration[7.1]
  def change
    rename_column :trading_accounts, :type, :user_type
  end
end
