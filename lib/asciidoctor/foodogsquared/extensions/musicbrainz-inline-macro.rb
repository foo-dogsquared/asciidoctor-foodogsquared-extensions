# frozen_string_literal: true

require 'json'
require 'open-uri'
require 'uri'

module Asciidoctor::Foodogsquared::Extensions
  class MusicBrainzInlineMacro < Asciidoctor::Extensions::InlineMacroProcessor
    use_dsl

    named :musicbrainz
    name_positional_attributes 'caption', 'type'
    default_attributes 'type' => 'release'

    def process(parent, target, attrs)
      doc = parent.document
      root_endpoint = 'https://musicbrainz.org/ws/2'

      begin
        headers = {
          'Accept' => 'application/json',
          'User-Agent' => ::Asciidoctor::Foodogsquared::USER_AGENT
        }

        uri = %(#{root_endpoint}/#{attrs['type']}/#{target})

        metadata = OpenURI.open_uri(uri, headers) { |f| JSON.parse(f.read) }
        attrs['caption'] ||= case attrs['type']
                             when 'artist', 'area', 'events', 'genre', 'instrument', 'label', 'place', 'series'
                               metadata['name']
                             when 'recording', 'release-group', 'release', 'cdstub', 'work'
                               metadata['title']
                             when 'url'
                               metadata['resource']
                             end

        target = %(https://musicbrainz.org/#{attrs['type']}/#{target})
        doc.register :links, target
        create_anchor parent, attrs['caption'], type: :link, target: target
      rescue StandardError
        warning = %(error while getting Musicbrainz database object '#{target}: #{e}')
        warn_or_raise doc, warning
        reader.push_include warning, target, target, 1, attrs
      end
    end
  end
end
