# Prepare data for Dr Abbas

# mainland
CA0003_abbas <- selectByDate(CA0003,start='1/1/2003',end='31/12/2013')
CA0003_abbas$date <- CA0003_abbas$date + 28800
CA0003_abbas <- CA0003_abbas[,-c(3,4,5,6,7,8,11,12,13,14,18,19,20,21,23)]
# Replace all NAs to zeros
CA0003_abbas[is.na(CA0003_abbas)] <- 0

# mainland
CA0009_abbas <- selectByDate(CA0009,start='1/1/2003',end='31/12/2013')
CA0009_abbas$date <- CA0009_abbas$date + 28800
CA0009_abbas <- CA0009_abbas[,-c(3,4,5,6,7,8,11,12,13,14,18,19,20,21,23)]
# Replace all NAs to zeros
CA0009_abbas[is.na(CA0009_abbas)] <- 0

# island
CA0038_abbas <- selectByDate(CA0038,start='1/1/2003',end='31/12/2013')
CA0038_abbas$date <- CA0038_abbas$date + 28800
CA0038_abbas <- CA0038_abbas[,-c(3,4,5,6,7,8,11,12,13,14,18,19,20,21,23)]
# Replace all NAs to zeros
CA0038_abbas[is.na(CA0038_abbas)] <- 0

# Combine all files by rows
data_abbas <- rbind(CA0003_abbas,CA0009_abbas,CA0038_abbas)
write.table(CA0003_abbas,file='data/CA0003_abbas.csv',sep=',',row.names = FALSE)
write.table(CA0009_abbas,file='data/CA0009_abbas.csv',sep=',',row.names = FALSE)
write.table(CA0038_abbas,file='data/CA0038_abbas.csv',sep=',',row.names = FALSE)
write.table(data_abbas,file='data/data_abbas.csv',sep=',',row.names=FALSE)