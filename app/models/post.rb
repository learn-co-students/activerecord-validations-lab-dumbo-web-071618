class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :is_clickbait

  def is_clickbait
    if self.title.nil?
      errors.add(:title, "Title is empty")
      return
    end

    title_array = ["Won't Believe", "Secret", "Top [number]",  "Guess"]
    title_array.each do |phrase|
      if !self.title.scan(phrase).empty?
        return true
      end
    end
     errors.add(:title, "invalid title")
  end

end
