# frozen_string_literal: true

describe MusicBrainzInlineMacro do
  it 'should create a MusicBrainz release object with the right captions' do
    input = 'musicbrainz:9adcff14-7dba-4ccf-a6a6-298bcde3dd46[]'

    expected = <<~RESULT
      <a href="https://musicbrainz.org/release/9adcff14-7dba-4ccf-a6a6-298bcde3dd46">The Binding of Isaac: Rebirth</a>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end

  it 'should create a MusicBrainz release object with the replaced captions' do
    input = 'musicbrainz:9adcff14-7dba-4ccf-a6a6-298bcde3dd46[TBOI Rebirth soundtrack]'

    expected = <<~RESULT
      <a href="https://musicbrainz.org/release/9adcff14-7dba-4ccf-a6a6-298bcde3dd46">TBOI Rebirth soundtrack</a>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end

  it 'should create a MusicBrainz release group object with the right captions' do
    input = 'musicbrainz:b7c7f603-4c42-45a4-b364-3ddba82da412[type=release-group]'

    expected = <<~RESULT
      <a href="https://musicbrainz.org/release-group/b7c7f603-4c42-45a4-b364-3ddba82da412">The Binding of Isaac: Rebirth</a>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end

  it 'should create a MusicBrainz release group object with replaced captions' do
    input = 'musicbrainz:b7c7f603-4c42-45a4-b364-3ddba82da412[TBOI Rebirth soundtrack, type=release-group]'

    expected = <<~RESULT
      <a href="https://musicbrainz.org/release-group/b7c7f603-4c42-45a4-b364-3ddba82da412">TBOI Rebirth soundtrack</a>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end

  it 'should create a MusicBrainz artist object with right captions' do
    input = 'musicbrainz:f07c6afe-ee84-4cd5-9b11-5c541d1dff3b[type=artist]'

    expected = <<~RESULT
      <a href="https://musicbrainz.org/artist/f07c6afe-ee84-4cd5-9b11-5c541d1dff3b">Ridiculon</a>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end

  it 'should create a MusicBrainz artist object with replaced captions' do
    input = 'musicbrainz:f07c6afe-ee84-4cd5-9b11-5c541d1dff3b[the composer of the TBOI Rebirth soundtrack, type=artist]'

    expected = <<~RESULT
      <a href="https://musicbrainz.org/artist/f07c6afe-ee84-4cd5-9b11-5c541d1dff3b">the composer of the TBOI Rebirth soundtrack</a>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end

  it 'should fail to create a MusicBrainz link from non-existent object' do
    input = 'musicbrainz:00000000-0000-0000-0000-000000000000[type=artist]'

    expect { Asciidoctor.convert input }.to raise_error StandardError
  end

  it 'should fail to create a MusicBrainz link from non-existent object with replaced caption' do
    input = 'musicbrainz:00000000-0000-0000-0000-000000000000[what, type=artist]'

    expect { Asciidoctor.convert input }.to raise_error StandardError
  end
end
