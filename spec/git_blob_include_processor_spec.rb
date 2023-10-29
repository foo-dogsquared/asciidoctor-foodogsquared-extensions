# frozen_string_literal: true

require 'open-uri'

describe GitBlobIncludeProcessor do
  it 'should find the LICENSE from the head commit of this Git repo' do
    input = <<~INPUT
      [source]
      ----
      include::git:HEAD[path=LICENSE]
      ----
    INPUT

    expected = File.read(fixtures_file('HEAD-LICENSE'))

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end

  it 'should find the README from a certain commit' do
    input = <<~INPUT
      [source]
      ----
      include::git:v1.0.0[path=shell.nix]
      ----
    INPUT

    expected = File.read(fixtures_file('v1.0.0-shell.nix'))

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end

  it 'should not find the non-existent commit from this repo' do
    input = <<~INPUT
      [source]
      ----
      include::git:00000000-0000-0000-0000-000000000000[path=README.adoc]
      ----
    INPUT

    expected = <<~RESULT
      Unresolved directive for 'git:00000000-0000-0000-0000-000000000000' with the following error:
      revspec '00000000-0000-0000-0000-000000000000' not found
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end

  it 'should not find the non-existent repo' do
    input = <<~INPUT
      :gitrepo: ../very-homeless

      [source]
      -----
      include::git:HEAD[path=README.adoc]
      ----
    INPUT

    expect { Asciidoctor.convert input }.to raise_error StandardError
  end
end
