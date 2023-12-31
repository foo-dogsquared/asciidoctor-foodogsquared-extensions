# frozen_string_literal: true

require 'rugged'

module Asciidoctor::Foodogsquared::Extensions
  class GitBlobIncludeProcessor < Asciidoctor::Extensions::IncludeProcessor
    def handles?(target)
      target.start_with? 'git:'
    end

    def process(doc, reader, target, attrs)
      attrs['gitrepo'] ||= doc.attributes['gitrepo'] || doc.base_dir
      repo = Rugged::Repository.discover(attrs['gitrepo'])

      git_object_ref = target.delete_prefix 'git:'
      git_object_ref = doc.attributes['doccontentref'] if git_object_ref.empty?

      begin
        git_object = repo.rev_parse git_object_ref

        if attrs.key? 'diff-option'
          options = {}

          options[:paths] = attrs['path'].split(';') if attrs.key? 'path'
          options[:context_lines] = attrs['context-lines'] if attrs.key? 'context-lines'
          options[:reverse] = true if attrs.key? 'reverse-option'

          if attrs.key? 'other'
            other = repo.rev_parse attrs['other'] || nil
            reader.push_include git_object.diff(other, **options).patch
          else
            reader.push_include git_object.diff(**options).patch
          end
        else
          inner_entry = case git_object.type
                        when :blob
                          git_object
                        when :commit
                          git_object.tree.path attrs['path']
                        when :tree
                          git_object.path attrs['path']
                        when :tag
                          git_object.target.tree.path attrs['path']
                        end

          content = repo.lookup(inner_entry[:oid]).content

          if attrs.key? 'lines'
            content_lines = content.lines
            new_content = +''
            doc.resolve_lines_to_highlight(content, attrs['lines']).each do |line_no|
              new_content << content_lines.at(line_no - 1)
            end

            content = new_content
          end

          reader.push_include content
        end
      rescue StandardError => e
        reader.push_include "Unresolved directive for '#{target}' with the following error:\n#{e}"
        warn e
      end

      reader
    end
  end
end
