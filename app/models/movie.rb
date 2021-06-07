class Movie < ApplicationRecord

    #has_and_belongs_to_many :character

    validates :title, presence: true
    validates :gender, presence: true
    validates :qualification, presence: true
    validates :picture, presence: true

end
