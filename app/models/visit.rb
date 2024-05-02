# == Schema Information
#
# Table name: visits
#
#  id         :integer          not null, primary key
#  caption    :text
#  photo      :string
#  rating     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  stop_id    :integer
#  user_id    :integer
#
class Visit < ApplicationRecord
  
  # Direct associations
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"

  belongs_to :stop, required: true, class_name: "Stop", foreign_key: "stop_id"

  has_many  :visit_comments, class_name: "VisitComment", foreign_key: "visit_id", dependent: :destroy
  
  # Indirect associations
  
end
