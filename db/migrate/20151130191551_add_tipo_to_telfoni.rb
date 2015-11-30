class AddTipoToTelfoni < ActiveRecord::Migration
  def change
  	add_column :telefoni, :tipo, :integer
  end
end
