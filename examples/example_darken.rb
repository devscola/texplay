$LOAD_PATH.unshift File.dirname(File.expand_path(__FILE__))
require 'common'

class W < Gosu::Window
    def initialize
        super(500, 500, false, 20)
        @img = Gosu::Image.new("#{Common::MEDIA}/sunset.png")
        @img.rect 0,0, @img.width - 1, @img.height - 1, :color_control => { :mult => [0.25, 0.25, 0.25, 1] }, :fill => true

        @img.rect 230, 240, 330, 340, :fill => true,
      :color_control => { :mult => [4, 4, 4, 1] }

    end

    def draw
        @img.draw 0, 0,1
    end

end


w = W.new
w.show

