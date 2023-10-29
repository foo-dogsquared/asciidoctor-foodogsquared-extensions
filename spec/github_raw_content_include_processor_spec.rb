# frozen_string_literal: true

describe GitHubRawIncludeProcessor do
  it 'should include the raw content of a GitHub file successfully' do
    input = <<~INPUT
      [literal]
      ....
      include::github:asciidoctor/asciidoctor[path=Rakefile, rev=v2.0.0]
      ....
    INPUT

    expected = File.read(fixtures_file('asciidoctor-v2.0.0-Rakefile'))

    actual = Asciidoctor.convert input.tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end

  it 'should get the raw content of COPYING from nixpkgs at a specific commit' do
    commit = 'a46b89df91f56c8aca7de32d270422353d855483'
    input = <<~INPUT
      [literal]
      ....
      include::github:NixOS/nixpkgs[rev=#{commit}, path=COPYING]
      ....
    INPUT

    expected = File.read(fixtures_file("nixpkgs-#{commit}-COPYING"))

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end

  it 'should not process since it points to the root directory of the repo' do
    input = 'include::github:asciidoctor/asciidoctor[]'

    expect { Asciidoctor.convert input }.to raise_error StandardError
  end

  it 'should fail to point to non-existent repo' do
    input = 'include::github:nonexistentrepoyay/OKOKOKOKOKOKOK[path=README.adoc, rev=v2.0.0]'

    expect { Asciidoctor.convert input }.to raise_error StandardError
  end
end
