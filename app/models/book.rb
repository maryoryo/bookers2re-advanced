class Book < ApplicationRecord
	
	belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :favorited_users, through: :favorites, source: :user
	has_many :book_comments, dependent: :destroy
	
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
	
	def self.search_for(content,method)
		if method == 'prefect'
			Book.where(title: content)
		elsif method == 'forword'
			Book.where('title LIKE ?', content+'%')
		elsif method == 'backword'
			Book.where('title LIKE ?', '%'+content)
		else
			Book.where('titke LIKE ?', '%'+content+'%')
		end
	end

	
end
