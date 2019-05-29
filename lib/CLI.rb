class CLI
  attr_reader :current_user
  def initialize(current_user=nil)
    @current_user = current_user
  end

  def run
    system("clear")
    puts "WELCOME TO SPENDER!"
    puts
    welcome_menu
  end

  def welcome_menu
    is_running = true
    while is_running
      print_welcome
      binding.pry
      selection = STDIN.gets.chomp.to_i
      if selection == 1
        login_menu
      elsif selection == 2
        system("clear")
        sign_up_menu
        # TODO: build out sign-up menu
      elsif selection == 3
        # TODO: build out about section
      elsif selection == 9
        puts "THANK YOU!!!"
        puts
        is_running = false
      else
        puts "Please input a valid selection"
      end
    end
  end

  def print_welcome
    puts "Please make a selection:"
    puts "1 - Login"
    puts "2 - Sign Up"
    puts "3 - About Spender"
    puts "9 - Exit Application"
    puts
    print "Your Selection: " 
  end

  def login_menu
    system("clear")
    puts "LOGIN MENU"
    puts
    print "Username: "
    username = STDIN.gets.chomp
    current_user = User.find_by(username: username)
    if current_user
      print "Enter your PIN: "
      pin = STDIN.gets.chomp.to_i
      if current_user.pin == pin
        @current_user = current_user
      else
        puts "ERROR: Invalid Pin"
        login_menu
      end
    else
      puts "No Such User"
    end
  end

  def sign_up_menu
    puts "SIGN UP MENU"
    puts
    print "Enter a Username: "
    username = STDIN.gets.chomp
    current_user = User.find_by(username: username)
    if current_user
      puts "Username already exists, pick again."
      return sign_up_menu
    end
    puts "Choose a PIN: "
    pin = STDIN.gets.chomp.to_i
    user = User.create(username: username, pin: pin)
    @current_user = user
  end

  def set_current_user(user)
    @current_user = user
  end
end