class TrackerSweeper < ActionController::Caching::Sweeper
  observe Tracker
  def after_create(tracker)
    expire_cache_for(tracker)
  end

  def after_update(tracker)
    expire_cache_for(tracker)
  end

  def after_destroy(tracker)
    expire_cache_for(tracker)
  end
  
  private
  
  def expire_cache_for(tracker)
    expire_fragment('google_analytics')
  end
end
