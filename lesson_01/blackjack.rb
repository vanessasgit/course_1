
# Dealer deals 2 cards to player
# Dealer deals 2 cards to dealer

# While player chooses to "hit" or "stay"
#  If the players cards greater than 21, then busted
#  If the players cards = 21 then player wins

# While player "stays" then it's the dealers turn. 
# Check value of cards. If value  < 17, dealer must hit.
  # If the players cards greater than 21, then busted
  # If the players cards = 21 then player wins.

play = "y"

while play =="y"

  def calculate(arr)
    total = 0
    aces = 0
    arr.each do |v|
      if v.first.eql?("Jack") || v.first.eql?("Queen") || v.first.eql?("King")
        total += 10
      elsif v.first == "Ace"
        total += 11
        aces += 1
      else  
      total += v.first
      end
    end

    while aces > 0 && total > 21 
      total -=10
      aces -= 1
    end
    total
  end 



  puts "Welcome! Let's play some blackjack!"
  puts "What is your name?"
  name = gets.chomp
  puts "Let's get started #{name}!"

  suit = ["of clubs", "of diamonds", "of hearts", "of spades"]
  card = [ "Ace", 2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King"]

  deck = card.product(suit)
  deck.shuffle!


  players_cards = []
  dealers_cards = []

  players_cards << deck.pop
  dealers_cards << deck.pop
  players_cards << deck.pop
  dealers_cards << deck.pop

  puts "Here are your cards: #{players_cards[0]} and #{players_cards[1]}"
  player = calculate(players_cards)
  puts "Total: #{player}"
  puts ""

  puts "Here is the dealer's card: #{dealers_cards[1]}"
  dealer = calculate(dealers_cards)
  puts "" 

  if player == 21
    puts "Congrats! You won!"
  end

  puts "1) Hit or 2) Stay"
  choice = gets.chomp

  while !['1', '2'].include?(choice)
  puts "Please try again. You must enter 1 or 2."
  puts "1) Hit or 2) Stay"
  choice = gets.chomp
  end

  while player <= 21 && choice == "1"
    players_cards << deck.pop
    puts "Here are your cards: #{players_cards}"
    player = calculate(players_cards)
    puts "Total: #{player}"
    
    if player > 21
      puts "Bust" 
    elsif player == 21
      puts "You won #{name}"
    else
      puts "1) Hit or 2) Stay"
      choice = gets.chomp

      while !['1', '2'].include?(choice)
        puts "Please try again. You must enter 1 or 2."
        puts "1) Hit or 2) Stay"
        choice = gets.chomp
      end
    end
  end
  
  if choice == "2"
    if dealer == 21
      puts "Here are the dealers cards: #{dealers_cards}"
      dealer = calculate(dealers_cards)
      puts "Sorry, the dealer hit blackjack"
    end

    while dealer < 17
      dealers_cards << deck.pop
      puts "Here are the dealers cards: #{dealers_cards}"
      dealer = calculate(dealers_cards)
      puts "Total: #{dealer}"
    end

    if dealer == 17 && (dealers_cards[0][0] == "Ace" || dealers_cards[0][0] == 6) && (dealers_cards[1][0] == "Ace" || dealers_cards[1][0] == 6)
      dealers_cards << deck.pop
      puts "Here are the dealer's cards: #{dealers_cards}"
      dealer = calculate(dealers_cards)
      puts "Total: #{dealer}"
      puts ""
    end

    if dealer == 21
      puts "Sorry, the dealer hit blackjack"
    elsif dealer > 21 && player < 21
      puts "Here are the dealer's cards: #{dealers_cards}"
      puts "Total: #{dealer}"
      puts "Bust!"
      puts "You won #{name}!"
    elsif dealer > player
      puts puts "Here are the dealer's cards: #{dealers_cards}"
      puts "Total: #{dealer}"
      puts "You Lost :( !"
    elsif dealer == player
      puts "Here are the dealer's cards: #{dealers_cards}"
      puts "Total: #{dealer}"
      puts "Push"
      puts "It's a tie!" 
    else 
      puts "Here are the dealer's cards: #{dealers_cards}"
      puts "Total: #{dealer}"
      puts "You won #{name}!"
    end
  end
   puts "Do you want to play another hand? y/n"
   play = gets.chomp
end


