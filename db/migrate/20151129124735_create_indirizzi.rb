class CreateIndirizzi < ActiveRecord::Migration
  def change
    create_table :indirizzi do |t|
    	t.string :indirizzo
    	t.string :cap
    	t.string :citta

    	t.references :contatto, index: true, foreign_key: true

    	t.timestamps null:false
    end
  end
end
