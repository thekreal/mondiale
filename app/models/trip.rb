class Trip < ActiveRecord::Base

	belongs_to :user
	#has_many :chapters
	#has_many :posts, :through => :chapters

  validates :title, :description, presence: :true
  validates :title, uniqueness: :true

end