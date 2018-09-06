class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist 
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def note_contents=(notes_added)
    notes_added.each{|e_note| 
      if (e_note != "" && !e_note.nil?)
        temp_note = Note.new(content: e_note, song_id: self.id)
        self.notes << temp_note
      end
    }
  end

  def note_contents
    self.notes.map{|note| note.content}
  end
end
