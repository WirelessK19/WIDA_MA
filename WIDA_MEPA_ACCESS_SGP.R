########################################################################################
###
### SGP Analyses for 2014 WIDA/MEPA 
###
########################################################################################

### Load Packages

require(SGP)



### Load Data

load("Data/WIDA_MEPA_ACCESS_Data_LONG.Rdata")



### abcSGP

WIDA_MEPA_ACCESS_SGP <- abcSGP(
			WIDA_MEPA_ACCESS_Data_LONG,
			steps=c("prepareSGP", "analyzeSGP", "combineSGP"), 
			years="2014")




### Save data

#save(WIDA_MEPA_ACCESS_SGP, file="Data/WIDA_MEPA_ACCESS_SGP.Rdata")
