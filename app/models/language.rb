class Language < ApplicationRecord
  validates :name, presence: true

  has_many :country_names, dependent: :destroy
  has_many :local_names, dependent: :destroy
  has_many :labels, dependent: :destroy
  has_many :menus, dependent: :destroy
  has_many :post_contents, dependent: :destroy

  after_create :create_locals
  after_create :create_countries
  after_create :create_post
  after_create :create_labels


  def create_locals
    Local.all.each do |local|
      LocalName.create(name: local.name, language_id: self.id, local_id: local.id)
    end
  end
  
  def create_countries
    Country.all.each do |country|
      CountryName.create(name: country.name, language_id: self.id, country_id: country.id)
    end
  end

  def create_post
    Post.all.each do |post|
      PostContent.create!(title: post.title, subtitle: post.subtitle, content: post.content, language_id: self.id, post_id: post.id)
    end
  end

  def create_labels
    Label.create( my_favorites: "My Favorites", already_visited: "Already Visited", my_itinerary: "My Itinerary", remove_all: "Remove All", add: "Add", save_button: "Save", view_in_map: "View In Map", share: "Share", reorder: "reorder", edit: "Edit", delete_button: "Delete", choose_itinerary_name: "Choose Itinerary Name", language_id: self.id)
  end

  # def create_menus_and_labels
  #   language_id = Language.first.id
  #   @labels = Label.where(language_id: language_id)
  #   @menus = Menu.where(language_id: language_id)
  #   @buttons = Button.where(language_id: language_id)

  #   @labels.each do |label|
  #     new_label = label.dup
  #     new_label.language_id = self.id
  #     new_label.save!
  #   end
    
  #   @menus.each do |menu|
  #     new_menu = menu.dup
  #     new_menu.language_id = self.id
  #     new_menu.save!
  #   end
    
  #   @buttons.each do |button|
  #     new_button = button.dup
  #     new_button.language_id = self.id
  #     new_button.save!
  #   end
  # end
end
