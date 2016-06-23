########################################################################################
###
### Data preparation code for 2014 Access
###
########################################################################################

### Load Packages

require(SGP)
require(foreign)
require(data.table)


### Load Data

WIDA_MEPA_ACCESS_Data_LONG <- read.spss("SGP 2016 Wide 6.8.2016.sav", to.data.frame=TRUE)


### clean up data


names(WIDA_MEPA_ACCESS_Data_LONG) <- toupper(names(WIDA_MEPA_ACCESS_Data_LONG))

names(WIDA_MEPA_ACCESS_Data_LONG) <- c("ID", "LAST_NAME", "FIRST_NAME", "MIDDLE_NAME", "DOB", "GRADE", "SS_LEVEL", "SCALE_SCORE", "GRADESPAN", "YEAR")

WIDA_MEPA_ACCESS_Data_LONG <- subset(WIDA_MEPA_ACCESS_Data_LONG, select=c("YEAR", "ID", "LAST_NAME", "FIRST_NAME", "GRADE", "SCALE_SCORE"))
WIDA_MEPA_ACCESS_Data_LONG$YEAR <- as.character(WIDA_MEPA_ACCESS_Data_LONG$YEAR)
WIDA_MEPA_ACCESS_Data_LONG$ID <- as.character(WIDA_MEPA_ACCESS_Data_LONG$ID)
WIDA_MEPA_ACCESS_Data_LONG$GRADE <- as.character(WIDA_MEPA_ACCESS_Data_LONG$GRADE)
WIDA_MEPA_ACCESS_Data_LONG <- subset(WIDA_MEPA_ACCESS_Data_LONG, GRADE!="  ")

WIDA_MEPA_ACCESS_Data_LONG$LAST_NAME[WIDA_MEPA_ACCESS_Data_LONG$LAST_NAME=="                  "] <- NA
WIDA_MEPA_ACCESS_Data_LONG$FIRST_NAME[WIDA_MEPA_ACCESS_Data_LONG$FIRST_NAME=="              "] <- NA
WIDA_MEPA_ACCESS_Data_LONG$LAST_NAME <- droplevels(WIDA_MEPA_ACCESS_Data_LONG$LAST_NAME)
WIDA_MEPA_ACCESS_Data_LONG$FIRST_NAME <- droplevels(WIDA_MEPA_ACCESS_Data_LONG$FIRST_NAME)
levels(WIDA_MEPA_ACCESS_Data_LONG$LAST_NAME) <- sapply(levels(WIDA_MEPA_ACCESS_Data_LONG$LAST_NAME), capwords)
levels(WIDA_MEPA_ACCESS_Data_LONG$FIRST_NAME) <- sapply(levels(WIDA_MEPA_ACCESS_Data_LONG$FIRST_NAME), capwords)

WIDA_MEPA_ACCESS_Data_LONG$GRADE <- as.factor(WIDA_MEPA_ACCESS_Data_LONG$GRADE)
levels(WIDA_MEPA_ACCESS_Data_LONG$GRADE) <- c("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12")
WIDA_MEPA_ACCESS_Data_LONG$GRADE <- as.character(WIDA_MEPA_ACCESS_Data_LONG$GRADE)


WIDA_MEPA_ACCESS_Data_LONG$VALID_CASE <- "VALID_CASE"
WIDA_MEPA_ACCESS_Data_LONG$CONTENT_AREA <- "READING"
WIDA_MEPA_ACCESS_Data_LONG$YEAR <- "2016"

### Reorder 

WIDA_MEPA_ACCESS_Data_LONG <- as.data.table(WIDA_MEPA_ACCESS_Data_LONG)
setcolorder(WIDA_MEPA_ACCESS_Data_LONG, c(7,8,1,2,3,4,5,6))


### Save data

WIDA_MA_Data_LONG_2016 <- WIDA_MEPA_ACCESS_Data_LONG
save(WIDA_MA_Data_LONG_2016, file="Data/WIDA_MA_Data_LONG_2016.Rdata")
