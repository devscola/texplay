$LOAD_PATH.unshift File.dirname(File.expand_path(__FILE__))
require 'common'

class W < Gosu::Window
    def initialize
        super(500, 500, false, 20)
        @img = Gosu::Image.new("#{Common::MEDIA}/sunset.png")

        # each can accept a block of two types of arity:
        # arity 1 - yields just the pixel color
        # arity 3 - yield the pixel color, and the x and y

        # max out the blue component of every pixel
        @img.each { |v| v[2] = 1 }

        # a gradient from 0 red to 1 red
        @img.each(:region => [100, 100, 200, 200]) do |c, x, y|
            c[0] = (x - 100) / 100.0
        end

        # another gradient, this time blocking out everything except red (and alpha)
        @img.each(:region => [100, 250, 200, 350]) do |c, x, y|
            c[0] = (x - 100) / 100.0
            c[1] = 0
            c[2] = 0
        end
    end

    def draw

        @img.draw 0, 0,1
    end

end


w = W.new
w.show

