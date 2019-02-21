class VideoObserver < ActiveRecord::Observer
    def before_save(resource)
        videos = Yt::Collections::Videos.new
        videos.where(order: 'viewCount').first.title #=>  "PSY - GANGNAM STYLE"
        videos.where(q: 'Fullscreen CreatorPlatform', safe_search: 'none').size #=> 324
        videos.where(chart: 'mostPopular', video_category_id: 44).first.title #=> "SINISTER - Trailer"
        videos.where(id: 'jNQXAC9IVRw,invalid').map(&:title) #=> ["Fullscreen Creator Platform"]
    rescue Yt::Errors::NoItems
      resource.title = ''
    end
  end