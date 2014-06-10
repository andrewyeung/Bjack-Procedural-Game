
cards = ["A", 2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K"]

# Define method
def calculate_total(card)
marks = 0
	card.each do |cardd|
		if cardd == "A" 
		   marks = marks + 11
	    elsif cardd == "J" 
		   marks = marks +10
	    elsif cardd == "Q" 
		   marks = marks + 10
	    elsif cardd == "K" 
		   marks = marks + 10
	    else 
		   marks = marks + cardd.to_i
        end
    end
    if (marks > 21) && (card.include?("A"))
    	card.each do |cardd|
    		if cardd == "A"
    			marks = marks - 10
    		end
    	end
    end
marks
end

# Say Hello
puts "Hello, player! What is your name?"
player_name = gets.chomp.capitalize

# Shuffle the card
player_card = []
dealer_card = []
player_card << cards.shuffle.last
player_card << cards.shuffle.last
dealer_card << cards.shuffle.last
dealer_card << cards.shuffle.last

# Deal the card
puts "#{player_name}! Your cards are #{player_card[0]} and #{player_card[1]}"
puts "The dealer's cards are #{dealer_card[0]} and #{dealer_card[1]}"

# First Calculate
dealertotal = calculate_total(dealer_card) 
mytotal = calculate_total(player_card) 
if mytotal == 21
	puts "You WIN! Wow, you hit the blackjack with LUCK!"
end

# First Hit
while mytotal != 21
	puts "* * * * * * *"
	puts "Whast's your next move? 1) Hit or 2) Stay?"
    select_then = gets.chomp
    if select_then == "2"
    	break
    end
	player_card << cards.shuffle.last
	puts "Your cards are #{player_card[0]} and #{player_card[1]} and #{player_card[2]} and #{player_card[3]} and #{player_card[4]}!"
	# Calculate
	mytotal = calculate_total(player_card) 
    if mytotal == 21
    	puts "Congrats! You Win!"
    	break
    elsif mytotal > 21
    	puts "Your cards are more than 21, You are busted!"
    	break
    end
end

# Stay
if mytotal < 21
	puts "_ _ _ _ _ _ _ _"
	puts "It's the dealer's turn."
	while dealertotal < 17 
		dealer_card << cards.shuffle.last
		puts "Dealer's cards are #{dealer_card[0]} and #{dealer_card[1]} and #{dealer_card[2]} and #{dealer_card[3]} and #{dealer_card[4]}!"
	end
	# Hit or Stay
	random_num = rand(1..2)
	# Dealer's Hit
	while random_num == 1
		puts "Dealer continues to hit."
		dealer_card << cards.shuffle.last
		puts "Dealer's cards are #{dealer_card[0]} and #{dealer_card[1]} and #{dealer_card[2]} and #{dealer_card[3]} and #{dealer_card[4]} and #{dealer_card[5]}!"
		if dealertotal == 21
			puts "The dealer wins! You lose!"
			break
		elsif dealertotal > 21
			puts "The delaer loses! You win!"
			break
		end
		random_num = rand(1..2)
	end

	# Compare Hands
	if random_num == 2
		puts "Dealer decides to stay, let's check"
    	if mytotal > dealertotal
    		puts "#{player_name}, yours are larger than the dealer's, you win!"
   		elsif dealertotal >= mytotal
    		puts "#{player_name}, sorry, you lose!"
    	end
	end
end
puts "This is the end of the game, thank you, #{player_name}!"