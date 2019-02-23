module WrapText
  extend ActiveSupport::Concern

  def wrap_text(text, width)
    separator = ' '
    line = ''

    if not text_fit?(text, width) and text.include? separator
      i = 0
      text.split(separator).each do |word|
        if i == 0
          tmp_line = line + word
        else
          tmp_line = line + separator + word
        end

        if text_fit?(tmp_line, width)
          unless i == 0
            line += separator
          end
          line += word
        else
          unless i == 0
            line += '\n'
          end
          line += word
        end
        i += 1
      end
      text = line
    end
    text
  end

  def text_fit?(text, width)
    tmp_image = Magick::Image.new(width, 500)
    drawing = Magick::Draw.new
    drawing.annotate(tmp_image, 0, 0, 0, 0, text) { |txt|
      txt.gravity = Magick::NorthGravity
      txt.pointsize = 80
      txt.fill = '#FFFFFF'
      txt.stroke = '#000000'
      txt.stroke_width = 2
      txt.font = "#{Rails.root.join('public', 'font',
                           'Franklin_Gothic_Heavy_Regular.ttf')}"
      txt.font_weight = Magick::BoldWeight
    }
    metrics = drawing.get_multiline_type_metrics(tmp_image, text)
    (metrics.width < width)
  end
end
