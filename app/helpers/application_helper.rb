module ApplicationHelper

  def current_member
    if session[:member_id]
      Member.find(session[:member_id])
    else
      nil
    end
  end

end
