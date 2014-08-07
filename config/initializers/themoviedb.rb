THEMOVIEDB_CONFIG = YAML.load_file("#{::Rails.root}/config/themoviedb.yml")[::Rails.env]
