Pod::Spec.new do |s|
  s.name     = 'Poseidon'
  s.version  = '0.0.1'
  s.license  = 'MIT'
  s.summary  = 'A navigation framework on Swift.'
  s.homepage = 'https://github.com/OrWest/Poseidon/'
  s.authors  = { 'Alex Motarykin' => 'orwester@gmail.com' }
  s.source   = { :git => 'https://github.com/OrWest/Poseidon.git', :tag => s.version }
  s.ios.deployment_target = '8.0'  
  s.source_files = 'src/*.swift'

end