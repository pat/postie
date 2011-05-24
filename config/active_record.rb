config = YAML.load(File.read('config/database.yml'))
ActiveRecord::Base.establish_connection(
  config[Sinatra::Application.environment.to_s]
)
