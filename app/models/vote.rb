# == Schema Information
#
# Table name: votes
#
#  id            :integer          not null, primary key
#  voteable_type :string
#  voteable_id   :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#

class Vote < ApplicationRecord
  belongs_to :voteable, polymorphic: true
  belongs_to :user
end
