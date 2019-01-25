dir = File.expand_path(File.dirname(__FILE__)) + '/src/'

require dir + 'Plateau'
require dir + 'Rover'
require dir + 'Commander'
require dir + 'Directions/East'
require dir + 'Directions/West'
require dir + 'Directions/North'
require dir + 'Directions/South'

upper_right = ARGF.gets.split


until ARGF.eof
	input = ARGF.gets.split
	position = { axis_x: input[0], axis_y: input[1] }
	direction_key = input[2]

	plateau = Plateau.new(upper_right[0], upper_right[1])
	rover = Rover.new(position,direction_key,plateau)

  	Commander.new(rover).handle_commands(ARGF.gets)

 	puts rover
end





