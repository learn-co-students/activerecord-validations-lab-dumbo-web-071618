class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :click_bait?

  def click_bait?

    if !(self.title && self.title.match(/Won\'t Believe|Secret|Top\s\d|Guess/))
      errors.add(:click_bait, "title has to be clickbait")
    end
  end


end
