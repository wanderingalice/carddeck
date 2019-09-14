class Image
  attr_accessor :rows

  def initialize(rows)
    @rows = rows
  end

  def output_image
    @rows.each do |row|
      puts row.inspect
    end
  end
  
  def get_manhattan
    puts "Now - let's try this Manhattan Distance thing. How far do you want to go?"
    @manhattan = gets.chomp.to_i

    until @manhattan != 0 do
      puts "Whoops. That's not going to get us anywhere. Please try again."
      @manhattan = gets.chomp
    end
  end

  def image_blur
    
    newImage = Marshal.load(Marshal.dump(@rows))

    @rows.each_index do |y|
      @rows[y].each_index do |x|
        if @rows[y][x] == 1 then
          newImage[y-1][x] = 1 if rows[y-1] and rows[y-1][x]
          newImage[y+1][x] = 1 if rows[y+1] and rows[y+1][x]
          newImage[y][x-1] = 1 if rows[y][x-1]
          newImage[y][x+1] = 1 if rows[y][x+1]
        end
      end
    end
    @rows = newImage
    @rows.each do |row|
      puts row.inspect
    end
  end

  def manhattan_blur
    puts ""
    puts "Time to blur the image #{@manhattan} times!"
    puts ""
    blurtimes = @manhattan
    
    until blurtimes == 0 do
      blurtimes = blurtimes - 1
      image_blur
      puts ""
      puts "--------------"
      puts ""
    end

    puts ""
    puts "And our final output, after blurring #{@manhattan} times is:"
    puts ""
     @rows.each do |row|
      puts row.inspect
    end
  end

end

image = Image.new(
  [ [0, 1, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 1, 0, 0, 0],
    [0, 0, 1, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [1, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 1, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0]
  ])

image.output_image
puts ""
puts "Original Image"
puts ""
puts "--------------"
puts ""

image.get_manhattan

puts ""

image.manhattan_blur
