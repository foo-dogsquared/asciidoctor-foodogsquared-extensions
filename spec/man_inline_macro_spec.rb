# frozen_string_literal: true

describe ManInlineMacro do
  it 'should process with the default manpage service' do
    input = 'man:ls[1]'

    expected = <<~RESULT
      <a href="https://manpages.debian.org/ls.1">ls(1)</a>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end

  it 'should process with the Debian Bookworm section' do
    input = 'man:ls[1, service=debian, subpath=/bookworm]'

    expected = <<~RESULT
      <a href="https://manpages.debian.org/bookworm/ls.1">ls(1)</a>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end

  it 'should link to the Arch Linux manpage' do
    input = 'man:ls[volnum=1, service=arch]'

    expected = <<~RESULT
      <a href="https://man.archlinux.org/man/ls.1">ls(1)</a>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end

  it 'should link to the empty service' do
    input = 'man:ls[volnum=1, service=none]'

    expected = '<p>ls(1)</p>'

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected
  end

  it 'should raise an error from non-existent service type' do
    input = 'man:ls[volnum=1, service=manpageservicexyz]'

    expect { Asciidoctor.convert input }.to raise_error StandardError
  end
end
