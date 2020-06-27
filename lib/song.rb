require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song 
    song
  end 
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end 

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end
  
  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
=begin if find by name is false .. create
=end  else -- find by name  .. can i do this using a boolean operator??

    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end 
  end
  
  def self.alphabetical
    @@all.sort_by{|i| i.name}  
  end

  def self.new_from_filename(filename)
=begin have to split it like the csv example. then work with the array index
.chomp will remove ".mp3"
=end 

    data = filename.split ("-")
    artist = data[0]
    song_name = data[1].chomp(".mp3")
    song = self.new
    song.name = song_name
    song.artist = artist
    song
 
  end 

  def self.create_from_filename(filename)
  end
  
  def self.destroy_all
    @@all.clear
  end 

end
