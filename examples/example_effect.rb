$LOAD_PATH.unshift File.dirname(File.expand_path(__FILE__))
require 'common'


class W < Gosu::Window
    def initialize
        super(500, 500, false, 20)
        @img = Gosu::Image.new("#{Common::MEDIA}/empty2.png")

        # put a border on the image
        @img.rect 0,0, @img.width - 1, @img.height - 1

        @length = 0
    end

    def draw

        # quite a cool effect, very slow of course, because it's using turtle and fill
        @img.paint {
            forward(@length, true, :color => :red)
            turn(170)
            @length += 5
            fill (@img.width * rand), (@img.height * rand), :color => :random, :glow => true
        }

        @img.draw 0, 0,1
    end

end


w = W.new
w.show

