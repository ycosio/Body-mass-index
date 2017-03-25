class CreateBodyMasses < ActiveRecord::Migration[5.0]
  def change
    create_table :body_masses do |t|
      t.integer :user_id
      t.float   :mass
      t.float   :height
      t.string  :category

      t.timestamps
    end
  end
end
