module ApplicationHelper

  def current_member
    if session[:member_id]
      Member.find(session[:member_id])
    else
      nil
    end
  end

  def current_admin
    if session[:admin_id]
      Admin.find(session[:admin_id])
    else
      nil
    end
  end

  def current_driver
    if session[:driver_id]
      Driver.find(session[:driver_id])
    else
      nil
    end
  end

end
