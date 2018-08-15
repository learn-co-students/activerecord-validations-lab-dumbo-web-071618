class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250}
  validates :summary, length: { maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait

 
  def clickbait
    words = ['Won\'t Believe', 'Secret', 'Top', 'Guess']
    
    ans = words.any? {|w| title.include?(w) if title}
    unless ans
      errors.add(:bait_status, 'Doesn\'t include bait')
    end
      

end

end