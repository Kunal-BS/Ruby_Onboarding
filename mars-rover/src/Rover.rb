class Rover

	def initialize(position, direction_key, plateau)
		@position = position
		@direction_key = direction_key
		@plateau = plateau
		@direction = direction
	end

	private 

	def direction
		if @direction_key == "N"
			Directions::North.new
		elsif @direction_key == "S"
			Directions::South.new
		elsif @direction_key == "E"
			Directions::East.new
		elsif @direction_key == "W"
			Directions::West.new
		end
	end

	def turn_left
		@direction = @direction.turn_left
	end

	def turn_right
		@direction = @direction.turn_right
	end

	def move
		return unless in_bounds?
		@position = @direction.move(@position)
	end

	def in_bounds?
		position = @direction.move(@position)
		axis_x = position[:axis_x]
		axis_y = position[:axis_y]

		if axis_x > @plateau.width || axis_x < 0 || axis_y > @plateau.height || axis_y < 0
			return false
		end
		true;		
	end

	def to_s
		"#{@position[:axis_x]} #{@position[:axis_y]} #{@direction}"
	end
end
