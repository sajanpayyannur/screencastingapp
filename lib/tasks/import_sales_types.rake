desc "This task import all sales types to the database"

task :sales_types_import => :environment do


  f = File.open(Rails.root + "lib/sales.txt")

  results = Hash.new
  current_state = ""
  f.each do |line|  
    if line.split("\t").count > 1
      if results[current_state]
        key = line.split("\t")[1]
        value = line.split("\t")[2].sub(" - ", "").sub("\n", "")
        results[current_state][key] = value
      end
    else
      current_state = line.strip
      results[line.strip] = Hash.new
    end unless line.strip == ""
  end

  sales_types = results
  sales_types.each do |k,v|
    state = State.where("UPPER(name) = ?", k.upcase).first
    v.each do |key, value|
      SaleTitleType.create! :code => key, :description => value, :state_id => state.try(:id)
    end
  end
end


