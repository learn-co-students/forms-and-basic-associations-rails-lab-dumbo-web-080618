class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes


  def song_artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def song_artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_id=(genre_id)
      g = Genre.find_or_create_by(id: genre_id.to_i)
      self.genre = g
  end

  def genre_id
    self.genre ? self.artist.id : nil
  end

  def song_notes_1=(song_notes)
    # song_notes.each do |note|
      x = Note.find_or_create_by(content: song_notes)
      self.notes << x
    # end
  end

  def song_notes_1
    self.notes ? self.notes.map{|note| note.content} : nil
  end

  def song_notes_2=(song_notes)
    # song_notes.each do |note|
      x = Note.find_or_create_by(content: song_notes)
      self.notes << x
    # end
  end

  def song_notes_2
    self.notes ? self.notes.map{|note| note.content} : nil
  end

  def note_contents=(contents)
    contents.each do |content|
      if content != ""
      notes = Note.find_or_create_by(song_id:self, content:content)
      self.notes << notes
    end
    end
  end

  def note_contents
    self.notes.map{|note| note.content}
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name
  end



end
