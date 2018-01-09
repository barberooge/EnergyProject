class Company < ApplicationRecord
      validates :name, presence: true, length: { maximum: 50 }
      validates :siret, presence: true, length: { maximum: 50 }
end
