class Language < ApplicationRecord
    validates :language, uniqueness: true

    has_many :word
    has_many :high_word_scores
    has_many :high_wpm_scores
end
