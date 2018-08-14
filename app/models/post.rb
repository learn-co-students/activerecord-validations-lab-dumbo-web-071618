class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}
  validate :must_be_clickbaity

  def must_be_clickbaity
      if !(self.title && self.title.match(/Won\'t Believe|Secret|Top \d|Guess/))
        errors.add(:title, "Is not clickbaity")
      end
  end
end
