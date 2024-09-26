# create a new Class, User, that has the following attributes:
# - name
# - email
# - password
class User
    attr_accessor :name, :email, :password
  
    def initialize(name, email, password)
      @name = name
      @email = email
      @password = password
    end
  
    def introduce
      puts "Hello, my name is #{@name}\nEmail: #{@email}\nPassword: #{@password}"
    end
  
    def enter_room(room)
      room.add_user(self)
    end
  
    def send_message(room, content)
      message = Message.new(self, room, content)
      room.broadcast(message)
    end
  end

# create a new Class, Room, that has the following attributes:
# - name
# - description
# - users
class Room
    attr_accessor :name, :description, :users
  
    def initialize(name, description)
      @name = name
      @description = description
      @users = []
    end
  
    def add_user(user)
      @users << user unless @users.include?(user)
      puts "#{user.name} has entered the room #{@name}."
    end
  
    def broadcast(message)
      @users.each do |user|
        puts "#{user.name} received message: #{message.content} from #{message.user.name} in room #{@name}."
      end
    end
  end
# create a new Class, Message, that has the following attributes:
# - user
# - room
# - content
class Message
    attr_accessor :user, :room, :content
  
    def initialize(user, room, content)
      @user = user
      @room = room
      @content = content
    end
  end
# add a method to user so, user can enter to a room
user1 = User.new("Alice", "alice@email.com", "1234")
user2 = User.new("Bob", "bob@email.com", "5678")

room = Room.new("Chat Room", "This is a chat room.")

user1.enter_room(room)
user2.enter_room(room)
# add a method to user so, user can send a message to a room
user1.send_message(room, "Hello, everyone!")
# user.ackowledge_message(room, message)

# add a method to a room, so it can broadcast a message to all users
user2.send_message(room, "Hi Alice!")