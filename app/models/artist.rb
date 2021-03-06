class Artist<ActiveRecord::Base
  # include Slug

  has_many :songs
  has_many :song_genres, through: :songs
  has_many :genres, through: :song_genres

  def slug
    self.name.strip.gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug)
    self.find{ |variable|
    variable.slug == slug }
    # @item = self.find_by(self.id)
  end

end
