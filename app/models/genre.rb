class Genre < ApplicationRecord
    has_and_belongs_to_many :movie, dependent: :nullify
end
