class CreateContatti < ActiveRecord::Migration
  def change
    create_table :contatti do |t|
    	t.string :nome
    	t.string :nota
    	t.references :user, index: true, foreign_key: true

    	t.timestamps null:false
    end
  end
end
