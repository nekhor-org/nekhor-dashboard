class Label < ApplicationRecord
  belongs_to :language

  validates :my_favorites, 
            :already_visited,
            :my_itinerary,
            :remove_all,
            :add,
            :save,
            :view_in_map,
            :share,
            :reorder,
            :edit,
            :delete,
            :choose_itinerary_name, presence: true
end
