require 'csv'
#customers = CSV.read("books2016.csv")

all = Array.new
fiction = Array.new
nonFiction = Array.new
technical = Array.new

CSV.open("fiction.csv", "wb", :row_sep => :auto) do |fictionCSV|
    CSV.open("non-fiction.csv", "wb", :row_sep => :auto) do |nonFictionCSV|
        CSV.open("technical.csv", "wb", :row_sep => :auto) do |technicalCSV|
            CSV.foreach("books2016.csv", { :headers => false }) do |row|
                
                if row[0].to_f == 0
                    puts "0 rating"
                else
                    ratingDifference = row[0].to_f - row[1].to_f
                    rowToWrite = [ $. , ratingDifference]
                    all.push(ratingDifference)
                    puts case row[8]
                    when "Fiction"
                        fictionCSV << rowToWrite
                        fiction.push(ratingDifference)
                    when "Non-Fiction"
                        nonFictionCSV << rowToWrite
                        nonFiction.push(ratingDifference)                        
                    when "Technical"
                        technicalCSV << rowToWrite
                        technical.push(ratingDifference)                        
                    end
                end
            end
        end
    end
end

puts "Average rating difference: #{all.inject(0){|sum,x| sum + x } / all.length}"
puts "Fiction rating difference: #{fiction.inject(0){|sum,x| sum + x } / fiction.length}"
puts "Non-Fiction rating difference: #{nonFiction.inject(0){|sum,x| sum + x } / nonFiction.length}"
puts "Technical rating difference: #{technical.inject(0){|sum,x| sum + x } / technical.length}"

#     technicalCSV << technical
# end

puts "done"