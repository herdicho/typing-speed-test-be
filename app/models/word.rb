class Word < ApplicationRecord
    validates :word, uniqueness:true, presence: true

    belongs_to :language
end
