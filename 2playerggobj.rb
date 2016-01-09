class String
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end
  def red
    colorize(31)
  end
  def green
    colorize(32)
  end
  def blue
    colorize(36)
  end
end

class Player
  attr_accessor :name #for both read/write
  attr_accessor :lives
  def initialize(name)
    @name = name
    @lives = 3
  end
  
  def lose_point
    @lives -=1
    puts "Sorry, incorrect!".red
  end
  def gain_point
    @lives +=1
    puts "Correct!".green
  end
end

class Game
  attr_accessor :current_player
  attr_accessor :continue

  def initialize(player1 , player2)
    @player1 = player1 != ""  ? Player.new(player1): Player.new("Player1")
    @player2 = player2 != ""  ? Player.new(player2): Player.new("Player2")
    @current_player = @player1
    @continue = true
  end
  def play
    while @continue do
      puts "Player1 : #{@player1.lives} || Player2 : #{@player2.lives}".blue
      puts "Question for #{@current_player.name}"
      num1 = rand(1..20)
      num2 = rand(1..20)
      puts "What is #{num1} + #{num2}?"
      ans = gets.chomp
      ans.to_i != (num1+num2) ? @current_player.lose_point : @current_player.gain_point
      @continue  = false if @current_player.lives == 0 
      @current_player == @player1 ? @current_player = @player2 : @current_player =  @player1
      puts "#{@current_player.name} Wins!" if !@continue   
    end
  end  
end    

