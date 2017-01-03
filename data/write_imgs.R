gen_plot <- function(fname, title, ylab="Operations/Second") {
  table = read.table(fname, sep=',', header=1)
  threads = table$num_threads
  l = length(table)
  vals = table[c(2:l)]
  labels = colnames(vals)
  newname = paste(strsplit(fname, "\\.")[[1]][1], ".pdf", sep="")
  pdf(newname, 6, 4)
  matplot(table$num_threads, table[c(2:l)], type=c('b'), pch=2:l, col=2:l,
          main=title,
          ylab=ylab, xlab="Number of Threads")
  legend("bottomright", legend=labels, pch=2:l, col=2:l)
  dev.off()
}
gen_plot('high_90.csv', '95% Occupancy, 90% Lookups')
gen_plot('medium_20.csv', '50% Occupancy, 20% Lookups')
gen_plot('medium_90.csv', '50% Occupancy, 90% Lookups')
gen_plot('grow_results.csv', 'Normalized Resize Overhead', ylab="")
