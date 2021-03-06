require_relative 'codition_list/condition'
module OoxmlParser
  # Class for parsing `stCondLst` tags
  class ConditionList < OOXMLDocumentObject
    attr_reader :list

    def initialize(parent: nil)
      @list = []
      @parent = parent
    end

    # Parse CommonTiming object
    # @param node [Nokogiri::XML:Element] node to parse
    # @return [CommonTiming] result of parsing
    def parse(node)
      node.xpath('*').each do |node_child|
        case node_child.name
        when 'cond'
          @list << Condition.new(parent: self).parse(node_child)
        end
      end
      self
    end
  end
end
