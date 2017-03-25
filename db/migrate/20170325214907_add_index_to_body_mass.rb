class AddIndexToBodyMass < ActiveRecord::Migration[5.0]
  def change
    add_column :body_masses, :imc, :float
  end
end
