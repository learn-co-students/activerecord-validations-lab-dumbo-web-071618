class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :verify_clickbait

  def verify_clickbait
    unless self.title && self.title.match(/(Won't Believe)|(Top \d)|(Secret)|(Guess)/)
      self.errors[:title] << "Post Title Should Be Clickbait"
    end
  end
end
