$LOAD_PATH.unshift File.dirname(File.expand_path(__FILE__))
require 'common'

class W < Gosu::Window
    def initialize
      super(500, 500, false, 20)
      @img = Gosu::Image.new("#{Common::MEDIA}/sunset.png")
      @cover = TexPlay.create_image(@img.width, @img.height, :color => Gosu::Color.new(127, 127, 127, 127))
    end

    def draw
      @img.draw 0, 0, 1
      @cover.draw 0, 0, 1, 1, 1, Gosu::Color.new(0xffffffff), :multiply
    end
end

W.new.show

