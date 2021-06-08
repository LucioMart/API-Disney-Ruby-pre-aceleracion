class Movie < ApplicationRecord

    has_and_belongs_to_many :character, dependent: :nullify

    validates :title, presence: true, length: { minimum: 2, maximum: 30 }
    validates :gender, presence: true#, length: { minimum: 2, maximum: 1000 }
    validates :qualification, presence: true#, length: { minimum: 2, maximum: 1000 }
    validates :picture, presence: true, length: { minimum: 2, maximum: 100 }

end
