namespace :pokemons do
  desc "Load Pokemons from our CSV file to the database."
  task transactions: :environment do
    require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "pokemon.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      hash = row.to_hash
      Pokemon.create(name: hash["Name"], type1: hash["Type 1"], type2: hash["Type 2"], total: hash["Total"], hp: hash["HP"], attack: hash["Attack"], defense: hash["Defense"], sp_atk: hash["Sp. Atk"], sp_def: hash["Sp. Def"],speed: hash["Speed"], generation: hash["Generation"], legendary: hash["Legendary"])
    end
  end

end
