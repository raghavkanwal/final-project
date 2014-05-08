class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :for
      t.integer :amount
      t.integer :user_id

      t.timestamps
    end
	add_index :bills, [:user_id, :created_at]

  end
end
