require_relative 'transition/transition'
module OoxmlParser
  # Class for parsing `AlternateContent`
  class PresentationAlternateContent < OOXMLDocumentObject
    attr_accessor :transition, :timing, :elements

    def initialize(parent: nil)
      @elements = elements
      @parent = parent
    end

    # Parse PresentationAlternateContent object
    # @param node [Nokogiri::XML:Element] node to parse
    # @return [PresentationAlternateContent] result of parsing
    def parse(node)
      node.xpath('mc:Choice/*', 'xmlns:mc' => 'http://schemas.openxmlformats.org/markup-compatibility/2006').each do |node_child|
        case node_child.name
        when 'timing'
          @timing = Timing.new(parent: self).parse(node_child)
        when 'transition'
          @transition = Transition.new(parent: self).parse(node_child)
        when 'sp'
          @elements << DocxShape.new(parent: self).parse(node_child)
        end
      end
      self
    end
  end
end
