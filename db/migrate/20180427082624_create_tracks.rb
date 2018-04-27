class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :tracks do |t|
      t.string :name
      t.references :artist, foreign_key: true
      t.references :playlist, foreign_key: true

      t.timestamps
    end
  end
end
