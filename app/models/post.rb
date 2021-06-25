class Post < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many_attached:images, dependent: :destroy
	validates :title, presence: true
	validates :content, presence: true
	#validate :image_type


	def thumbnail input
		return self.images[input].variant(resize: '200x200!').processed
	end
	
	private
	def image_type
		if images.attached? == false
			errors.add(:images, "are missing!")
		end
	end


end
