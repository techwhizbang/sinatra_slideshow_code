module PageTracker
  protected

  def increment_page_visits
    session[:page_visits] ||= 0
    session[:page_visits] += 1
  end  
end