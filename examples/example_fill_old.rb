$LOAD_PATH.unshift File.dirname(File.expand_path(__FILE__))
require 'common'

class W < Gosu::Window
    def initialize
        super(500, 500, false, 20)
        @img = Gosu::Image.new("#{Common::MEDIA}/empty2.png")
        @tp = Gosu::Image.new("#{Common::MEDIA}/texplay.png")
        @gosu = Gosu::Image.new("#{Common::MEDIA}/gosu.png")

        # put a border on the image
        @img.rect 0,0, @img.width - 1, @img.height - 1

        points = []

        # NOTE: TexPlay also accepts points. a 'point' is any object that responds to 'x' or 'y'
        # NOTE: current maximum points for a bezier is 13
        (0..@img.width).step(50) { |x|
            p = TexPlay::TPPoint.new
            p.x = x
            p.y = @img.height * rand

            points << p
        }

        @img.bezier points, :color => :white


        # NOTE: the :texture hash argument works on ALL drawing actions; not just fills
        @img.fill 300, 480, :texture => @tp

        # let's demonstrate by drawing a circle using the gosu.png texture
        # NOTE: :texture even works on lines, boxes, polylines, beziers etc.
        @img.circle 400, 50, 40, :fill => true, :texture => @gosu

    end

    def draw

        @img.draw 0, 0,1
    end

end


w = W.new
w.show

