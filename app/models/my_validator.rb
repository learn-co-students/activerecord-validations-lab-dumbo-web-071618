
class MyValidator < ActiveModel::Validator

  def validate(record)
    unless record.title.include? "Won't Believe" 
      record.errors[:title] << "WE NEED A BETTER TITLE!"
    end
  end
end
