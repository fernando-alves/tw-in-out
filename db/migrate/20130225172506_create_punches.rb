class CreatePunches < ActiveRecord::Migration
  def change
    create_table :punches do |t|
      t.timestamp :time
      t.references :user
      t.string :type

      t.timestamps
    end
    add_index :punches, :user_id
  end
end
