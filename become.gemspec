spec = Gem::Specification.new do |s|
  s.name = 'become'
  s.version = '0.0.1'
  s.summary = 'Become'
  s.homepage = 'http://github.com/cout/become/'
  s.author = 'Paul Brannan'
  s.email = 'curlypaul924@gmail.com'
  s.description = <<-END_DESCRIPTION
Object#become will swap two Ruby objects, similar to Smalltalk's become.
  END_DESCRIPTION

  s.files = [
    'ext/extconf.rb',
    'ext/become.c',
    ]

  s.extra_rdoc_files = 'README.md'
end

