class CreateMenus < ActiveRecord::Migration[7.0]
  def change
    create_table :menus do |t|
      t.string :introduction
      t.string :buddha
      t.string :guru
      t.references :language, null: false, foreign_key: true

      t.timestamps
    end
  end
end
