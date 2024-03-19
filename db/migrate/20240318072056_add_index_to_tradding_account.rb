class AddIndexToTraddingAccount < ActiveRecord::Migration[7.1]
  def change
    add_index :trading_accounts, :user_type
    add_index :trading_accounts, :phase
  end
end
