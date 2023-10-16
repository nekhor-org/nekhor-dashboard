class Menu < ApplicationRecord
  belongs_to :language

  validates :introduction, :buddha, :guru, presence: true
end
