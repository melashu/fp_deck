class CreateTradingAccounts < ActiveRecord::Migration[7.1]
  def change
    create_table :trading_accounts do |t|
      t.string :name
      t.string :type
      t.string :phase
      t.belongs_to :status, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.float :size
      t.datetime :started
      t.datetime :ended
      t.float :balance
      t.float :profit
      t.float :equity
      t.float :op
      t.float :payouts

      t.timestamps
    end
    add_index :trading_accounts, :name, unique: true
  end
end
