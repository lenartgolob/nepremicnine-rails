class AddImeToEstates < ActiveRecord::Migration[6.0]
  def change
    add_column :estates, :ime, :string
  end
end
