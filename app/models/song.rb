class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  # def category_name=(name)
  #    self.category = Category.find_or_create_by(name: name)
  #  end
  #
  #  def category_name
  #     self.category ? self.category.name : nil
  #  end

  def genre_name=(name)
    genre = Genre.find_or_create_by(name: name)
    self.genre = genre
  end

  def genre_name
    self.genre.try(:name)
  end

  def artist_name
    self.artist.try(:name)
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end

  def note_contents=(notes)
    notes.each do |content|
      if content.strip != ''
        self.notes.new(content: content)
      end
    end
  end

  def note_contents
    self.notes.map{|e| e.content}
  end

end
