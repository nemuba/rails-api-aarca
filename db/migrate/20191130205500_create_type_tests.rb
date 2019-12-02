class CreateTypeTests < ActiveRecord::Migration[5.2]
  def change
    create_table :type_tests do |t|
      t.string :genre
      t.integer :oar

      t.timestamps
    end
  end
end
