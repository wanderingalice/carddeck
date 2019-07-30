class Image
attr_accessor :rows

  def initialize(rows)
    self.rows = rows
  end

  def output_image
    self.rows.each do |row|
      puts row.inspect
    end
  end

  def image_blur

    newImage = Marshal.load(Marshal.dump(self.rows))

    self.rows.each_index do |y|
      self.rows[y].each_index do |x|
        if self.rows[y][x] == 1 then
          newImage[y-1][x] = 1 if rows[y-1] and rows[y-1][x]
          newImage[y+1][x] = 1 if rows[y+1] and rows[y+1][x]
          newImage[y][x-1] = 1 if rows[y][x-1]
          newImage[y][x+1] = 1 if rows[y][x+1]
        end
        # puts "#{x}, #{y}, #{rows[y][x]}"
      end
    end
    newImage.each do |row|
      puts row.inspect
    end
  end

end

image = Image.new(
  [
    [0, 0, 0, 0],
    [0, 1, 0, 0],
    [0, 0, 0, 1],
    [0, 0, 0, 0]
  ])

image.output_image
puts "Original Image"
image.image_blur
puts "Image - blurred"
image.output_image
puts "Original Image"
