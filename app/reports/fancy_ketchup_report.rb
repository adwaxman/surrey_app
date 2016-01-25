# app/reports/fancy_ketchup_report.rb
class FancyKetchupReport < Dossier::Report
  def sql
    month_beginning = Chronic.parse("first of this month")
    Ride.where("pickup_date >= ?", month_beginning).to_sql
  end
  # format columns
  def format_member_id(member)
    Member.find(member).full_name
  end

  def format_driver_id(driver)
    Driver.find(driver).full_name if driver
  end

  def format_pickup_date(date)
    Ride.string_date(date)
  end

  def format_pickup_time(time)
    Ride.string_time(time)
  end

  def format_created_at(time)
    Ride.string_date(time)
  end
# hide columns
  def display_column?(x)
    x != 'updated_at'
  end
end
