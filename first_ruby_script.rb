# These first 8 lines complete the first 2 base assignments for day one:
#puts "-- Contact List --"
#puts "Enter first name"
#first_name = gets.chomp
#puts "Enter last name"
#last_name = gets
#print "-- Contact List-- \n #{first_name} #{last_name}"


# These next lines complete the 3 & 4 base assignment task for day one:
name = Array.new() #{ Hash.new }


# Set up code to get variables

#puts "-- Contact List --"
#puts "Enter first name"
#name << gets.chomp
#puts "Enter last name"
#name << gets.chomp
#print "-- Contact List -- \n #{name}\n"

# Bonus objectives:
puts "Press Enter"
user_input = gets.chomp
while user_input != 'quit'
  puts """-- Contact List Menu --
  1) All Contacts
  2) Create Contact
  3) Delete Contact
  4) Edit Contact
  5) Choose Contact"""
  user_input = gets.chomp

  case user_input
  when "1"
    print "-- Contact List --\n"
    print name.join("  \n") + "\n"

  when "2"
    puts "What is the contact name?"
    name1 = gets.chomp
    print "Contact with name #{name1} added.\n"
    name << name1

  when "3"
    puts "Which contact would you like to delete?"
    name2 = gets.chomp
    print "Contact with name #{name2} deleted.\n"
    name.delete(name2)

  when "4"
    puts "Which contact would you like to edit?"
    name3 = gets.chomp
    puts "What is the new contact name to be entered?"
    name4 = gets.chomp
    print "#{name3} replaced with #{name4}\n"
    name.delete(name3)
    name << name4

  when "5"
    puts "Which number contact would you like to view?"
    name5 = gets.chomp.to_i
    print name.at(name5 - 1)

  when "quit"
    break

  else
    puts "Invalid entry! Try again."
  end
end
