# == Schema Information
#
# Table name: stop_comments
#
#  id         :integer          not null, primary key
#  comment    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  stop_id    :integer
#  user_id    :integer
#
class StopComment < ApplicationRecord
  
  # Direct associations
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"

  belongs_to :stop, required: true, class_name: "Stop", foreign_key: "stop_id"
  
  # Indirect associations
  
end
