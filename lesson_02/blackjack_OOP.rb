
class Card
  attr_accessor :suit, :value
  def initialize(s, v)
    @suit = s
    @value = v
  end

  def to_s
    "#{value} of #{suit}"
  end
end

class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    ['Hearts', 'Diamonds', 'Spades', 'Clubs'].each do |suit|
      [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']. each do |value|
        @cards << Card.new(suit, value) # an array of card objects
      end
    end
  
  scramble!
  end

  def scramble!
    cards.shuffle!
  end

  def deal_one
    cards.pop
  end

  def size
    cards.size
  end
end

module Hand
  def show_hand
    puts "-------#{name}'s Hand-------"
    cards.each do |card|
      puts "=> #{card}"
    end
    puts "=> Total: #{total}"
  end
  
 def total
  total = 0
  aces = 0
  cards.each do |v|
    if v.value.eql?("Jack") || v.value.eql?("Queen") || v.value.eql?("King")
      total += 10
    elsif v.value == "Ace"
      total += 11
      aces += 1
    else  
    total += v.value
    end
  end

  # correct for aces
  while aces > 0 && total > 21 
    total -=10
    aces -= 1
  end
  total
end 


  def add_card(new_card)
    cards << new_card   
  end

  def is_busted?
    total > 21
  end       

end

class Player
  include Hand

  attr_accessor :name, :cards

  def initialize(n)
    @name = n
    @cards = []
  end

  def show_flop
    show_hand
  end

end

class Dealer
  include Hand

  attr_accessor :name, :cards

  def initialize
    @name = "Dealer"
    @cards = []
  end

  def show_flop
    puts "-------#{name}'s Hand-------"
    puts "First card is hidden"
    puts "Second card => #{cards[1]}"
  end

end



class Blackjack
  attr_accessor :player, :dealer, :deck

  BLACKJACK_TOTAL = 21
  DEALER_HIT_NUMBER = 17

  def initialize
    @player = Player.new("Player1")
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def set_name
    if player.name == 'Player1'
      puts "What is your name?"
      player.name = gets.chomp
    end
  end

 def deal_cards
    player.add_card(deck.deal_one)
    dealer.add_card(deck.deal_one)
    player.add_card(deck.deal_one)
    dealer.add_card(deck.deal_one)
  end

  def show_flop
    player.show_flop
    dealer.show_flop
  end

  def blackjack_or_bust?(player_or_dealer)
    if player_or_dealer.total == 21
      puts "#{player_or_dealer.name} won! Game over."
      play_again?
    elsif player_or_dealer.total > 21
      puts "#{player_or_dealer.name} busted!"
      play_again?
    end
  end

  def player_turn
    puts "It's #{player.name}'s turn"
    blackjack_or_bust?(player)
    puts "1) Hit or 2) Stay"
    choice = gets.chomp
    puts ""

    while !['1', '2'].include?(choice)
    puts "Please try again. You must enter 1 or 2."
    puts "1) Hit or 2) Stay"
    choice = gets.chomp
    end

    while !player.is_busted? && choice == "1"
      player.add_card(deck.deal_one)
      show_flop
      blackjack_or_bust?(player)
      puts "1) Hit or 2) Stay"
      choice = gets.chomp
      puts ""

      while !['1', '2'].include?(choice)
        puts "Please try again. You must enter 1 or 2."
        puts "1) Hit or 2) Stay"
        choice = gets.chomp
        puts ""
      end
    end
  end

  def dealer_turn
    puts "It's the dealer's turn"
    puts "Dealer's total is: #{dealer.total}"
    blackjack_or_bust?(dealer)

    while dealer.total < DEALER_HIT_NUMBER
      dealer.add_card(deck.deal_one)
      puts "Dealer's total is: #{dealer.total}"
    end

    if dealer.total == DEALER_HIT_NUMBER && (dealer.cards[0].value == "Ace" || dealer.cards[0].value == 6) && (dealer.cards[1].value == "Ace" || dealer.cards[1].value == 6)
      dealer.add_card(deck.deal_one)
      puts "Dealer's total is: #{dealer.total}"
    end

    blackjack_or_bust?(dealer)
  end

  def who_won?
    if dealer.total > player.total
      dealer.show_hand
      puts "You Lost :( !"
      play_again?
    elsif dealer.total == player.total
      dealer.show_hand
      puts "Push, it's a tie!"
      play_again? 
    else 
      puts "You won #{player.name}!"
      play_again?
    end
  end

  def play_again?  
    puts "Do you want to play another hand? y/n"
    play = gets.chomp
    puts ""
    while !['y', 'n'].include?(play)
      puts "Please try again. You must enter y or n."
      puts "Do you want to play another hand? y/n"
      play = gets.chomp
      puts ""
    end

    if play == 'y'
      puts "Starting new game..."
      puts ""
      deck = Deck.new
      player.cards = []
      dealer.cards = []
      run
    else
      puts "Goodbye!"
      exit
    end
  end
  

  def run
    set_name
    deal_cards
    show_flop
    player_turn
    dealer_turn
    who_won?
  end
end


game = Blackjack.new
game.run