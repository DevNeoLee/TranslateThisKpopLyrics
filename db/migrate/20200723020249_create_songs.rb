class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.string :title
      t.text :korean_lyrics
      t.text :romaja_lyrics
      t.references :album, null: false, foreign_key: true

      t.timestamps
    end
  end
end
