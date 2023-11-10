class Local < ApplicationRecord
  has_many :local_names, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :countries, dependent: :destroy
  validates :name, presence: true

  accepts_nested_attributes_for :local_names,
            reject_if: :all_blank,
            allow_destroy: true


  after_create :create_local_names_any_language

  def create_local_names_any_language
    Language.all.each do |language|
      LocalName.create!(name: self.name, language_id: language.id, local_id: self.id)
    end
  end
end
