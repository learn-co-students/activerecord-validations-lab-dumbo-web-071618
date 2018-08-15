class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(fiction non-fiction)}
  # validates :title, inclusion: {in:("Won't Believe", "Secret", "Top [number]", "Guess")}
  # validate :clickbait
  #
  # def clickbait
  #   unless Post.title.include?(["Won't Believe", "Secret", "Top [number]", "Guess"])
  #     record.errors[:title] << "Title needs to be 'Won't Believe', 'Secret', 'Top [number]', or 'Guess'"
  #   end
  # end
end
