# blackjack.rb

def calculate_total(cards)
  arr = cards.map{|e| e[1]}
  
  total = 0
  arr.each do |value|
  	if value == "A"
  	  total += 11
    else
      total += (value.to_i == 0 ? 10 : value.to_i) # for J, Q, K
    end
  end

  #correct for Aces
  arr.select { |e| e == "A"}.count.times do
    total -= 10 if total > 21
  end

  total
end

def display_cards(cards)
  cards.each do |card|
    puts "=> #{(card[0][0])[0]}, #{card[1]}"
  end
end  

def clear_exit
#  sleep 5
#  system 'cls'
  exit
end

puts "Welcome to Blackjack!!!"
puts ""

n = 0
while ![1,2,3,4,5,6].include? n
  puts "How many deck of cards? Enter from 1 - 6:"
  n = gets.chomp.to_i
end

#n = gets.chomp.to_i

#if ![1,2,3,4,5,6].include? n then clear_exit end



suits = []
for i in 1..n do
  suits << "H" + i.to_s
  suits << "D" + i.to_s
  suits << "S" + i.to_s
  suits << "C" + i.to_s
end

cards = ['2','3','4','5','6','7','8','9','10','J','Q','K','A']

deck = suits.product(cards)

deck.shuffle!

# Deal cards
player_cards = []
dealer_cards = []

2.times do
  player_cards << deck.pop
  dealer_cards << deck.pop
end

player_total = calculate_total(player_cards)
dealer_total = calculate_total(dealer_cards)

# Show cards
puts "Player has: #{(player_cards[0][0])[0]}-#{player_cards[0][1]} and #{(player_cards[1][0])[0]}-#{player_cards[1][1]}, for a total of #{player_total}"
puts ""
puts "Dealer has: #{(dealer_cards[0][0])[0]}-#{dealer_cards[0][1]} and #{(dealer_cards[1][0])[0]}-#{dealer_cards[1][1]}, for a total of #{dealer_total}"


if player_total == 21
  puts "Blackjack! You won!"
  clear_exit
end

while player_total < 21
  puts "1 - Hit  2- Stay"
  hit_or_stay = gets.chomp

  if !["1","2"].include? (hit_or_stay)
    puts "Enter 1 or 2 only."
    next
  end

  if hit_or_stay == "2"
    break
  end

  #hit
  new_card = deck.pop
  puts "Dealing new card for Player: #{(new_card[0][0])[0]}-#{new_card[1]}"
  player_cards << new_card
  player_total = calculate_total(player_cards)  

  display_cards(player_cards)
  puts "Total is #{player_total}."
  

  if player_total == 21
    puts "Blackjack! You won!"
    clear_exit
  elsif player_total > 21
  	puts "Busted. You lose."
    clear_exit
  end

end

# Dealer
if dealer_total == 21
  puts "Dealer hit a blackjack. You lose."
  clear_exit
end

while dealer_total < 17
  #hit
  new_card = deck.pop
  puts "Deal new card for Dealer: #{(new_card[0][0])[0]}-#{new_card[1]}"
  dealer_cards << new_card
  dealer_total = calculate_total(dealer_cards)
 
  display_cards(dealer_cards)
  puts "Dealer total is now: #{dealer_total}."

  if dealer_total == 21
    puts "Dealer hit blackjack. You lose."
    clear_exit
  elsif dealer_total > 21
    puts "Dealer busted! You won!"
    clear_exit
  end
end

# Compare 
puts "Player cards:"
display_cards(player_cards)
puts ""

puts "Dealer cards:"
display_cards(dealer_cards)
puts ""

if dealer_total > player_total
  puts "Sorry, dealer won."
elsif dealer_total < player_total
  puts "Player won!"
else
  puts "It's a tie!"
end

clear_exit