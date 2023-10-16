class CreateCountries < ActiveRecord::Migration[7.0]
  def change
    create_table :countries do |t|
      t.string :name
      t.references :local, null: false, foreign_key: true

      t.timestamps
    end
  end
end
