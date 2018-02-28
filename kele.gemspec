Gem::Specification.new do |s|
    s.name          = 'kele'
    s.version       = '0.0.1'
    s.date          = '2018-22-02'
    s.summary       = 'Kele API Client'
    s.description   = 'An API client for the Bloc API'
    s.authors       = ['Sami Birnbaum']
    s.email         = 'samibirnbaum1@gmail.com'
    s.files         = ['lib/kele.rb', 'lib/kele/roadmap.rb']
    s.require_paths = ["lib"]
    s.homepage      = 'https://github.com/samibirnbaum/kele'
    s.license       = 'MIT'
    s.add_runtime_dependency 'httparty', '~> 0.13' #other gem my gem relies on
  end