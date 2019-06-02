class CreateFavorates < ActiveRecord::Migration[5.2]
  def change
    create_table :favorates do |t|
      t.string :imdb_id
      t.timestamps
    end
  end
end
