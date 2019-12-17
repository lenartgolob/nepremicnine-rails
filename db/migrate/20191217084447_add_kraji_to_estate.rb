class AddKrajiToEstate < ActiveRecord::Migration[6.0]
  def change
    add_column :estates, :kraj, :string
  end
end
