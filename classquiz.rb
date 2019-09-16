class Book
  attr_accessor :title, :author
  
  def initialize(title, author)
    @title = title
    @author = author
  end
end

class PictureBook < Book
  attr_accessor :picture

  def initialize(title, author, picture)
    super(title, author)
    @picture = picture
  end
end


puts "what's your book's title?"
newtitle = gets.chomp
puts ""
puts "who is the author?"
newauthor = gets.chomp
puts ""
puts "what kind of pictures does it have?"
newpic = gets.chomp

picturebook = PictureBook.new(newtitle, newauthor, newpic)
puts picturebook.picture
puts picturebook.title