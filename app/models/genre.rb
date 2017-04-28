class Genre < ActiveRecord::Base

  has_many :artists
  has_many :song_genres
  has_many :songs, through: :song_genres

  def slug
    self.name.strip.gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug)
    self.find{ |variable|
    variable.slug == slug }
    # @item = self.find_by(self.id)
  end

end
