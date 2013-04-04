class AddWorkDayToPunches < ActiveRecord::Migration
  def change
    add_column :punches, :workday_id, :integer
    add_index :punches, :workday_id
  end
end
