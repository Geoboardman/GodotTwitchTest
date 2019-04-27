tool
extends Node

	# Custom Node
	# Provides Connection and Signal Interface.

signal message_recieved #user, color, message
signal message_recieved_raw #raw tags

onready var Client = preload("./Helpers/Client.gd").new(self, PRINT_LOG)
onready var Bot = preload("./Helpers/Bot.gd").new(self, Client)

export(bool) var PRINT_LOG = true
export(String) var IRC_HOST = "irc.chat.twitch.tv"
export(int) var IRC_PORT = 6667

export(String) var IRC_CHANNEL = "geoboardman"
export(String) var CLIENT_ID = "zgjwr89f89j5vr0e5v384m2vq49v1e"
export(String) var CLIENT_PASSWORD = "oauth:43lbr7upp5hfznmpfv90mnspjzmzoe"
export(String) var CLIENT_NICK = "geoboardman"
export(String) var CLIENT_REALNAME = ""


func _ready():
	register_bot_commands()


func start():
	Client.connect_to_host(IRC_HOST, IRC_PORT)
	Client.connect_to_channel(IRC_CHANNEL, CLIENT_ID, CLIENT_PASSWORD, CLIENT_NICK, CLIENT_REALNAME)


func stop():
	Client.disconnect()


	# Initializes default Bot commands.
	# Add permantent commands here.
	# args: function, aliases, owner_only
func register_bot_commands():
	Bot.add_command("command_higobotchan", ["Hey Godot", "Hello Godot", "Hi Godot"], false)
	#Bot.remove_command("command_higobotchan")


	# Place custom functions here. Passes raw message dictionary.
func command_higobotchan(raw_message):
	Client.send_message("what the heck")