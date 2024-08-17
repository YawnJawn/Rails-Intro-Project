# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'json'

#Navigate to the file path
# file_path = Rails.root.join('pokemon.json-master/pokedex.json')
# json_data = JSON.parse(File.read(file_path))

# json_data.each do |data|

#     first_type = data['type'][0] || "Unknown"
#     second_type = data['type'][1] || nil

#     Poke.create!(
#         name: data['name']['english'],
#         first_type: first_type,
#         second_type: second_type
#     )
# end

# puts "Table has been populated"


#OR this line to prevent duplicates
# require 'json'

# # Load the JSON file
# file_path = Rails.root.join('db', 'seeds', 'pokemons.json')
# pokemons = JSON.parse(File.read(file_path))

# # Iterate over the data
# pokemons.each do |poke_data|
#   # Check if the record already exists by a unique attribute (e.g., name or id)
#   poke = Poke.find_or_initialize_by(name: poke_data['name']['english'])

#   # Update attributes if necessary (or skip this step if no updates are needed)
#   poke.first_type = poke_data['type'][0]  # Assuming 'type' is an array in the JSON
#   poke.second_type = poke_data['type'][1] if poke_data['type'][1]

#   # Save the record
#   poke.save
# end

# images_path = Rails.root.join('pokemon.json-master/images')
# Poke.find_each do |poke|
#     padded_id = poke.id.to_s.rjust(3, '0')
#     image_file = File.join(images_path, "#{padded_id}.png")

#     if File.exist?(image_file)
#         # Create or find the associated Image record
#         image = poke.image || poke.build_image
    
#         # Attach the image
#         image.image.attach(io: File.open(image_file), filename: "#{padded_id}.jpg")
    
#         # Save the Image record
#         image.save!
    
#         # Save the Poke record if not already saved
#         poke.save! if poke.changed?
        
#         puts "Attached image for #{poke.name}"
#     else
#         puts "No image found for #{poke.name}"
#     end
# end

poke = Poke.find(1)  # Find the Poke record
if poke.image.image.attached?
  puts "Image is attached"
else
  puts "No image attached"
end