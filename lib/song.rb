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
    s = Song.new
    @@all << s
    s
  end

  def self.new_by_name(name)
    s = Song.new
    s.name = name
    s
  end

  def self.create_by_name(name)
    s = self.new_by_name(name)
    @@all << s
    s
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
      if self.find_by_name(name)
        self.find_by_name(name)
      else
        self.create_by_name(name)
      end
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    s = Song.new
    s.artist_name = filename.split('-')[0].strip
    s.name = filename.split('-')[1].split('.')[0].strip
    s
  end

  def self.create_from_filename(filename)
    s = self.new_from_filename(filename)
    @@all << s
    s
  end

  def self.destroy_all
    @@all = []
  end
end
