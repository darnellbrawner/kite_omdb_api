class CreateFavorates < ActiveRecord::Migration[5.2]
  def change
    create_table :favorates do |t|
      t.string :imdbID

      t.timestamps
    end
  end
end
