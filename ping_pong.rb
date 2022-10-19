require 'ruby2d'

set width: 800
set heigth: 600
set title: "Pong Game"
set background: 'blue'


$window_heigth = Window.height
$window_width = Window.width


class Ball < Circle

	def initialize
		@x = $window_width/2
		@y = $window_heigth/2
		@radius = 15
		@color = 'white'
		@sectors = 32

		super(x: @x,y: @y,radius: @radius,color: @color,sectors: @sectors)
	end

end

class Net < Line

	def initialize
		@width = 10
		@x1 = $window_width/2
		@y1 = 0
		@x2 = $window_width/2
		@y2 = $window_heigth
		@color = 'lime'

		super(width: @width,x1: @x1,y1: @y1,x2: @x2,y2: @y2,color: @color)
	end

end


class Paddle < Rectangle

	def initialize(x,y)
		@heigth = 550
		@width = 20
		@color = 'red'
		@x = x
		@y = y

		super(x: @x,y: @y , color: @color , heigth: @heigth , width: @width)
	end

end


right_paddle = Paddle.new($window_width-50, ($window_heigth/2)-20)
left_paddle = Paddle.new(30, ($window_heigth/2)-20)
middle_net = Net.new
ball = Ball.new


on :key do |event|

	case event.key

		when 'up'
			right_paddle.y -= 5
		when 'down'
			right_paddle.y += 5

		when 'w'
			left_paddle.y -= 5
		when 's'
			left_paddle.y += 5

		end
	end

show

