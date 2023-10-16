class CreateCountryNames < ActiveRecord::Migration[7.0]
  def change
    create_table :country_names do |t|
      t.string :name
      t.references :language, null: false, foreign_key: true
      t.references :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
