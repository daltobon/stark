# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  description :text
#  user_id     :integer
#  question_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentable, :dependent => :destroy
  has_many :votes, as: :voteable, :dependent => :destroy
  
  validates :description, presence: true
end
