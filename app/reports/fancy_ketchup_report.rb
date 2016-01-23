# app/reports/fancy_ketchup_report.rb
class FancyKetchupReport < Dossier::Report


  # Or, if you're using ActiveRecord and hate writing SQL:
  def sql
    month_beginning = Chronic.parse("first of this month")
    Ride.where("pickup_date >= ?", month_beginning).to_sql
  end

end
