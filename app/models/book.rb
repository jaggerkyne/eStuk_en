class Book < ActiveRecord::Base
	extend FriendlyId
	friendly_id :name, use: :slugged

	has_many :sales
	belongs_to :user
	has_attached_file :image
	has_attached_file :resource
	
	validates_attachment_content_type :image,
	:content_type => ["image/jpeg", "image/gif", "image/png","image/jpg"],
	message: "Only image allowed."

	validates_attachment_content_type :resource,
	content_type:  ['application/pdf'],
	message: "Only pdf allowed."

	validates :image, attachment_presence: true
	validates :resource, attachment_presence: true

	# this is for stripes to process payment, must greater than 50 cents.
	validates_numericality_of :price,
	greater_than: 49, message: "Must be at least 50 cents"

end
