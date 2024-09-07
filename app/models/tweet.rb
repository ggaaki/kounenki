class Tweet < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_one_attached :image
  belongs_to :user
  
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
  has_many :tweet_tag_relations, dependent: :destroy
  has_many :tags, through: :tweet_tag_relations, dependent: :destroy
end