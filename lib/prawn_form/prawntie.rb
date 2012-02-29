module Prawn
  class Document
    def form(options={}, &block)
      PrawnForm::DSL::prawn_form options.merge({:pdf => self}), &block
    end
  end
end
