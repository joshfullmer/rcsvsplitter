#read to memory (cannot use data.tables fread, as fread breaks with new lines in cell contents)
df <- read.csv('R/contacts.csv')

#set max filesize (first number is desired number of Megabytes)
maxfilesize <- 9 * 1024 * 1024

#set first filenumber
filenum <- 1

#writes the header to the first file
write.csv(df[0,],paste('R/contacts',filenum,'.csv',sep=''),na='',row.names=F)

#loops through each row of the data frame
for (row in 1:nrow(df)) {
   
   #checks the current filesize
   #if over the indicated maximum filesize, runs the below lines
   if(file.info(paste('R/contacts',filenum,'.csv',sep=''))$size >= maxfilesize) {
      
      #increment filenumber to create new file
      filenum <- filenum + 1
      
      #creates new file with new file number and writes header to first row of file
      write.csv(df[0,],paste('R/contacts',filenum,'.csv',sep=''),na='',row.names=F)
   }
   
   #writes current line to the current file
   #uses write.table for ease of appending lines
   write.table(df[row,],paste('R/contacts',filenum,'.csv',sep=''),na='',sep=',',row.names=F,col.names=F,append=T)
}