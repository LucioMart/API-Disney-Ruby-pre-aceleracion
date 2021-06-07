class Character < ApplicationRecord

    has_and_belongs_to_many :movie

    validates :name, presence: true
    validates :year, presence: true
    validates :weigh, presence: true
    validates :story, presence: true
    validates :picture, presence: true

end
