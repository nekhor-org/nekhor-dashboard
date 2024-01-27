class Post < ApplicationRecord
  belongs_to :country
  belongs_to :local

  has_many :post_contents, dependent: :destroy
  has_many :audios, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :itineraries, dependent: :destroy

  # has_rich_text :content

  ## ACTIVE STORAGE
  has_one_attached :image


  accepts_nested_attributes_for :post_contents,
            reject_if: :all_blank,
            allow_destroy: true
  accepts_nested_attributes_for :audios,
            reject_if: :all_blank,
            allow_destroy: true
  accepts_nested_attributes_for :images,
            reject_if: :all_blank,
            allow_destroy: true


  after_create :create_post_contents_any_language

  def create_post_contents_any_language
    Language.all.each do |language|
      PostContent.create!(title: self.title, subtitle: self.subtitle, content: self.content, language_id: language.id, post_id: self.id)
    end
  end
end
