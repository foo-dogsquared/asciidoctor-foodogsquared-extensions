# frozen_string_literal: true

require 'mime/types'

module Asciidoctor::Foodogsquared::Converters
  # A modified version of the built-in HTML5 converter. This is separated with
  # the default project converter that should only contain new blocks to
  # prevent overriding the converter that most likely going to trip up the
  # user.
  #
  # Take note this is only intended for the author. The user has to explicitly
  # require them somewhere to make use of this.
  class HTML5Modified < Asciidoctor::Foodogsquared::Converter
    def convert_paragraph(node)
      attributes = html_attributes node

      if node.title?
        <<~HTML
          <p#{attributes.join ' '}>
            <strong class="title">#{node.captioned_title}</strong>
            #{node.content}
          </p>
        HTML
      else
        <<~HTML
          <p#{attributes.join ' '}>#{node.content}</p>
        HTML
      end
    end

    def html_attributes(node)
      attributes = []
      attributes << %(id="#{node.id}") if node.id
      attributes << %(class="#{node.role}") if node.role

      attributes
    end
  end
end
