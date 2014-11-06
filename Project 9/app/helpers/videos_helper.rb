module VideosHelper
	def display_screenshot(video_slug,video_id)
	   "screenshots/#{video_slug}_#{video_id}.jpg"
	end
end
