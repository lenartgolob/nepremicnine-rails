class CreateEstates < ActiveRecord::Migration[6.0]
  def change
    create_table :estates do |t|
      t.text :opis1
      t.text :opis2
      t.string :naslov
      t.timestamp :objava
      t.string :posredovanje
      t.string :vrsta
      t.string :lokacija
      t.string :telefon
      t.string :tip
      t.integer :velikost
      t.integer :parcela
      t.integer :cena
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
