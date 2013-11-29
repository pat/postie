config = YAML.load(ERB.new(File.read('config/database.yml')).result)
ActiveRecord::Base.establish_connection(
  config[Sinatra::Application.environment.to_s]
)
