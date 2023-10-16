class CreateAudios < ActiveRecord::Migration[7.0]
  def change
    create_table :audios do |t|
      t.references :post, null: false, foreign_key: true
      t.string :link

      t.timestamps
    end
  end
end
