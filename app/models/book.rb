class Book < ActiveRecord::Base
	has_attached_file :cover
  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/

	belongs_to :group
	has_many :comments, :dependent => :destroy
	has_many :favorites, :dependent => :destroy

	has_attached_file :cover, :default_url => 'book.jpg', styles: { medium: "175x200#", thumb: "150x175#" }
	validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/

	def desc_truncate
		if self.description.length > 125
			self.description.first(125).to_s + "..."
		else
			self.description
		end
	end

	def lib_search
		self.book_name.parameterize("+")
	end

end
