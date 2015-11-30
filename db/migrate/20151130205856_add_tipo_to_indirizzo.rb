class AddTipoToIndirizzo < ActiveRecord::Migration
  def change
  	add_column :indirizzi, :tipo, :integer
  end
end
