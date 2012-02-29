Gem::Specification.new do |s|
  s.name        = 'Prawn Form'
  s.version     = '0.0.2'
  s.summary     = "DSL for filling in PDF forms with Prawn"
  s.description = "Have you ever needed to fill out a PDF form repeatedly in your webapp? This gem is the perfect marriage between Prawn and your stupid old pdf forms."
  s.authors     = ["Mickey Reiss"]
  s.email       = 'mickeyreiss@gmail.com'
  s.files       = ["lib/**/*.rb"]
  s.homepage    = 'https://github.com/mickeyreiss/prawn_form'
  s.add_dependency 'prawn'
end
