class Country < ApplicationRecord
  belongs_to :local

  has_many :country_names
  has_many :posts

  validates :name, presence: true

  accepts_nested_attributes_for :country_names,
            reject_if: :all_blank,
            allow_destroy: true


  after_create :create_country_names_any_language

  def name_country
    "#{self.name} - #{self.local&.name}"
  end

  def create_country_names_any_language
    Language.all.each do |language|
      CountryName.create!(name: self.name, language_id: language.id, country_id: self.id)
    end
  end
end
