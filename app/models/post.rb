class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: %w[Fiction Non-Fiction]
  validate :is_clickbait

  def is_clickbait
    if !title&.downcase&.match(/won't believe|secret|top [0-9]+|guess/)
      errors.add(:title, "Is not clickbaity enought.")
    end
  end
end
