class Tag < ActiveRecord::Base
    has_many :dishtags 
    has_many :dishes, through: :dishtags

    validate :name, :name_validator

    def name_validator
        if name == nil || name.empty?
          errors.add(:name, "can't be presence")
        elsif name.size < 3
          errors.add(:name, "must be 3 or more characters")
        elsif name.scan(/\w+/).size > 2
          errors.add(:name, "can't be more than 2 words")
        end
    end
end