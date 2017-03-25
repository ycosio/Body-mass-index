class CreateBodyMasses < ActiveRecord::Migration[5.0]
  def change
    create_table :body_masses do |t|
      t.integer :mass
      t.integer :height
      t.integer :category

      t.timestamps
    end
  end
end
