# frozen_string_literal: true

require 'asciidoctor'
require 'asciidoctor/extensions'

require_relative 'helpers'

require_relative 'extensions/man-inline-macro'
require_relative 'extensions/swhid-inline-macro'
require_relative 'extensions/swhid-include-processor'
require_relative 'extensions/github-inline-macro'
require_relative 'extensions/github-include-processor'
require_relative 'extensions/gitlab-inline-macro'
require_relative 'extensions/gitlab-include-processor'
require_relative 'extensions/chat-block'
require_relative 'extensions/git-blob-include-processor'
require_relative 'extensions/wikipedia-inline-macro'
require_relative 'extensions/package-indices-macro'
require_relative 'extensions/fdroid-inline-macro'
require_relative 'extensions/musicbrainz-inline-macro'
require_relative 'extensions/flathub-inline-macro'
require_relative 'extensions/repology-inline-macro'
require_relative 'extensions/ietf-rfc-inline-macro'

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
