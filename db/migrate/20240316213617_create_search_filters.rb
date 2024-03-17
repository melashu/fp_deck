class CreateSearchFilters < ActiveRecord::Migration[7.1]
  def change
    create_table :search_filters do |t|
      t.string :name, null: false
      t.belongs_to :user, null: true, foreign_key: true
      t.string :user_type
      t.integer :account_size_from
      t.integer :account_size_to
      t.belongs_to :status, null: true, foreign_key: true
      t.date :started
      t.date :ended
      t.string :phase
      t.integer :balance_from
      t.integer :balance_to

      t.timestamps
    end
    add_index :search_filters, :name, unique: true
  end
end
