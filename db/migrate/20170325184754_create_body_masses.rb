class CreateBodyMasses < ActiveRecord::Migration[5.0]
  def change
    create_table :body_masses do |t|
      t.integer :user_id
      t.integer :mass
      t.integer :height
      t.string :category

      t.timestamps
    end
  end
end
