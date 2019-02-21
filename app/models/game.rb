class Game < ApplicationRecord
    belongs_to :user
    validates :game_name, presence: true, uniqueness: true
    validates :price, presence: true
    validates :year_purchased, length: { is: 4 }

    mount_uploader :image, ImageUploader
end
