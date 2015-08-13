# Prepare data for Dr Abbas

# mainland
CA0003_abbas <- selectByDate(CA0003,start='1/1/2003',end='31/12/2013')
CA0003_abbas$date <- CA0003_abbas$date + 28800
CA0003_abbas <- CA0003_abbas[,-c(2,3,4,5,6,7,8,11,12,13,14,18,19,20,21,23)]
# mainland
CA0009_abbas <- selectByDate(CA0009,start='1/1/2003',end='31/12/2013')
CA0009_abbas$date <- CA0009_abbas$date + 28800
CA0009_abbas <- CA0009_abbas[,-c(2,3,4,5,6,7,8,11,12,13,14,18,19,20,21,23)]

# island
CA0038_abbas <- selectByDate(CA0038,start='1/1/2003',end='31/12/2013')
CA0038_abbas$date <- CA0038_abbas$date + 28800
CA0038_abbas <- CA0038_abbas[,-c(2,3,4,5,6,7,8,11,12,13,14,18,19,20,21,23)]

write.table(CA0003_abbas,file='CA0003_abbas.csv',sep=',',row.names = FALSE)
write.table(CA0009_abbas,file='CA0009_abbas.csv',sep=',',row.names = FALSE)
write.table(CA0038_abbas,file='CA0038_abbas.csv',sep=',',row.names = FALSE)