class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, :address, :category, presence: true
  validates :category, inclusion: { in: ["chinese", "italian", "japanese", "french", "belgian"] }
end

# A restaurant must have a name, an address and a category.
# A restaurant’s category must belong to this fixed list: ["chinese", "italian", "japanese", "french", "belgian"].
# When a restaurant is destroyed, all of its reviews must be destroyed as well.
# A review must belong to a restaurant.
# A review must have a content.
# A review must have a rating.
# A review’s rating must be a number between 0 and 5.
# A review’s rating must be an integer. For example, a review with a rating of 2.5 should be invalid!
