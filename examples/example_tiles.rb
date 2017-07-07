$LOAD_PATH.unshift File.dirname(File.expand_path(__FILE__))
require 'common'

class Gosu::Image
  # so we can use the old TexPlay to_blob -- appears to segfault?!
  undef_method :to_blob
end

class W < Gosu::Window
  def initialize
    super(500, 300, false, 20)
    @spritesheet = Gosu::Image.new("#{Common::MEDIA}/body.png", false)
    @spritesheet.splice(Gosu::Image.new("#{Common::MEDIA}/face.png", false), 0,0, :alpha_blend => true)
    @sprite_array = Gosu::Image::load_tiles(self, @spritesheet, 40, 80, false)
  end

  def draw
    @spritesheet.draw(200,200,0)
    # @sprite_array[0].draw(200,200,0)
  end

end


w = W.new
w.show


# require 'rubygems'
# require 'gosu'
# require 'texplay'
# class Game_Window < Gosu::Window
# 	def initialize
# 		super(500, 400, false)
# 		self.caption = "Image Test"
# 	end

# 	def draw
# 	end

# end
