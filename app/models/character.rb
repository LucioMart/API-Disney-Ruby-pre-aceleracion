class Character < ApplicationRecord

    has_and_belongs_to_many :movie, dependent: :nullify

    validates :name, presence: true, length: { minimum: 2, maximum: 20 }
    validates :year, presence: true#, length: { minimum: 2, maximum: 1000 }
    validates :weigh, presence: true#, length: { minimum: 2, maximum: 1000 }
    validates :story, presence: true, length: { minimum: 2, maximum: 500 }
    validates :picture, presence: true, length: { minimum: 2, maximum: 100 }

end
