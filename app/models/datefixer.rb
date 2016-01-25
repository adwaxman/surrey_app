module DateFixer
  extend ActiveSupport::Concern

  def string_date(date)
    if date.class == String
      Date.parse(date).strftime('%a %b %d, %Y')
    elsif date.class == Date
      date.strftime('%a %b %d, %Y')
    end
  end

  def string_time(time)
    Time.parse(time).strftime('%l:%M %p')
  end
end
