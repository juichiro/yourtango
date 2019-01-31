class Word < ApplicationRecord
  belongs_to :user
   validates :word, presence: true, length: { maximum: 50 }
   validates :meaning, presence: true, length: { maximum: 50 }
end
