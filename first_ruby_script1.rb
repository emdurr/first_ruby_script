# Contact List
@x = true
@name = Array.new()
def main_menu
  puts "--- Contact Menu ---\n1.) View All Contacts\n2.) Create Contact\n3.) Delete Contact\n4.) Edit Contact\n5.) Search\n6.) Exit"
  puts "-- Make a selection --"
  input = gets.strip.to_i
  if input == 6
    @x = false
  elsif input == 1
    view_all
  elsif input == 2
    create_contact
  elsif input == 3
    delete_contact
  elsif input == 4
    edit_contact
  elsif input == 5
    search
  else
    puts "** Invalid Menu Selection **"
  end
end

def view_all
  counter = 1
  puts "-- Contacts --"
  @name.each do |contacts|
    puts "#{counter}) #{contacts}\n"
    counter += 1
  end
  main_menu
end

def create_contact
  puts "Enter contact name:"
  input = gets.strip.upcase
  @name << input
  puts "Would you like to add another contact? y/n"
  user_input = gets.strip.downcase
  if user_input == 'y'
    create_contact
  else
    main_menu
  end
end

def delete_contact
  counter = 1
  puts "-- Contacts --"
  @name.each do |contacts|
    puts "#{counter}) #{contacts}\n"
    counter +=1
  end
  puts "Which contact would you like to delete?"
  puts "Enter 0 to return to the Main Menu"
  input = gets.strip.to_i

  case input
    when 1..counter - 1
      num = input - 1
      @name.delete_at(num)
    when 0
      main_menu
    else
      puts "** Invalid Menu Selection **"
      delete_contact
  end
end

def edit_contact
  counter = 1
  puts "-- Contacts --"
  @name.each do |contacts|
    puts "#{counter}) #{contacts}\n"
    counter +=1
  end
  name2 = Array.new()
  puts "Which contact would you like to edit?"
  puts "Enter 0 to return to the Main Menu"
  input = gets.strip.to_i
  puts "What would you like to enter instead?"
  name1 = gets.strip.upcase
  name2 << name1
  case input
    when 1..counter - 1
      num = @name[input - 1]
      @name.map!{ |x| x == num ? name2 : x }.flatten!
    when 0
      main_menu
    else
      puts "** Invalid Menu Selection **"
      edit_contact
  end
end

def search
  # Search doesn't recognize lower case version of contact name
  puts "What contact would you like to search for?"
  puts "Enter back to return to the Main Menu\n\n"
  @name1 = gets.strip.upcase

  case @name1
  when "BACK"
      main_menu
    else
      if @name.include? @name1
        puts "Name found\n\n"
        search_again
      else
        puts "Name not found\n\n"
        add_name_not_found
      end
  end
end

def add_name_not_found
  puts "Would you like to add this name? y/n"
  input = gets.strip
  input.downcase
  if input == 'y'
    @name << @name1
    puts "\n"
    search_again
  else
    main_menu
  end
end

def search_again
  puts "Would you like to search for another name? y/n"
  input = gets.strip
  input.downcase
  if input == 'y'
    puts "\n"
    search
  else
    main_menu
  end
end

while @x == true
  main_menu
end
