# == Schema Information
#
# Table name: visit_comments
#
#  id         :integer          not null, primary key
#  comment    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  visit_id   :integer
#
class VisitComment < ApplicationRecord
  
  # Direct associations
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"

  belongs_to :visit, required: true, class_name: "Visit", foreign_key: "visit_id"
  
  # Indirect associations
  
end
