# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  vote        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

class Question < ApplicationRecord
=begin	
Rails dependent destroy se encargará de 
eliminar las filas secundarias 
asociadas al eliminar un elemento primario.	
=end
	belongs_to :user
	has_many :answers, :dependent => :destroy
	has_many :comments, as: :commentable, :dependent => :destroy


	validates :title, presence: true
	validates :description, presence: true
end
