require './2playerggobj'

puts "Welcome to 2 player guessing game"
start_game  = true
while start_game
puts "Please enter Player1's name"
player1 = gets.chomp.strip
puts "Please enter Player2's name"
player2 = gets.chomp.strip
new_game = Game.new(player1,player2)
new_game.play
  puts "Would you like to play a new game? (Y/N), invalid input will assume 'N'"
  choice  = gets.chomp
  if choice.upcase != "Y"
    start_game = false
    puts "Thank you for Playing!"
  end  
end 


