class AddColumnToRace < ActiveRecord::Migration[5.2]
  def change
    add_column :races, :status, :integer, default: 0 # [0: closed, 1: open, 2: finish]
  end
end
