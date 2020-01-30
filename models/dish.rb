class Dish < ActiveRecord::Base
    belongs_to :restaurant
    has_many :dishtags
    has_many :tags, through: :dishtags

    validates :name, presence: true
    validates :restaurant, presence: true
    validate :tags, :tag_validator

    def tag_validator
        if tags != tags.uniq
            errors.add(:tags, "can't have duplicates")
        end
    end
end