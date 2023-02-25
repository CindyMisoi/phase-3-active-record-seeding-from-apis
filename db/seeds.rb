puts "Seeding spells... "

# spells we'll add to the database
spells = ["acid-arrow", "animal-messenger", "calm-emotions", "charm-person"]

# iterate over each spell
spells.each do |spell|
    # request to the apis
    response = RestClient.get "https://www.dnd5eapi.co/api/spells/#{spell}"
    # response will come back as a json formatted string
    # parse it to Ruby hash
    spell_hash = JSON.parse(response)

    # create database using data from this hash
    Spell.create(
        name: spell_hash["name"],
        level: spell_hash["level"],
        # spell_hash["desc"] returns an array, so we need to access the first index to get just a string of the description
        description: spell_hash["desc"][0]
    )
end

puts "Done seeding!"