class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :micropost
  mount_uploader :picture, PictureUploader
  # validates :content, presence: true
  default_scope -> { order(created_at: :desc) }

end
