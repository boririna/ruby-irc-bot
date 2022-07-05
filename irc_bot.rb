# customize the name of your bot on the following line
@name = "irina-bot"

def parse_message(message)
  m = message.chomp.split(":")
  @name = m[1].split("!")[0]
  @frase = m[-1]
end

def send_message(message)
  irc_send("PRIVMSG #{@channel} :#{message}")
end

# This method gets called, whenever a message is sent to our IRC channel. In it you can react to
# the users' inputs in whatever way you like...
def handle_channel_message(message)
  # Implement your ideas here.
  # The string in `message` will look something like this:
  # ":nerdinand!b2c5e1f5@gateway/web/freenode/ip.178.197.225.245 PRIVMSG #rubymonstas :Look at me, I'm here!"
  # :web-34!~web-34@freenode-gk5.bd8.2v7g5b.IP PRIVMSG #rubymonstas :hi
  frase = parse_message(message)

  if frase == 'hi'
    send_message("hey!")
  elsif frase == 'how are you?'
    send_message("awesome, and you #{@name}?")
  elsif frase == "i'm good"
    send_message("i'm glad")
  else
    send_message("Huh?")
  end

  # You can use the method `irc_send` to send strings to the IRC server, e.g.
  # irc_send("PRIVMSG #rubymonstas :Hi everyone!")
end

require_relative './irc_magic.rb'
