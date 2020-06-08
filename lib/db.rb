module SharedDb
  def self.client
    @client ||= Mongo::Client.new("mongodb://127.0.0.1:27017/myNewDatabase?connect=direct", monitoring: false)
  end
end