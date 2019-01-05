class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :d_author, presence: true
  validates :d_durl, presence: true
  validates :d_name, presence: true
  validate :picture_size
  
  
  private
    # 验证上传的图像大小
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "图片不应该大于 5MB")
      end
    end
end
