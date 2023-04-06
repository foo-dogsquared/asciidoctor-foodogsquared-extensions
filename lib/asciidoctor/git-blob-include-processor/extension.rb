# frozen_string_literal: true

require 'rugged'

class GitBlobIncludeProcessor < Asciidoctor::Extensions::IncludeProcessor
  def handles?(target)
    target.start_with? 'git:'
  end

  def process(doc, reader, target, attrs)
    repo = Rugged::Repository.discover(__dir__)

    git_object_ref = target.delete_prefix 'git:'
    git_object_ref = doc.attributes['doccontentref'] if git_object_ref.empty?

    begin
      git_object = repo.rev_parse git_object_ref

      if attrs.key? 'diff-option'
        options = {}

        options[:paths] = [attrs['path']] if attrs.key? 'path'
        options[:context_lines] = attrs['context-lines'] if attrs.key? 'context-lines'
        options[:reverse] = true if attrs.key? 'reverse-option'

        reader.push_include git_object.diff(**options).patch
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

        reader.push_include repo.lookup(inner_entry[:oid]).content
      end
    rescue StandardError => e
      reader.push_include "Unresolved directive for '#{target}' with the following error:\n#{e}"
      warn e
    end

    reader
  end
end

class GitContentBranchAttributePreprocessor < Asciidoctor::Extensions::Preprocessor
  def process(document, reader)
    base_dir = Pathname.new(document.base_dir)
    rootdir = if document.attributes['rootdir'].nil?
                Dir.pwd
              else
                document.attributes['rootdir']
              end

    document.attributes['doccontentref'] = base_dir.relative_path_from(rootdir).to_s
    reader
  end
end