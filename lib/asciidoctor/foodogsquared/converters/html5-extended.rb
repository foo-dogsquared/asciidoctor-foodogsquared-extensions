# frozen_string_literal: true

require 'nokogiri'
require 'mime/types'

module Asciidoctor::Foodogsquared::Converters
  # A modified version of the built-in HTML5 converter. This is separated with
  # the default project converter that should only contain new blocks to
  # prevent overriding the converter that most likely going to trip up the
  # user.
  #
  # Take note this is only intended for the author. The user has to explicitly
  # require them somewhere to make use of this.
  class HTML5Modified < Asciidoctor::Foodogsquared::Converter::Html5Extended
    register_for 'html5'

    def convert_paragraph(node)
      html = Nokogiri::XML::DocumentFragment.parse '<p></p>'

      paragraph = html.first_element_child
      add_common_attributes node, paragraph

      if node.title?
        title = html.document.create_element 'strong', class: 'title'
        title.content = node.captioned_title
        paragraph.add_child title
      end

      paragraph.inner_html += node.content
      html.to_html
    end


    def add_common_attributes(node, html)
      html['id'] = node.id if node.id
      html['class'] = node.role if node.role

      html
    end
  end
end
