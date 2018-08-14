class MyValidator < ActiveModel::Validator
  def validate(record)
    if record.title
      bait = ["Won't Believe","Secret","Guess"]

      # binding.pry
      if bait.any?{ |str| record.title.include?(str)}
        return true
      elsif record.title.include?("Top")
        title_arr = record.title.split(' ')
        num_index = title_arr.index("Top") + 1
        return title_arr[num_index].instance_of?(Integer)
      end
    end
    record.errors[:title] << "bad title"
  end
end
