# == Schema Information
#
# Table name: visits
#
#  id         :integer          not null, primary key
#  caption    :text
#  photo      :string
#  photo_url  :string
#  rating     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  stop_id    :integer
#  user_id    :integer
#
class Visit < ApplicationRecord
  mount_uploader :photo, VisitPhotoUploader
  
  # Validations
  validates(:photo, presence:true)
  validates(:caption, presence:true)
  validates(:rating, presence:true, inclusion: 1..5)

  # Direct associations
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"

  belongs_to :stop, required: true, class_name: "Stop", foreign_key: "stop_id"

  has_many  :visit_comments, class_name: "VisitComment", foreign_key: "visit_id", dependent: :destroy
  
  # Indirect associations
  
end
