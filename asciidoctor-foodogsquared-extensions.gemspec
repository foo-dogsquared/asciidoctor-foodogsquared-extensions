Gem::Specification.new do |s|
  s.name          = 'asciidoctor-foodogsquared-extensions'
  s.version       = '1.0.1'
  s.licenses      = ['MIT']
  s.summary       = "foo-dogsquared's custom Asciidoctor extensions"
  s.description   = <<-DESC
    foo-dogsquared's set of Asciidoctor extensions as a Gem. This is where I
    implemented several pet features that will most likely never be a part of
    Asciidoctor.
  DESC

  s.required_ruby_version = '>= 3.0.0'

  s.authors       = ['Gabriel Arazas']
  s.email         = 'foodogsquared@foodogsquared.one'
  s.metadata      = { 'source_code_uri' => 'https://github.com/foo-dogsquared/asciidoctor-foodogsquared-extensions' }

  s.files         = Dir['lib/**/*', '*.gemspec', 'LICENSE', 'CHANGELOG.adoc', 'README.adoc']

  s.add_runtime_dependency 'asciidoctor', '~> 2.0'
  s.add_runtime_dependency 'rugged', '~> 1.0'
end
