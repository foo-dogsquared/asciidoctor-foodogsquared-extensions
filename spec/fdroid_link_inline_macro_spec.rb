# frozen_string_literal: true

describe FDroidLinkInlineMacro do
  it 'should create a FDroid link' do
    input = 'fdroid:org.moire.ultrasonic[]'

    expected = <<~RESULT
      <a href="https://f-droid.org/en/packages/org.moire.ultrasonic">Ultrasonic</a>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end

  it 'should create a FDroid link with replaced caption' do
    input = 'fdroid:org.moire.ultrasonic[a Subsonic client]'

    expected = <<~RESULT
      <a href="https://f-droid.org/en/packages/org.moire.ultrasonic">a Subsonic client</a>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end

  it 'should fail to create a link due to non-existent app' do
    input = 'fdroid:com.example.NonExistentAppOrSomething[]'

    expect { Asciidoctor.convert input }.to raise_error StandardError
  end

  it 'should fail to create a link due to non-existent app even with replaced caption' do
    input = 'fdroid:com.example.NonExistentAppOrSomething[non-existent app]'

    expect { Asciidoctor.convert input }.to raise_error StandardError
  end
end
