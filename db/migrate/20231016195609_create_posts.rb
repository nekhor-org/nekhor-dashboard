class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.float :lat
      t.float :lng
      t.references :country, null: false, foreign_key: true
      t.references :local, null: false, foreign_key: true

      t.timestamps
    end
  end
end
