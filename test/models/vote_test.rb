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

require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
