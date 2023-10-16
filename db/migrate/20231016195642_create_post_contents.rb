class CreatePostContents < ActiveRecord::Migration[7.0]
  def change
    create_table :post_contents do |t|
      t.string :title
      t.string :subtitle
      t.text :content
      t.references :post, null: false, foreign_key: true
      t.references :language, null: false, foreign_key: true

      t.timestamps
    end
  end
end
