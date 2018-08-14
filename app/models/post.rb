class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    validate :click_baity

    def click_baity
        if !(self.title && self.title.match(/Won\'t Believe|Secret|Top\s\d|Guess/))
            
            errors.add(:title, "Title is not click-baity enough!")
        end
    end
end
