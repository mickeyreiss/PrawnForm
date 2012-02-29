module PrawnForm
  module Fields
    # Generic field
    class Field
      attr_accessor :coordinates, :value

      def initialize(pdf)
        @pdf = pdf
      end
    end

    # Represent text fields
    class TextField < Field
      def render!
        puts "rendering text field at #{self.coordinates.inspect}"
        @pdf.text_box(self.value.to_s, :at => self.coordinates)
      end
    end

    # represent multiline fields
    class MultilineField < Field
      attr_accessor :width, :leading, :height

      def render!
        puts 'rendering multiline field'
        @pdf.text_box(self.value.to_s, :at => self.coordinates, :leading => self.leading, :width => self.width, :height => self.height, :overflow => :shrink_to_fit)
      end
    end

    # represent boolean fields
    class BooleanField < Field
      def render!
        puts 'rendering boolean field'
        @pdf.text_box(self.value ? 'x' : "", :at => self.coordinates)
      end
    end
  end
end
