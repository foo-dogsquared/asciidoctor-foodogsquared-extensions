# frozen_string_literal: true

describe GitLabInlineMacro do
  it 'should link to the GitLab page for GitLab project' do
    input = 'gitlab:gitlab-org/gitlab[]'

    expected = <<~RESULT
      <a href="https://gitlab.com/gitlab-org/gitlab">gitlab-org/gitlab</a>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end

  it 'should link to the GitLab page for GitLab project with only the repo part as caption' do
    input = 'gitlab:gitlab-org/gitlab[opts=repo]'

    expected = <<~RESULT
      <a href="https://gitlab.com/gitlab-org/gitlab">gitlab</a>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end

  it 'should link to the GitLab page for GitLab project with replaced captions' do
    input = 'gitlab:gitlab-org/gitlab[GitLab project]'

    expected = <<~RESULT
      <a href="https://gitlab.com/gitlab-org/gitlab">GitLab project</a>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end

  it 'should link to the README of the GitLab project in a certain revision' do
    input = 'gitlab:gitlab-org/gitlab[rev=0c9f77389424b6c5fd8e96b227e9125a13a07cb3, path=README.md]'

    expected = <<~RESULT
      <a href="https://gitlab.com/gitlab-org/gitlab/-/tree/0c9f77389424b6c5fd8e96b227e9125a13a07cb3/README.md">gitlab-org/gitlab@0c9f77389424b6c5fd8e96b227e9125a13a07cb3</a>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end

  it 'should link to the Meson buildspec for GNOME Mutter project on their GitLab instance' do
    input = 'gitlab:GNOME/mutter[domain=gitlab.gnome.org, rev=df653b95adf6462fc731998eb53b0860baa7253c, path=meson.build]'

    expected = <<~RESULT
      <a href="https://gitlab.gnome.org/GNOME/mutter/-/tree/df653b95adf6462fc731998eb53b0860baa7253c/meson.build">GNOME/mutter@df653b95adf6462fc731998eb53b0860baa7253c</a>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end

  it 'should link to the Meson buildspec for GNOME Mutter project on their GitLab instance with replaced captions' do
    input = %(gitlab:GNOME/mutter[Mutter's meson.build, domain=gitlab.gnome.org, rev=df653b95adf6462fc731998eb53b0860baa7253c, path=meson.build])

    expected = <<~RESULT
      <a href="https://gitlab.gnome.org/GNOME/mutter/-/tree/df653b95adf6462fc731998eb53b0860baa7253c/meson.build">Mutter&#8217;s meson.build</a>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end

  it %(should link to one of GitLab's issue from the default instance) do
    input = 'gitlab:gitlab-org/gitlab[issue=1234]'

    expected = <<~RESULT
      <a href="https://gitlab.com/gitlab-org/gitlab/-/issues/1234">gitlab-org/gitlab#1234</a>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end

  it %(should link to one of GNOME Mutter's issue from the GNOME GitLab instance) do
    input = 'gitlab:GNOME/mutter[domain=gitlab.gnome.org, issue=1234]'

    expected = <<~RESULT
      <a href="https://gitlab.gnome.org/GNOME/mutter/-/issues/1234">GNOME/mutter#1234</a>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end

  it %(should link to one of GNOME Mutter's issue from the GNOME GitLab instance with replaced caption) do
    input = %(gitlab:GNOME/mutter[this issue describing Mutter's behavior of resetting scale factor occassionally, domain=gitlab.gnome.org, issue=1234])

    expected = <<~RESULT
      <a href="https://gitlab.gnome.org/GNOME/mutter/-/issues/1234">this issue describing Mutter&#8217;s behavior of resetting scale factor occassionally</a>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end

  it %(should still link to issue if both issue and path are given since issues have more precedence) do
    input = %(gitlab:GNOME/mutter[path=README.md, domain=gitlab.gnome.org, issue=1234])

    expected = <<~RESULT
      <a href="https://gitlab.gnome.org/GNOME/mutter/-/issues/1234">GNOME/mutter#1234</a>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end
end
