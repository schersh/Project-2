class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.datetime :created_at
      t.integer :amount
      t.string :description
      t.references :roommate, index: true, foreign_key: true 
    end
  end
end
