M#read to memory
df <- read.csv('R/contacts.csv')

#set max filesize
maxfilesize <- 9 * 1024 * 1024

#set filenumber
filenum <- 1
write.csv(df[0,],paste('R/contacts',filenum,'.csv',sep=''),na='',row.names=F)

for (row in 1:nrow(df)) {
   
   if(file.info(paste('R/contacts',filenum,'.csv',sep=''))$size >= maxfilesize) {
      filenum <- filenum + 1
      write.csv(df[0,],paste('R/contacts',filenum,'.csv',sep=''),na='',row.names=F)
   }
   
   write.table(df[row,],paste('R/contacts',filenum,'.csv',sep=''),na='',sep=',',row.names=F,col.names=F,append=T)
}