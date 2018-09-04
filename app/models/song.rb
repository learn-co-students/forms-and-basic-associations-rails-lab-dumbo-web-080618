class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes


  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    if self.artist
      self.artist.name
    else
      nil
    end
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    if self.genre
      self.genre.name
    else
      nil
    end
  end

  def note_contents=(note)
    if note.length != 0
      note.each {|n|
         next if n.length == 0
           self.notes << Note.create(content: n, song_id: self.id)}
     end
  end

  def note_contents
     self.notes.map {|n| n.content}
  end


  #   <datalist id="genre_id" >
  #   <% Genre.all.each do |g| %>
  #     <option name="g.id" value="<%= g.name %>">
  #   <% end %>
  # </datalist>
end
