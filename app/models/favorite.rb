class Favorite < ApplicationRecord
  class Favorite < ApplicationRecord
    belongs_to :user
    belongs_to :book
  end

  class User < ApplicationRecord
    has_many :books, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :favorite_books, through: :favorites, source: :book
  end
end
