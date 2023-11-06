# frozen_string_literal: true

describe GitLabIncludeProcessor, if: ENV['GITLAB_API_PERSONAL_ACCESS_TOKEN'] do
  it 'should include the GitLab CI configuration from freedesktop-sdk/freedesktop-sdk from the default instance' do
    commit = 'bcb3e0de957519e87a4c7b8c0e40af9876e531e7'
    input = <<~INPUT
      [literal]
      ....
      include::gitlab:freedesktop-sdk/freedesktop-sdk[rev=#{commit}, path=.gitlab-ci.yml]
      ....
    INPUT

    expected = File.read(fixtures_file("freedesktop-sdk-#{commit}-.gitlab-ci.yml"))

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end

  it 'should include the Meson options of Warp from the GNOME GitLab instance' do
    commit = 'v0.5.2'
    input = <<~INPUT
      [literal]
      ....
      include::World/warp[domain=gitlab.gnome.org, rev=#{commit}, path=meson_options.txt]
      ....
    INPUT

    expected = File.read(fixtures_file("warp-#{commit}-meson_options.txt"))

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end

  it 'should not process since it points to the root directory of a repo' do
    input = 'include::gitlab:freedesktop-sdk/freedesktop-sdk[]'

    expect { Asciidoctor.convert input }.to raise_error StandardError
  end

  it 'should fail to point to non-existent repo' do
    input = 'include::gitlab:nonexistentrepoyay/OKOKOKOKOKOKOK[path=README.adoc, rev=v2.0.0]'

    expect { Asciidoctor.convert input }.to raise_error StandardError
  end

  it 'should fail to point to non-existent repo and a non-existent instance' do
    input = 'include::gitlab:nonexistentrepoyay/OKOKOKOKOKOKOK[domain=example.com, path=README.adoc, rev=v2.0.0]'

    expect { Asciidoctor.convert input }.to raise_error StandardError
  end
end
