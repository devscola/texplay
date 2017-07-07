$LOAD_PATH.unshift File.dirname(File.expand_path(__FILE__))
require 'common'
#require 'devil/gosu'

class W < Gosu::Window
    def initialize
        super(500, 500, false, 20)
        @img = Gosu::Image.new("#{Common::MEDIA}/sunset.png")
        @x = 100
        @y = 100

        @x2 = 400
        @y2 = 100
        @rad = 70
        @s = true

        @copy = TexPlay.create_image(@rad * 2 + 1, @rad * 2 + 1)
      @copy2 = TexPlay.create_image(@rad * 2 + 1, @rad * 2 + 1)
    end

    def draw
      @pause = true

        @x += 1
        @y += 1

        @x2 -= 1
        @y2 += 1


        @copy2.splice @img, 0, 0, :crop => [@x2 - @rad, @y2 - @rad, @x2 + @rad, @y2 + @rad], :sync_mode => :no_sync
        @copy.splice @img, 0, 0, :crop => [@x - @rad, @y - @rad, @x + @rad, @y + @rad], :sync_mode => :no_sync
        @img.rect @x - @rad, @y - @rad, @x + @rad, @y + @rad, :fill => true, :mode => :color_dodge, :color => 0xff888888, :alpha_blend => true

      @img.rect @x2 - @rad, @y2 - @rad, @x2 + @rad, @y2 + @rad, :fill => true, :mode => :color_dodge, :color => 0xff888888

#        @img.force_sync [0,0, @img.width, @img.height]

        @img.draw 10, 10,1

        if button_down?(Gosu::KbEscape)
            IL.Enable(IL::ORIGIN_SET)
            IL.OriginFunc(IL::ORIGIN_UPPER_LEFT)
#            screenshot.crop(0,0, 500, 500).save("screenshot.jpg").free
            exit
        end

    end

    def update
        @img.splice @copy, @x - @rad, @y - @rad if !@s
        @img.splice @copy2, @x2 - @rad, @y2 - @rad if !@s
        @s = nil if @s

    end

end


w = W.new
w.show

