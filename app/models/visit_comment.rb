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
end
