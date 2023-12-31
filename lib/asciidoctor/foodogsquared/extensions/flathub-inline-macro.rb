# frozen_string_literal: true

require 'json'
require 'open-uri'

module Asciidoctor::Foodogsquared::Extensions
  class FlathubInlineMacro < Asciidoctor::Extensions::InlineMacroProcessor
    use_dsl

    named :flathub
    name_positional_attributes 'caption'

    def process(parent, target, attrs)
      doc = parent.document

      # FlatHub API seems to have no documentation aside from the source code.
      # You can easily infer the API with its source code at
      # https://github.com/flathub/website.
      app_id = target
      app_metadata_uri = %(https://flathub.org/api/v2/appstream/#{app_id})

      headers = {
        'Accept' => 'application/json',
        'User-Agent' => ::Asciidoctor::Foodogsquared::USER_AGENT
      }

      metadata = OpenURI.open_uri(app_metadata_uri, headers) { |f| JSON.parse(f.read) }
      attrs['caption'] ||= metadata['name']

      url = %(https://flathub.org/apps/#{app_id})
      doc.register :links, url
      create_anchor parent, attrs['caption'], type: :link, target: url
    end
  end
end
