class Timer < ApplicationRecord
    validates :timer, uniqueness: true

    has_many :high_word_scores
    has_many :high_wpm_scores
end
