class RemoveKindFromPunches < ActiveRecord::Migration
  def up
    remove_column :punches, :kind
  end

  def down
    add_column :punches, :kind, :string
  end
end
