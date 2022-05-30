Update the crud.rb file to turn it into a module, completed file below:

require 'bundler/inline'

gemfile true do
 source 'http://rubygems.org'
 gem 'bcrypt'
end

module Crud
  require 'bcrypt'
  puts "Module CRUD activated"

  def Crud.create_hash_digest(password)
    BCrypt::Password.create(password)
  end

  def Crud.verify_hash_digest(password)
    BCrypt::Password.new(password)
  end

  def Crud.create_secure_users(list_of_users)
    list_of_users.each do |user_record|
      user_record[:password] = create_hash_digest(user_record[:password])
    end
    list_of_users
  end

  def Crud.authenticate_user(username, password, list_of_users)
    list_of_users.each do |user_record|
      if user_record[:username] == username && verify_hash_digest(user_record[:password]) == password
        return user_record
      end
    end
    "Credentials were not correct"
  end
end
In front of all the method names we used a class reference, you can replace this or use self. in their place, that is how you reference class methods. The code in the main.rb file would still work if you use self.create_secure_users for example. This is a good opportunity for you to read up on the difference between "class methods" and "instance methods". We will see how to convert these into instance methods in the next video by using the module as a mixin for our student object.

We then updated the main.rb file (or wherever you want to use the module from):

require_relative 'crud'

users = [
          { username: "mashrur", password: "password1" },
          { username: "jack", password: "password2" },
          { username: "arya", password: "password3" },
          { username: "jonshow", password: "password4" },
          { username: "heisenberg", password: "password5" }
        ]

hashed_users = Crud.create_secure_users(users)
puts hashed_users