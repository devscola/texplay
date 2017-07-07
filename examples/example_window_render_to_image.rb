$LOAD_PATH.unshift File.dirname(File.expand_path(__FILE__))
require 'common'

class W < Gosu::Window
  def initialize
    super(500, 500, false)
    self.caption = "Press <escape> to render to texture"

    @picture = Gosu::Image.new("#{Common::MEDIA}/maria.png")
    @block_image = TexPlay.create_image(10, 10, :color => Gosu::Color::RED)
    @rendered_image = TexPlay.create_image(Gosu::MAX_TEXTURE_SIZE - 2, Gosu::MAX_TEXTURE_SIZE - 2, :color => :purple)

    @display = false
  end

  def update

  end

  def draw
    # Render the image once.
    if button_down?(Gosu::KbEscape) and not @display

      render_to_image(@rendered_image, :clip_to => [40, 20, 440, 320]) do
        @picture.draw 0, 0, 1
        1000.times { @block_image.draw rand(250), rand(250), 1, 1, 1, Gosu::Color.new(rand(255), rand(255), rand(255), rand(255)) }
        (0..width).step(5) {|x| draw_line 0, 0, Gosu::Color.new(255, 0, 0, 0), x, width, Gosu::Color.new(255, 0, 0, 0), 1 }
      end
      @display = true
    end

    # Display it indefinitely after that.
    @rendered_image.draw(10, 10, 0) if @display
  end

end


w = W.new
w.show

