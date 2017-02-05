set datafile separator ","
set autoscale
set terminal pngcairo size 1000,1000 enhanced font 'Verdana,10'
set output "printme.png"
plot[0:55] './fiction.csv' title 'fiction' pointtype 6 lc rgb 'blue', './non-fiction.csv' title 'non-fiction' pointtype 6 lc rgb 'red', './technical.csv' title 'technical' pointtype 6 lc rgb 'black'