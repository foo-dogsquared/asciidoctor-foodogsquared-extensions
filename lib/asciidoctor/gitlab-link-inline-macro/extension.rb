# frozen_string_literal: true

require 'uri'

class GitLabLinkInlineMacro < Asciidoctor::Extensions::InlineMacroProcessor
  use_dsl

  named :gitlab
  name_positional_attributes 'caption'
  default_attributes 'domain' => 'gitlab.com'

  def process(parent, target, attrs)
    doc = parent.document

    default_caption = if attrs.key?('repo-option')
                        target.split('/').at(1)
                      else
                        target
                      end
    text = attrs['caption'] || default_caption
    uri = URI.parse %(https://#{attrs['domain']}/#{target})

    if attrs.key? 'issue'
      uri.path += %(/-/issues/#{attrs['issue']})
      text << "##{attrs['issue']}" if text == target
    else
      uri.path += %(/-/tree/#{attrs['rev']}) if attrs.key? 'rev'
      uri.path += %(/#{attrs['path']}) if attrs.key? 'path'
      text << "@#{attrs['rev']}" if attrs.key?('rev') && text == target
    end

    target = uri.to_s

    doc.register :links, target
    create_anchor parent, text, type: :link, target: target
  end
end
