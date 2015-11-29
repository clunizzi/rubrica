class CreateTelefoni < ActiveRecord::Migration
  def change
    create_table :telefoni do |t|
    	t.string :numero_di_telefono
    	t.references :contatto, index: true, foreign_key: true

    	t.timestamps null:false
    end
  end
end
