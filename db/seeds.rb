# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
ApplicationRecord.transaction do

    # These `destroy_all` commands are not necessary if you use `rails
    # db:seed:replant`
    puts 'Destroying tables...'
   
    Cat.destroy_all
    
    puts 'Resetting id sequences...'

    %w(cats).each do |table_name|
        ApplicationRecord.connection.reset_pk_sequence!(table_name)
    end

    cat_1 = Cat.create!(name: "John", birth_date: "1990-10-11", color: "black", sex: "M", description: "I'm the best!")
    cat_2 = Cat.create!(name: "Rando", birth_date: "1990-02-11", color: "gray", sex: "F", description: "I'm pretty")
    cat_3 = Cat.create!(name: "Martian", birth_date: "1986-06-05", color: "white", sex: "M", description: "I'm ugly")

    puts "Datebase populated"
end
