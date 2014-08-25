# tictactoe.rb

def initialize_board
  b = {}
  (1..9).each { |position| b[position] = ' '}
  b
end

def draw_board(b)
  system 'cls'
  puts " #{b[1]} | #{b[2]} | #{b[3]} "
  puts "-----------"
  puts " #{b[4]} | #{b[5]} | #{b[6]} "
  puts "-----------"
  puts " #{b[7]} | #{b[8]} | #{b[9]} "
end

def empty_position(b)
  b.select { |k,v| v == ' '}.keys
end

def player_picks(b)
  begin  
    puts "Pick a square (1 - 9) :"
    position = gets.chomp.to_i
    if position.to_i == 0
      puts "Empty. Select again."
      next
    elsif b[position] != ' '
      puts "Occupied square. Select again."
      next
    end
  end until empty_position(b).include?(position) 
  b[position] = 'X'
  position
end

def computer_picks(b)
  position = empty_position(b).sample
  b[position] = 'O'
  position
end

loop do 
  board = initialize_board
  draw_board(board)
  winning_string = " 123 456 789 147 258 369 159 357 "
  pos = 0
  begin
    pos = player_picks(board)
    while winning_string.include? pos.to_s
      winning_string = winning_string[0,winning_string.index(pos.to_s)] + 'X' + winning_string[winning_string.index(pos.to_s)+1,winning_string.length-(winning_string.index(pos.to_s)+1)]
    end

    pos = computer_picks(board)
    while (winning_string.include? pos.to_s) && (pos != nil)
      winning_string = winning_string[0,winning_string.index(pos.to_s)] + 'O' + winning_string[winning_string.index(pos.to_s)+1,winning_string.length-(winning_string.index(pos.to_s)+1)]
    end

    draw_board(board)
   
  end until (winning_string.include? 'XXX') || (winning_string.include? 'OOO') || empty_position(board) == []

  #check winner
  if winning_string.include? 'XXX'
    puts "Player Won!"
  elsif 
    if winning_string.include? 'OOO'
      puts "Computer Won!"
    else
      puts "No winner!"
    end
  end

  puts "Do you want to play again?[y/n]"
  answer = gets.chomp.downcase
  break if answer != 'y'  
    
end