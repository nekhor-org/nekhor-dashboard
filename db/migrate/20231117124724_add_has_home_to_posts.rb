class AddHasHomeToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :has_home, :boolean, default: false
  end
end
