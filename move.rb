class Move

	attr_reader :col, :row
	attr_accessor :parent, :child
	
	def initialize(col, row, parent = nil, child = nil)
		@col = col
		@row = row
		@parent = parent
		@child = child
	end

	def printPosition
		case @col
			when 1
				puts "a#{row}"
			when 2
				puts "b#{row}"
			when 3
				puts "c#{row}"
			when 4
				puts "d#{row}"
			when 5
				puts "e#{row}"		
			when 6
				puts "f#{row}"
			when 7
				puts "g#{row}"
			when 8
				puts "h#{row}"
			end
	end

end