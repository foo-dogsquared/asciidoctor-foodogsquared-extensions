# frozen_string_literal: true

describe GitHubInlineMacro do
  it 'should create a GitHub link with the caption being the target' do
    input = <<~INPUT
      github:foo-dogsquared/foobarbazxyz[]
    INPUT

    expected = <<~RESULT
      <a href="https://github.com/foo-dogsquared/foobarbazxyz">foo-dogsquared/foobarbazxyz</a>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end

  it 'should create a GitHub link to an account' do
    input = 'github:foo-dogsquared[]'

    expected = <<~RESULT
      <a href="https://github.com/foo-dogsquared">foo-dogsquared</a>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end

  it 'should create a GitHub link with only the repo as the caption' do
    input = 'github:foo-dogsquared/foobarbazxyz[opts=repo]'

    expected = <<~RESULT
      <a href="https://github.com/foo-dogsquared/foobarbazxyz">foobarbazxyz</a>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end

  it 'should create a GitHub link with replaced caption' do
    input = 'github:foo-dogsquared/foobarbazxyz[my XYZ project]'

    expected = <<~RESULT
      <a href="https://github.com/foo-dogsquared/foobarbazxyz">my XYZ project</a>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end

  it 'should create a GitHub link to Vale v2.3.0 README' do
    input = 'github:errata-ai/vale[path=README.md, rev=v2.3.0]'

    expected = <<~RESULT
      <a href="https://github.com/errata-ai/vale/tree/v2.3.0/README.md">errata-ai/vale@v2.3.0</a>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end

  it 'should create a GitHub link to Vale v2.3.0 README with replaced caption' do
    input = 'github:errata-ai/vale[Vale v2.3.0 README, path=README.md, rev=v2.3.0]'

    expected = <<~RESULT
      <a href="https://github.com/errata-ai/vale/tree/v2.3.0/README.md">Vale v2.3.0 README</a>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end

  it %(should create a GitHub link to one of Neovim's issues) do
    input = 'github:neovim/neovim[issue=614]'

    expected = <<~RESULT
      <a href="https://github.com/neovim/neovim/issues/614">neovim/neovim#614</a>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end

  it %(should create a GitHub link to one of Neovim's issues with a replaced caption) do
    input = <<~INPUT
      github:neovim/neovim[Neovim will not open large files properly, issue=614]
    INPUT

    expected = <<~RESULT
      <a href="https://github.com/neovim/neovim/issues/614">Neovim will not open large files properly</a>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end

  it %(should still link to one of Neovim's issues) do
    input = <<~INPUT
      github:neovim/neovim[Neovim will not open large files properly, issue=614, rev=master]
    INPUT

    expected = <<~RESULT
      <a href="https://github.com/neovim/neovim/issues/614">Neovim will not open large files properly</a>
    RESULT

    actual = (Asciidoctor.convert input).tr_s '\n', '\n'
    (expect actual).to include expected.chomp
  end
end
