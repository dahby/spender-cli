# This file is part of Spender.

# Spender is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# Spender is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with Spender.  If not, see <https://www.gnu.org/licenses/>.

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
    if !location.category
      print "Spending Category: "
      entered_category = STDIN.gets.chomp.downcase
      location.update(category: entered_category)
      location.reload
    end
    print "Price: "
    entered_price = STDIN.gets.chomp.to_f
    puts "Did you make this purchase today?"
    print "y/n?: "
    purchased_today = STDIN.gets.chomp.downcase
    if purchased_today == 'y'
      new_transaction = Transaction.new(user: @current_user, location: location, price: entered_price, purchase_date: Time.now)
    else
      puts
      print "When did you make this purchase? (mm/dd/yyyy): "
      date_input = STDIN.gets.chomp.split('/')
      date_purchased = Time.new(date_input[2], date_input[0], date_input[1])
      new_transaction = Transaction.new(user: @current_user, location: location, price: entered_price, purchase_date: date_purchased)
    end
    puts
    puts "Is this transaction correct?"
    puts "#{new_transaction.location.name} - #{new_transaction.price}"
    puts
    puts "Press 1 if correct, press 2 to modify, press 9 to exit"
    selection = STDIN.gets.chomp.to_i
    if selection == 1
      binding.pry
      new_transaction.save
      @current_user.reload
    elsif selection == 2
      return log_new_transaction
    elsif selection == 9
      return
    end
  end

  def show_transactions
    clear
    puts "RECENT TRANSACTIONS MENU"
    puts
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
      sleep(1)
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
      modify_transaction_menu(transaction)
    elsif selection == 2
      delete_transaction(transaction)
    elsif selection == 3
      show_transactions
    elsif selection == 0
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
    puts "0 - Back to main menu"
    puts 
  end

  def print_modify_transaction_menu(transaction)
    clear
    puts "MODIFY TRANSACTION MENU"
    puts 
    puts "1 - Location: #{transaction.location.name}"
    puts "2 - Price:    $#{transaction.price}"
    puts "3 - Purchase Date: #{transaction.purchase_date.month}/#{transaction.purchase_date.day}/#{transaction.purchase_date.year}"
    puts "4 - Back to recent transactions"
    puts "0 - Back to main menu"
    puts
    puts "What would you like to change?"
  end


  def modify_transaction_menu(transaction)
    print_modify_transaction_menu(transaction)
    selection = STDIN.gets.chomp.to_i
    if selection == 1
      # TODO update location
    elsif selection == 2
      update_transaction_price(transaction)
    elsif selection == 3
      update_purchase_date(transaction)
    elsif selection == 4
      show_transactions
    elsif selection == 0
      return
    else 
      puts "Please enter a valid selection"
      return modify_transaction_menu(transaction)
    end
  end

  def update_transaction_price(transaction)
    puts
    print "Enter an new price: "
    new_price = STDIN.gets.chomp.to_f
    puts 
    puts "Is #{new_price} correct?"
    puts "y/n?"
    selection = STDIN.gets.chomp.downcase
    if selection == 'y'
      transaction.update_price(new_price)
      transaction.reload
      clear
    elsif selection == 'n'
      return modify_transaction_menu(transaction)
    else
      puts "Please enter a valid selection"
      return update_transaction_price(transaction)
    end
  end

  def update_purchase_date(transaction)
    puts
    print "Enter a new date (mm/dd/yyy): "
    date_input = STDIN.gets.chomp.split('/')
    puts 
    print "Is #{date_input[0]}/#{date_input[1]}/#{date_input[2]} the correct date? (y/n): "
    selection = STDIN.gets.chomp.downcase
    if selection == 'y'
      transaction.update_purchase_date(date_input[1].to_i, date_input[0].to_i, date_input[2].to_i)
      transaction.reload
      puts "Purchase date updated!"
      sleep(1)
      clear
    elsif selection == 'n'
      return modify_transaction_menu(transaction)
    else
      puts "Please enter a valid selection"
      return update_purchase_date(transaction)
    end
  end

  def delete_transaction(transaction)
    puts "DELETE TRANSACTION MENU"
    puts
    puts "Are you sure you want to delete this transaction?"
    puts "#{transaction.purchase_date.day}/#{transaction.purchase_date.month} - #{transaction.location.name} - #{transaction.price}"
    puts "y/n?"
    puts
    selection = STDIN.gets.chomp.downcase
    if selection == 'y'
      transaction.destroy
      system('clear')
      return
    else
      system('clear')
      return single_transaction_menu(transaction)
    end
  end
end