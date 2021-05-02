# External API bearer token
class Token < ApplicationRecord
  def self.newest
    last.token if any?
  end
end
