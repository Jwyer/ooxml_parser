require 'spec_helper'

describe 'sdt - paragraph - hyperlink - runs' do
  it 'hyperlink_with_runs.docx' do
    docx = OoxmlParser::DocxParser.parse_docx('spec/document/sdt/paragraph/hyperlink/runs/hyperlink_with_runs.docx')
    expect(docx.elements.first.sdt_content.paragraphs.first.hyperlink.runs.first.text).to eq('Heading1 - Page 2')
  end
end
