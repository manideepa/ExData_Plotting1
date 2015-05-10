

## STEP 1: Create a new object 'newFile' and read .txt file into R
newFile <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows= 1000000, stringsAsFactors=FALSE,  as.is=TRUE)  

## STEP 2: Create a new object 'newFile$Date' and format dates (into date class)
newFile$Date <- as.Date(newFile$Date, format = "%d/%m/%Y") 

## STEP 3: Create a new object 'tidyFile' and subset data based on date range provided in Project 1 instructions
tidyFile <- newFile[newFile$Date >= "2007-02-01" & newFile$Date <= "2007-02-02", ] 

## STEP 4: Concatenate Date and Time
tidyFile$DT <- paste(tidyFile$Date,tidyFile$Time)

## STEP 5: Convert to timestamp
tidyFile$DT1 <- strptime(tidyFile$DT, format="%Y-%m-%d %H:%M:%OS", tz = "")

## STEP 6: Plot graph
plot(tidyFile$DT1,tidyFile$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(tidyFile$DT1,tidyFile$Sub_metering_2,col="red")
lines(tidyFile$DT1,tidyFile$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))

## STEP 7: Save File plot3
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
