class Comment < ApplicationRecord
	belongs_to :post, optional: true
	belongs_to :author, class_name: 'User'
end
