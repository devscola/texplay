$LOAD_PATH.unshift File.dirname(File.expand_path(__FILE__))
require 'common'


class W < Gosu::Window
    def initialize
        super(500, 500, false, 20)
        @img = Gosu::Image.new("#{Common::MEDIA}/empty2.png")

        # put a border on the image
        @img.rect 0, 0, @img.width - 1, @img.height - 1

        @length = 0
    end


    # NOTE: turtle is currently written in Ruby so is very slow, look at texplay-contrib.rb for source code.
    def draw

        # NOTE: putting actions in paint block means they are only sync'd to gl at end of block.
        # compare to calling an action directly (on an @img) where it is sync'd to gl immediately

        @img.paint {

            # a 2nd arg of 'true' means to show the turtle
            forward(@length, true, :color => :red)
            turn(89.5)
            @length += 2
        }

        @img.draw 0, 0,1
    end

end


w = W.new
w.show

