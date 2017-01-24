

CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|
    puts row.inspect
end


CSV.foreach("accounts.csv", {headers: true, return_headers: false}) do |row|
    puts row["Account"]
end