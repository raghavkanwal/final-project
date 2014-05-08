class CreateDebts < ActiveRecord::Migration
  def change
    create_table :debts do |t|
      t.string :to
      t.integer :amount
      t.integer :user_id

      t.timestamps
    end
    add_index :debts, [:user_id, :created_at]
  end
end
