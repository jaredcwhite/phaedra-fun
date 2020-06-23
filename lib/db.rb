require "mongo"
require "bcrypt"

require_relative "./models"

module SharedDb
  def self.mongoid_init
    unless @previously_init
      Mongo::Logger.logger = Logger.new(STDERR).tap do |logger|
        logger.level = Logger::WARN
      end
      
      Mongoid.configure do |config|
        config.clients.default = {
          hosts: ['SG-testmong-35166.servers.mongodirector.com:27017'],
          database: 'phaedrafun',
          options: {
            user: ENV["MONGO_USER"].split(":")[0],
            password: ENV["MONGO_USER"].split(":")[1],
            ssl: true,
            ssl_ca_cert: "mongo.crt"
          }
        }
        config.log_level = :warn
      end
      @previously_init = true
    end
  end
  def self.custom_client
#    azure_options = { monitoring: false, ssl: true, ssl_verify: true }
#    azure_dbconn = "mongodb+srv://#{ENV["MONGO_USER"]}@phaedratest-lrcac.azure.mongodb.net/phaedrafun"
    sg_options = { monitoring: false, ssl: true, ssl_verify: true, ssl_ca_cert: "mongo.crt" }
    sg_dbconn = "mongodb://#{ENV["MONGO_USER"]}@SG-testmong-35166.servers.mongodirector.com:27017/phaedrafun?ssl=true"
    @client ||= Mongo::Client.new(sg_dbconn, sg_options)
  end
end

SharedDb.mongoid_init
