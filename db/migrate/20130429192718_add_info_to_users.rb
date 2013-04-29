class AddInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :role, :string
    add_column :users, :labor_card, :string
    add_column :users, :admission_date, :date
  end
end
