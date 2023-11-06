# frozen_string_literal: true

require 'asciidoctor'
require 'asciidoctor/extensions'

require_relative 'helpers'

require_relative 'man-inline-macro/extension'
require_relative 'swhid-inline-macro/extension'
require_relative 'swhid-include-processor/extension'
require_relative 'github-inline-macro/extension'
require_relative 'github-include-processor/extension'
require_relative 'gitlab-inline-macro/extension'
require_relative 'gitlab-include-processor/extension'
require_relative 'chat-block/extension'
require_relative 'git-blob-include-processor/extension'
require_relative 'wikipedia-inline-macro/extension'
require_relative 'package-indices-macro/extension'
require_relative 'fdroid-inline-macro/extension'
require_relative 'musicbrainz-inline-macro/extension'
require_relative 'flathub-inline-macro/extension'
require_relative 'repology-inline-macro/extension'
require_relative 'ietf-rfc-inline-macro/extension'

include Asciidoctor::Foodogsquared::Extensions
Asciidoctor::Extensions.register do

  inline_macro ManInlineMacro
  inline_macro IETFRFCInlineMacro
  block ChatBlock if @document.basebackend? 'html'

  inline_macro SWHInlineMacro
  include_processor SWHIncludeProcessor

  inline_macro GitHubInlineMacro
  include_processor GitHubIncludeProcessor

  inline_macro GitLabInlineMacro
  include_processor GitLabIncludeProcessor

  include_processor GitBlobIncludeProcessor

  inline_macro WikipediaInlineMacro

  # Package indices
  inline_macro CtanInlineMacro
  inline_macro PypiInlineMacro
  inline_macro CratesIOInlineMacro

  # App stores
  inline_macro FDroidInlineMacro
  inline_macro FlathubInlineMacro

  # Databases
  inline_macro MusicBrainzInlineMacro
  inline_macro RepologyInlineMacro
end
