class HighWordScore < ApplicationRecord
    validates :word_score, presence: true
    
    belongs_to :user
    belongs_to :timer
    belongs_to :language
end
