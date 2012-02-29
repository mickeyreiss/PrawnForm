module PrawnForm
  module DSL
    def self.prawn_form(options)
      pdf = options[:pdf] or raise "Prawn::Document object must be provided as pdf option"
      form_data = options[:data] || {}

      raise "Invalid data" unless form_data.respond_to? "[]"

      # TODO: Refactor these three lines into one line
      yield(DSLEngine.new(form_data, pdf))
    end

    class DSLEngine
      # Valid form field types
      VALID_TYPES = [:boolean, :text, :multiline]

      def initialize(data, pdf)
        puts "INITIALIZING DSL ENGINE"

        @pdf = pdf

        @data = data
      end

      def method_missing(field_name, coordinates, options={})
        unless @data.include? field_name
          raise "Given data does not contain attribute '#{field_name}'"
        else
          value = @data[field_name]
        end

        type = type_for(value, options[:type])

        puts "dealing with field #{field_name} = #{value} of type #{type}"
        case type
          when :boolean
            field = BooleanField.new(@pdf)
          when :text
            field = TextField.new(@pdf)
          when :multiline
            field = MultilineField.new(@pdf)
            field.width = options[:width]
            field.height = options[:height]
            field.leading = options[:leading]

        end

        field.value = value
        field.coordinates = coordinates_for(coordinates)

        field.render!
      end

      private
      def type_for(value, request = nil)
        if VALID_TYPES.include? request
          return request
        elsif value.is_a? TrueClass or value.is_a? FalseClass
          return :boolean
        else
          return :text
        end
      end

      def coordinates_for(coordinates)
        if coordinates.respond_to? :length and coordinates.length == 2
          coordinates
        else
          if match = coordinates.match(/(\d+)x(\d+)/)
            return [match[1].to_i, match[2].to_i]
          else
            raise "Invalid coordinate format: #{coordinate}"
          end
        end
      end
    end
  end

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
