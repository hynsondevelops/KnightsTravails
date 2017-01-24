require_relative "move"

class Board
	def initialize(start)
		createBoard(start[0], start[1])
	end

	def createBoard(col, row)
		@board = Array.new
		for i in 0..8
			@board[i] = Array.new
			for j in 0..8
				if (i == col && j == row)
					@start = Move.new(i, j)
					@board[i][j] = @start
				else
					@board[i][j] = Move.new(i, j)
				end
			end
		end


	end

	def knight_moves(start, finish)
		BFS(4, 5)

	end

	def checkLegal(col, row)
		if ((col > 8 || col < 1) || (row > 8 || row < 1))
			return false
		end
		return true
	end

	def findMoves(move)
		puts "Finding moves for Row: #{move.row}, Col: #{move.col}"
		up2 = move.row + 2
		up1 = move.row + 1
		down2 = move.row - 2
		down1 = move.row - 1
		left2 = move.col - 2
		left1 = move.col - 1
		right2 = move.col + 2
		right1 = move.col + 1
		if (checkLegal(left1, up2) )
			move.up2Left1 = Move.new(left1, up2)
			move.up2Left1.down2Right1 = move
			puts "Row: #{move.up2Left1.down2Right1.row}, Col: #{move.up2Left1.down2Right1.col}"
			findMoves(move.up2Left1)
		elsif (checkLegal(up2, right1))
			move.up2Right1 = Move.new(right1, up2)
			move.up2Left1.down2Left1 = move
			puts "Row: #{up2}, Col: #{left1}"
			findMoves(move.up2Right1)
		elsif (checkLegal(up1, left2))
			move.up1Left2 = Move.new(left2, up1)
			move.up1Left2.down1Right2 = move
			puts "Row: #{up2}, Col: #{left1}"
			findMoves(move.up2Left1)
		elsif (checkLegal(up1, right2))
			move.up2Left1 = Move.new(left1, up2)
			move.up2Left1.down2Right1 = move
			puts "Row: #{up2}, Col: #{left1}"
			findMoves(move.up2Left1)
		elsif (checkLegal(down2, left1))
			move.up2Left1 = Move.new(left1, up2)
			move.up2Left1.down2Right1 = move

			puts "Row: #{up2}, Col: #{left1}"
			findMoves(move.up2Left1)
		elsif (checkLegal(down2, right1))

		elsif (checkLegal(down1, left2))

		elsif (checkLegal(down1, right2))

		end
	end

	def BFS(col, row)
		allMoves = Array.new
		queue = Array.new
		queue.push(@start)
		set = Array.new
		set.push(@start)
		fastestPath = Array.new	
		while (queue.size != 0)
			for j in 0...queue.size
				puts "Row : #{queue[j].row}, Col: #{queue[j].col}"
			end
			for j in 0...set.size
				puts "Row : #{set[j].row}, Col: #{set[j].col}"
				#puts set[j]
			end
			move = queue[0]
			if (move.col == col && move.row == row)
				puts "Found fastest path\n"
				fastestPath = Array.new	
				while (move.parent != nil)
					fastestPath.push(move)
					puts "Row : #{move.row}, Col: #{move.col}"
					move = move.parent
				end
				fastestPath.push(@start)
				return fastestPath.reverse
			end
			queue = queue[1..queue.size]
			puts "Finding moves for Row: #{move.row}, Col: #{move.col}"
			up2 = move.row + 2
			up1 = move.row + 1
			down2 = move.row - 2
			down1 = move.row - 1
			left2 = move.col - 2
			left1 = move.col - 1
			right2 = move.col + 2
			right1 = move.col + 1
			if (checkLegal(left1, up2))
				newMove = @board[left1][up2]
				puts "\n#{newMove}\n"
				if (!set.include?(newMove))
					newMove.parent = move
					set.push(newMove)
					queue.push(newMove)
				end
			end
			if (checkLegal(right1, up2))
				newMove = @board[right1][up2]
				if (!set.include?(newMove))
					newMove.parent = move
					set.push(newMove)
					queue.push(newMove)
				end
			end
			if (checkLegal(left2, up1))
				newMove = @board[left2][up1]
				if (!set.include?(newMove))
					newMove.parent = move
					set.push(newMove)
					queue.push(newMove)
				end
			end
			if (checkLegal(right2, up1))
				newMove = @board[right2][up1]
				if (!set.include?(newMove))
					newMove.parent = move
					set.push(newMove)
					queue.push(newMove)
				end
			end
			if (checkLegal(left1, down2))
				newMove = @board[left1][down2]
				if (!set.include?(newMove))
					newMove.parent = move
					set.push(newMove)
					queue.push(newMove)
				end
			end
			if (checkLegal(right1, down2))
				newMove = @board[right1][down2]
				if (!set.include?(newMove))
					newMove.parent = move
					set.push(newMove)
					queue.push(newMove)
				end
			end
			if (checkLegal(left2, down1))
				newMove = @board[left2][down1]
				if (!set.include?(newMove))
					newMove.parent = move
					set.push(newMove)
					queue.push(newMove)
				end
			end
			if (checkLegal(right2, down1))
				newMove = @board[right2][down1]
				if (!set.include?(newMove))
					newMove.parent = move
					set.push(newMove)
					queue.push(newMove)				
				end
			end
		end
		return nil

	end

end

a = Board.new([3, 4])
path = a.BFS(4, 5)

for i in 0...path.size
	puts "Row: #{path[i].row}, Col: #{path[i].col}"
end

 b = Board.new([7, 7])
 path = b.BFS(3, 3)

 for i in 0...path.size
	puts "Row: #{path[i].row}, Col: #{path[i].col}"
end

 b = Board.new([3, 3])
 path = b.BFS(3, 4)

puts "Print PATH!"
 for i in 0...path.size
	path[i].printPosition
end

