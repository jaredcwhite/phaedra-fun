ENV["MONGO_USER"] = "usephaedra:Oxygene7137lette"
require "./lib/db"

#client = SharedDb.client

#puts client.collections.map(&:name)

#Post.create(title: "I'm a title", body: "This is great!")

p Post.all.to_a

#User.create_with_password("jared", "abc123")

p User.find_login("jared", "abc123")

def get(params)
  user = User.find_login(params[:email].downcase, params[:password])
  user_hash = user&.attributes
  user_hash.delete("password") if user_hash

  {
    user: user_hash,
    verified: user.present?
  }
end

p get(email: "jared", password: "abc123").to_json