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

    def convert_admonition(node)
      html = Nokogiri::XML::DocumentFragment.parse '<aside></aside>'

      aside = html.first_element_child
      aside['data-admonition-type'] = node.attr 'name'

      add_common_attributes node, aside

      if node.document.attr? 'icons', 'image'
        html.document.create_element 'svg' do |svg|
          html.document.create_element 'use' do |use|
            use['href'] = "#{node.image_uri "#{node.attr 'name'}.svg", 'iconsdir'}##{node.attr 'name'}"
            use['alt'] = node.attr 'textlabel'
            svg.add_child use
          end
          aside.add_child svg
        end
      else
        html.document.create_element 'div' do |div|
          div.add_class 'admonition-label'
          div.content = node.attr 'textlabel'
          aside.add_child div
        end
      end

      if node.title?
        html.document.create_element 'strong', class: 'title' do |strong|
          strong.add_class 'title'
          strong.content = node.captioned_title
          aside.add_child strong
        end
      end

      aside.inner_html += node.content
      html.to_html(indent: 2)
    end

    def add_common_attributes(node, html)
      html['id'] = node.id if node.id
      html['class'] = node.role if node.role

      html
    end
  end
end
