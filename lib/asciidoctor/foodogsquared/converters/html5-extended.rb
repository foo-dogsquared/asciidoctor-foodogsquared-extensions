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

    def convert_sidebar(node)
      html = Nokogiri::XML::DocumentFragment.parse '<aside></aside>'
      aside = html.first_element_child
      add_common_attributes node, aside

      if node.title?
        html.document.create_element 'strong' do |strong|
          strong.add_class 'title'
          strong.content = node.captioned_title
          aside.add_child strong
        end
      end

      aside.inner_html += node.content
      html.to_html(indent: 2)
    end

    # A modified version of the audio node except it can accept multiple
    # sources.
    def convert_audio(node)
      html = Nokogiri::HTML5::DocumentFragment.parse <<~HTML
        <figure>
          <audio></audio>
        </figure>
      HTML
      figure = html.first_element_child
      audio = figure.first_element_child

      add_common_attributes node, figure
      add_boolean_attribute node, audio, %w[loop controls muted]

      if node.attr? 'sources'
        _, sources = add_sources_elem node, audio, 'audio'

        sources_download_links = sources.map do |src|
          %(<a href="#{src}">#{src}</a>)
        end
        fallback_text = html.document.parse "Download the audio at #{sources_download_links.join ', '}."
      else
        audio['src'] = node.attr 'target'
        fallback_text = html.document.parse "Download the audio at #{node.attr 'target'}."
      end

      audio.add_child fallback_text

      if node.title?
        html.document.create_element 'figcaption' do |block|
          block.inner_html = node.captioned_title
          figure.add_child block
        end
      end

      html.to_html(indent: 2)
    end

    # A modified version of the video block except it can accept multiple
    # sources with the `sources` attribute. Also, much of the built-in
    # Asciidoctor capabilities such as the ability to quickly link from YouTube
    # are removed.
    def convert_video(node)
      html = Nokogiri::HTML5::DocumentFragment.parse <<~HTML
        <figure>
          <video></video>
        </figure>
      HTML
      figure = html.first_element_child
      video = figure.first_element_child

      add_common_attributes node, figure
      add_boolean_attribute node, video, %w[loop controls muted]
      add_attributes_from_node node, video, %w[width height]

      if node.attr? 'sources'
        _, sources = add_sources_elem node, video, 'video'

        sources_download_links = sources.map do |src|
          %(<a href="#{src}">#{src}</a>)
        end
        fallback_text = html.document.parse "Download the video at #{sources_download_links.join ', '}."
      else
        video['src'] = node.attr 'target'
        fallback_text = html.document.parse "Download the video at #{node.attr 'target'}."
      end

      video.add_child fallback_text

      if node.title?
        html.document.create_element 'figcaption' do |block|
          block.inner_html = node.captioned_title
          figure.add_child block
        end
      end

      html.to_html(indent: 2)
    end

    def add_common_attributes(node, html)
      html['id'] = node.id if node.id
      html.add_class node.role unless node.role.nil?

      html
    end

    def add_attributes_from_node(node, html, options)
      options.each do |option|
        html[option] = node.attr option if node.attr? option
      end

      html
    end

    def add_boolean_attribute(node, html, options)
      options.each do |option|
        html[option] = option if node.option? option
      end

      html
    end

    def add_sources_elem(node, html, media_type)
      sources = node.attr('sources', '').split(',').each do |src|
        src = html.document.create_element 'source' do |block|
          block['src'] = src

          type = MIME::Types.type_for(src).find do |mime|
            mime.media_type == media_type
          end
          block['type'] = type unless media_type.nil?
        end

        html.add_child src
      end

      [html, sources]
    end
  end
end
