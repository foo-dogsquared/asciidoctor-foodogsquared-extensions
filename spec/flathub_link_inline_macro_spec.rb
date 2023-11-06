# frozen_string_literal: true

describe FlathubInlineMacro do
  it 'should create a Flathub link to Icon Library app' do
    input = 'flathub:org.gnome.design.IconLibrary[]'

    expected = <<~RESULT
      <a href="https://flathub.org/apps/org.gnome.design.IconLibrary">Icon Library</a>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end

  it 'should create a Flathub link to Icon Library with replaced caption' do
    input = 'flathub:org.gnome.design.IconLibrary[GNOME Icon Library]'

    expected = <<~RESULT
      <a href="https://flathub.org/apps/org.gnome.design.IconLibrary">GNOME Icon Library</a>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end

  it 'should fail to create a link to Flathub due to non-existent app' do
    input = 'flathub:example.com.SomeNonexistentApp[]'

    expect { Asciidoctor.convert input }.to raise_error StandardError
  end

  it 'should still fail to link with replaced caption to a non-existent app in Flathub' do
    input = 'flathub:example.com.SomeNonexistentApp[replacing the caption]'

    expect { Asciidoctor.convert input }.to raise_error StandardError
  end
end
