class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.references :race, foreign_key: true
      t.references :type_test, foreign_key: true

      t.timestamps
    end
  end
end
