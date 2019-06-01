class CLI
  attr_reader :current_user
  def initialize(current_user=nil)
    @current_user = current_user
  end

  def run
    clear
    user_check
    puts "~~SPENDER!~~"
    puts "Welcome #{@current_user.username}"
    puts
    main_menu
  end

  def clear
    system('clear')
  end

  def main_menu
    is_running = true
    while is_running
      print_main_menu
      selection = STDIN.gets.chomp.to_i
      if selection == 1
        log_new_transaction
      elsif selection == 2
        show_transactions
      elsif selection == 3
        display_about
      elsif selection == 9
        puts "THANK YOU!!!"
        puts
        is_running = false
      else
        puts "Please input a valid selection"
      end
    end
  end

  def user_check
    if User.all.length == 0
      first_use
    else
      set_current_user(User.first)
    end
  end

  def print_main_menu
    puts "MAIN MENU"
    puts
    puts "Please make a selection:"
    puts "1 - Log a new transaction"
    puts "2 - Show transactions"
    puts "3 - About Spender"
    puts "9 - Exit Application"
    puts
    print "Your Selection: " 
  end

  def first_use
    puts "It looks like this is your first time using this app."
    puts "Thank you for giving Spender a spin!"
    puts
    print "To start off, please enter your name: "
    name = STDIN.gets.chomp
    user = User.create(username: name)
    set_current_user(user)
  end

  def set_current_user(user)
    @current_user = user
  end

  def display_about
    puts
    puts "Spender is a simple transaction tracking tool designed for simple budgeting.".center(100)
    puts "Give it a spin!".center(100)
    puts
  end

  def log_new_transaction
    clear
    puts "LOG NEW TRANSACTION"
    print "Location: "
    entered_location = STDIN.gets.chomp
    location = Location.find_or_create_by(name: entered_location)
    print "Price: "
    entered_price = STDIN.gets.chomp.to_f
    new_transaction = Transaction.new(user: @current_user, location: location, price: entered_price)
    puts
    puts "Is this transaction correct?"
    puts "#{new_transaction.location.name} - #{new_transaction.price}"
    puts
    puts "Press 1 if correct, press 2 to modify, press 9 to exit"
    selection = STDIN.gets.chomp.to_i
    if selection == 1
      new_transaction.save
      @current_user.reload
    elsif selection == 2
      return log_new_transaction
    elsif selection == 9
      return
    end
  end

  def show_transactions
    # clear
    @current_user.display_transactions
    puts
    select_transaction
  end

  def select_transaction
    puts "Select a transaction, or press 0 to return main menu"
    selection = STDIN.gets.chomp.to_i
    if selection == 0
      clear
      return
    end
    if selection > @current_user.display_transactions.length
      puts
      puts "Please enter a valid selection"
      return show_transactions
    end
    transaction = @current_user.select_transaction(selection)
    clear
    single_transaction_menu(transaction)
  end

  def single_transaction_menu(transaction)
    print_single_transaction_menu
    selection = STDIN.gets.chomp.to_i
    if selection == 1
      modify_transaction(transaction)
    elsif selection == 2
      delete_transaction(transaction)
    elsif selection == 3
      show_transactions
    elsif selection == 4
      return
    else 
      puts "Please enter a valid selection"
      return single_transaction_menu(transaction)
    end
  end

  def print_single_transaction_menu
    puts "SINGLE TRANSACTION MENU"
    puts
    puts "What would you like to do?"
    puts "1 - Modify transaction"
    puts "2 - Delete transaction"
    puts "3 - Back to recent transaction"
    puts "4 - Back to main menu"
    puts 
  end

  def modify_transaction(transaction)
    puts "MODIFY TRANSACTION MENU"
  end

  def delete_transaction(transaction)
    puts "DELETE TRANSACTION MENU"
  end
end