class Micropost < ApplicationRecord
  acts_as_votable
  belongs_to :user
  #default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  has_many :comments, dependent: :destroy

  validates :user_id, presence: true

  

  #default_scope -> {  order(:cached_votes_score => :desc)}

  private

    # Validates the size of an uploaded picture.

end
