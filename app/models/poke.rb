class Poke < ApplicationRecord
    has_one :image, dependent: :destroy #this means when the parent is destroyed the children will also be erased
    accepts_nested_attributes_for :image
    validates :name, presence: true
    validates :first_type, presence: true


    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "first_type", "id", "id_value", "name", "second_type", "updated_at"]
      end

    def self.search(search)
        if search
            name = Poke.find_by(name:search)
            if find
                self.where(name: name)
            else
                Poke.all
            end
        else
            Poke.all
        end
    end
end
