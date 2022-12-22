class Tag < ApplicationRecord
	has_many :post_tags
	has_many :posts, through: :post_tags

	def in_use?
		pt = PostTag.find_by(tag_id: self.id)
		if pt
			true
		else
			false
		end
	end

end
