#!/usr/bin/ksh

##################################################################################
#                                                                                #
# Script launch Batch process for OCEN's to record information of ESIM to the BO #
#                                                                                #
##################################################################################

		  ######################
		  # Obtain Date Values #
		  ######################

#  Obtain date and time values to launch OCEN's batch process
launch_date=`date +"%Y-%m-%d:%H:%M:%S"`
launch_second=`date +"%S"`
launch_minute=`date +"%M"`
launch_hour=`date +"%H"`
launch_day=`date +"%d"`
launch_month=`date +"%m"`
launch_year=`date +"%Y"`
rename_day=`date +"%Y%m%d"`
minute_batch=`expr $launch_minute - $launch_minute % 5`

#  Set correct hour string
if test $launch_hour = "0"
then
  launch_hour = "00"
fi
#  Set correct minute string
if test $launch_minute = "0"
then
  launch_minute = "00"
fi
#  Set correct second string
if test $launch_second = "0"
then
  launch_second = "00"
fi

#  Construct timestamp to pass to the batch process
batch_date=$launch_year-$launch_month-$launch_day:$launch_hour:$launch_minute:$launch_second


		  ############################
		  # Set Enviroment Variables #
		  ############################

#  Establish environment directories
DIR_RAIZ_OCEN=/soflib00/desar/enel
DIR_BIN_OCEN=$DIR_RAIZ_OCEN/bin
DIR_BATCH_OCEN=$DIR_RAIZ_OCEN/tmpbatchfich

#  Load Environment variables
. $DIR_BIN_OCEN/global.sh
CLASSPATH=$DIR_RAIZ_OCEN/PropertiesXml:$CLASSPATH
export CLASSPATH


		  ########################
		  # Launch Batch Process #
		  ########################

#  Execute OCEN's Batch process
#echo "["$launch_date"] Proceso Batch Horario iniciado, hora de Batch: ["$batch_date"]"
java com.soluzionasf.ocen.interfaces.bo.dwoperacion.helper.CenDwOpeMainProcessWriter DESIM001 $batch_date > $DIR_BATCH_OCEN/BOFSend.log 2> $DIR_BATCH_OCEN/BOFSend.err

#  And bye
