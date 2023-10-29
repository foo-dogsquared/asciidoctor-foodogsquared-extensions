# frozen_string_literal: true

describe SWHInlineMacro do
  it 'should link to the default resolver with the SWHID' do
    input = <<~INPUT
      swh:1:cnt:94a9ed024d3859793618152ea559a168bbcbb5e2[]
    INPUT

    expected = <<~RESULT
      <a href="https://archive.softwareheritage.org/swh:1:cnt:94a9ed024d3859793618152ea559a168bbcbb5e2">swh:1:cnt:94a9ed024d3859793618152ea559a168bbcbb5e2</a>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end

  it 'should link to the default resolver with the SWHID but with replaced caption' do
    input = <<~INPUT
      swh:1:cnt:94a9ed024d3859793618152ea559a168bbcbb5e2[GPLv3 license]
    INPUT

    expected = <<~RESULT
      <a href="https://archive.softwareheritage.org/swh:1:cnt:94a9ed024d3859793618152ea559a168bbcbb5e2">GPLv3 license</a>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end

  it 'should link to the default resolver with the SWHID (with one qualifier)' do
    input = <<~INPUT
      swh:1:cnt:ce4dd1988d2d5dfcec48252757a6fea94339ac38;lines=3-4[]
    INPUT

    expected = <<~RESULT
      <a href="https://archive.softwareheritage.org/swh:1:cnt:ce4dd1988d2d5dfcec48252757a6fea94339ac38;lines=3-4">swh:1:cnt:ce4dd1988d2d5dfcec48252757a6fea94339ac38</a>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end

  it 'should link to the default resolver with the SWHID (with full recommended qualifiers)' do
    input = <<~INPUT
      swh:1:dir:2885ecf76632a83610d8e95f0eb3383109a7c90a;origin=https://github.com/NixOS/nixpkgs;visit=swh:1:snp:6ea7d28dfd4789609e0be2b64179fc9c12931beb;anchor=swh:1:rev:b7ee21d0ced814d07b7d5aca334dfe018ceafaa5[]
    INPUT

    expected = <<~RESULT
      <a href="https://archive.softwareheritage.org/swh:1:dir:2885ecf76632a83610d8e95f0eb3383109a7c90a;origin=https://github.com/NixOS/nixpkgs;visit=swh:1:snp:6ea7d28dfd4789609e0be2b64179fc9c12931beb;anchor=swh:1:rev:b7ee21d0ced814d07b7d5aca334dfe018ceafaa5">swh:1:dir:2885ecf76632a83610d8e95f0eb3383109a7c90a</a>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end
end
