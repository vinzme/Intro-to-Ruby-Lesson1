# prs.rb

# Paper > Rock; Rock > Scissors; Scissors > Paper

OPTION = { 'P' => 'Paper', 'R' => 'Rock', 'S' => 'Scissors'}
puts "Paper, Rock, Scissors Game!!!"

def winning_message(option)
  case option
  when "P"
    puts "Paper beats Rock!"  
  when "R"
    puts "Rock beats Scissors!"
  when "S"
    puts "Scissors beats Paper!"
  end
end


answer = "Y"

while answer == "Y" do
  
  #Player
  puts "Player -> Choose from : (P, R, S)"
  user_option = gets.chomp.upcase
  
  if !OPTION.keys.include?(user_option)
    next
  end
  
  #Computer
  #.sample used to select randomly from an array
  computer_option = OPTION.keys.sample
  
  case user_option+computer_option 
  when "PR", "RS", "SP"
  	winning_message(user_option)
    puts "Computer picked #{computer_option}! Player won!"
  when "PP", "RR", "SS"
    puts "Computer picked #{computer_option}! It's a tie!"
  else
  	winning_message(computer_option)
    puts "Computer picked #{computer_option}! Computer won!"
  end

  puts "Play again? Y/N"
  answer = gets.chomp.upcase
  
  #clear screen
  if answer == "Y" then system "cls" end

end