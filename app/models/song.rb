class Song < ActiveRecord::Base

  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.strip.gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug)
    self.find{ |variable|
    variable.slug == slug }
    # @item = self.find_by(self.id)
  end

  def self.create_song(params)
    song = Song.new(name: params[:song][:name])

    if !params[:genres].empty?
      params[:genres].each do |genre|
        song.genres << Genre.find(genre)
      end
    end

    if !params[:song][:artist].empty?
      artist = Artist.find_or_create_by(name: params[:song][:artist])
      song.artist_id = artist.id
    end

    song.save
    song
  end

  def self.update_song(params)
    song = Song.find_by(name: params[:song][:name])
    song.update(name: params[:song][:name])

    if !params[:genres].empty?
      params[:genres].each do |genre|
        song.genres << Genre.find(genre)
      end
    end

    if !params[:song][:artist].empty?
      artist = Artist.find_or_create_by(name: params[:song][:artist])
      song.artist_id = artist.id
    end

    song.save
    song
  end
end
