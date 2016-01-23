module DateFixer

  def string_date(date)
    Date.parse(date).strftime('%a %b %d, %Y')
  end

  def string_time(time)
    Time.parse(time).strftime('%l:%M %p')
  end

end
