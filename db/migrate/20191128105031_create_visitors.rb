class CreateVisitors < ActiveRecord::Migration[5.1]
  def change
    create_table :visitors do |t|
      t.date :visited_at
      t.integer :count
      t.references :user
      t.references :post

      t.timestamps
    end
  end
end
