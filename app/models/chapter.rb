class Chapter < ActiveRecord::Base
  acts_as_votable

  belongs_to :trip
  has_many :posts, dependent: :delete_all

	validates :title, presence: true
end