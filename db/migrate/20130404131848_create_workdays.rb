class CreateWorkdays < ActiveRecord::Migration
  def change
    create_table :workdays do |t|
      t.date :day

      t.timestamps
    end
  end
end
