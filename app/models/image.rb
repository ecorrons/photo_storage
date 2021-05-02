# Cached images
class Image < ApplicationRecord
  # configure DB cached image's TTL as you wish!
  TTL = 3.minutes

  def expired?
    created_at <= TTL.ago
  end

  def self.search_in_fields(term)
    Image.where('camera ilike ?', "%#{term}%")
         .or(Image.where(author: term))
         .or(Image.where('tags ilike ?', "##{term} %"))
    # .or(Image.where('full_picture ilike ?',"%#{term}%"))
  end
end
