require 'rails_helper'

RSpec.describe Image, type: :model do
  context 'expiration time' do
    it 'expires in TTL=2.hours time' do
      image = Image.create!(author: "an author", camera: "Canon")
      expect(image.expired?).to be false

      image.created_at=8.hours.ago
      image.save!

      expect(image.expired?).to be true
    end
  end
end
