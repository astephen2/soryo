Gem::Specification.new do |s|
    s.name =        'soryo'
    s.version =     '0.0.0'
    s.date =        '2015-01-08'
    s.summary =     'A gem that helps build emails'
    s.authors =     ["Alex Stephen"]
    s.license =     'MIT'

    all_files       = `git ls-files -z`.split("\x0")
    s.files         = all_files.grep(%r{^(bin|lib)/})
    s.executables   = all_files.grep(%r{^bin/}) { |f| File.basename(f) }
    s.require_paths = ['lib']
end
