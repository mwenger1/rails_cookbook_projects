class Video < ActiveRecord::Base
  belongs_to :user, touch: true
  mount_uploader :video, VideoUploader
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  process_in_background :video
  
  def video_screenshot
    screenshot_path = "#{Rails.root}/app/assets/images/screenshots/#{self.slug}_#{self.id}.jpg"
    if FileTest.exists?(screenshot_path.to_s)
      @screenshot = screenshot_path.to_s
    else
      video_file = FFMPEG::Movie.new("#{Rails.root}/public"+self.video.url(:mp4))
      @screenshot = video_file.screenshot(screenshot_path.to_s)
    end
  end
  
  def self.get_other_videos(video_id)
    videos = Video.where.not(id: video_id) rescue nil
    return videos
  end
end
