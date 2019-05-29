class CLI
  attr_reader :current_user
  def initialize(current_user=nil)
    @current_user = current_user
  end

  def run
    puts "WELCOME TO SPENDER!"
    puts
    welcome_menu
  end

  def welcome_menu
    puts "Please make a selection:"
    puts "1 - Login"
    puts "2 - About Spender"
    puts
    selection = STDIN.gets.chomp.to_i
    if selection != 1 && selection != 2
      puts "Please input a valid selection"
      welcome_menu
    elsif selection == 1
      puts 'LOGIN MENU'
    elsif selection == 2
      puts 'ABOUT MENU'
    end
  end
end