class AddFotoToContatti < ActiveRecord::Migration
  def change
    add_column :contatti, :foto, :string, default: "../../default.jpg"
  end
end
