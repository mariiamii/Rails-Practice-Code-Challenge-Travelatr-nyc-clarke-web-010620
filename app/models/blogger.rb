class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts 

    validates :name, uniqueness: { case_sensitive: false, message: "Name already exists" }
    validates :age, numericality: { greater_than: 0, message: "Invalid Age" }
    validates :bio, length: { minimum: 35, message: "Bio is too short" }

    def total_likes
        self.posts.reduce(0) { |sum, acc| sum += acc.likes }
        
        #Line 10 is the same as below:
        # sum = 0

        # self.posts.each do |post| #instance method
        #     sum += post.likes #self is blogger 
        # end 
        # sum 
    end 

    def featured_post
        p = self.posts.maxy_by { |post| post.likes }
    end 
end
