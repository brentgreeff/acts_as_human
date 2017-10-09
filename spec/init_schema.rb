CurrentDir = File.expand_path( File.dirname(__FILE__) )

# log_path = File.join(CurrentDir, "debug.log")
# ActiveRecord::Base.logger = Logger.new(log_path)

def load_db_config
  database_yml = File.join(CurrentDir, 'database.yml')
  config = YAML::load( IO.read(database_yml) )
  config['test']
end

ActiveRecord::Base.establish_connection( load_db_config )
load( File.join(CurrentDir, "schema.rb") )
