class CreateLabels < ActiveRecord::Migration[7.0]
  def change
    create_table :labels do |t|
      t.string :my_favorites
      t.string :already_visited
      t.string :my_itinerary
      t.string :remove_all
      t.string :add
      t.string :save_button
      t.string :view_in_map
      t.string :share
      t.string :reorder
      t.string :edit
      t.string :delete_button
      t.string :choose_itinerary_name
      t.references :language, null: false, foreign_key: true

      t.timestamps
    end
  end
end
