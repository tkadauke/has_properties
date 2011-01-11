Gem::Specification.new do |s| 
  s.platform  =   Gem::Platform::RUBY
  s.name      =   "has_properties"
  s.version   =   "0.0.2"
  s.date      =   Date.today.strftime('%Y-%m-%d')
  s.author    =   "Thomas Kadauke"
  s.email     =   "tkadauke@imedo.de"
  s.description = "Makes STI base classes with extensible attributes possible through serialization"
  s.summary   =   "Insert description here"
  s.files     =   Dir.glob("{lib}/**/*")

  s.require_path = "lib"
end
