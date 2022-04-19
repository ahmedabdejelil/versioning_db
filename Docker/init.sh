#!/bin/ksh
#-------------------------------------------------------------------------------
# LIQUIBASE
# init.sh
# initialisation des variables
#-------------------------------------------------------------------------------
# Parametres
#
#
#-------------------------------------------------------------------------------
# Ver   Date              Aut           Desc
# 1.0   2020/06/02      FDKB9702     Version initiale
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# COMMON_PARAMETERS
export P_PWD="4y7sV96vA9wv46VR"
export PGPASSWORD=$P_PWD
export P_CODE="NOK"
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
# INSTALL_PARAMETERS
export P_HOSTNAME_INSTALL="192.168.84.129"
export P_PORT_INSTALL="5432"
export P_DBNAME_INSTALL="postgres"
export P_USER_INSTALL="postgres"
export P_PWD_INSTALL="4y7sV96vA9wv46VR"
export P_DRIVER_INSTALL="org.postgresql.Driver"
export P_CLASSPATH_INSTALL="/home/user/liquibase/lib/postgresql-42.2.12.jar"
export P_URL_INSTALL="jdbc:postgresql://192.168.84.129:5432/postgres"
export P_REFERENCEURL_INSTALL="jdbc:postgresql://192.168.84.129:5432/postgres"
export P_REFERENCEUSER_INSTALL="postgres"
export P_REFERENCEPWD_INSTALL="4y7sV96vA9wv46VR"
export P_DEFAULTSCHEMANAME_INSTALL="public"
export P_LOGFILENAME_INSTALL="Log_Install_$(date +"%d_%m_%Y").txt"
export P_HISTORYFILENAME_INSTALL="History_Install_$(date +"%d_%m_%Y").txt"
export P_DIFFFILENAME_INSTALL="Diff_Install_$(date +"%d_%m_%Y").txt"
export P_DOCFILENAME_INSTALL="Doc_Install_$(date +"%d_%m_%Y")"
export P_CHANGELOGFILENAME_INSTALL="Changelog_Install_$(date +"%d_%m_%Y_%H%M%S").xml"
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
# MIGRATION_PARAMETERS
export P_HOSTNAME_MIGRATION="10.241.109.56"
export P_PORT_MIGRATION="5432"
export P_DBNAME_MIGRATION="ahmed"
export P_USER_MIGRATION="ahmed"
export P_PWD_MIGRATION="ahmed"
export P_PROJECTNAME_MIGRATION="UPG"
export P_DRIVER_MIGRATION="org.postgresql.Driver"
export P_CLASSPATH_MIGRATION="/home/user/liquibase/lib/postgresql-42.2.12.jar"
export P_URL_MIGRATION="jdbc:postgresql://10.241.109.56:5432/ahmed"
export P_REFERENCEURL_MIGRATION="jdbc:postgresql://10.241.109.56:5432/postgres"
export P_REFERENCEUSER_MIGRATION="ahmed"
export P_REFERENCEPWD_MIGRATION="ahmed"
export P_LOGFILENAME_MIGRATION="Log_Migration_$(date +"%d_%m_%Y").txt"
export P_HISTORYFILENAME_MIGRATION="History_Migration_$(date +"%d_%m_%Y").txt"
export P_DIFFFILENAME_MIGRATION="Diff_Migration_$(date +"%d_%m_%Y").txt"
export P_DOCFILENAME_MIGRATION="Doc_Migration_$(date +"%d_%m_%Y")"
export P_CHANGELOGFILENAME_MIGRATION="Changelog_Migration_$(date +"%d_%m_%Y_%H%M%S").xml"
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
# UPGRADE_PARAMETERS
export P_HOSTNAME_UPGRADE="10.241.109.56"
export P_PORT_UPGRADE="5432"
export P_DBNAME_UPGRADE="ahmed"
export P_USER_UPGRADE="ahmed"
export P_PWD_UPGRADE="ahmed"
export P_PROJECTNAME_UPGRADE="UPG"
export P_DRIVER_UPGRADE="org.postgresql.Driver"
export P_CLASSPATH_UPGRADE="/home/user/liquibase/lib/postgresql-42.2.12.jar"
export P_URL_UPGRADE="jdbc:postgresql://10.241.109.56:5432/ahmed"
export P_REFERENCEURL_UPGRADE="jdbc:postgresql://10.241.109.56:5432/postgres"
export P_REFERENCEUSER_UPGRADE="ahmed"
export P_REFERENCEPWD_UPGRADE="ahmed"
export P_DEFAULTSCHEMANAME_UPGRADE="public"
export P_LOGFILENAME_UPGRADE="Log_Upgrade_$(date +"%d_%m_%Y").txt"
export P_HISTORYFILENAME_UPGRADE="History_Upgrade_$(date +"%d_%m_%Y").txt"
export P_DIFFFILENAME_UPGRADE="Diff_Upgrade_$(date +"%d_%m_%Y").txt"
export P_DOCFILENAME_UPGRADE="Doc_Upgrade_$(date +"%d_%m_%Y")"
export P_CHANGELOGFILENAME_UPGRADE="Changelog_Upgrade_$(date +"%d_%m_%Y_%H%M%S").xml"
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
# formattage_version Function
formattage_version () {
     local str="$1"
     length=${#str}
  #echo "Length of '$str' is $length" 
  if [ $length == "2" ] 
  then
  foo="${str}.0.0.0.0"  
  elif [ $length == "4" ] 
  then
  foo="${str}.0.0.0"
  elif [ $length == "6" ]
  then
  foo="${str}.0.0"
  elif [ $length == "8" ]
  then
  foo="${str}.0"
  else 
  foo="${str}"  
fi
  echo $foo
}
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
# Help Function

Help()
{

local_input="$1"
   local_input=$(echo "$local_input" | awk '{print toupper($0)}')
   #echo $local_input
   if [ $local_input == "HELP" ] 
   then
   echo "Please Choose Action Number (1/2/3) :"
   echo "1:Install"
   echo "2:Migration"
   echo "3:Upgrade"   
   echo
while :
do
  read INPUT_STRING
  case $INPUT_STRING in
	1)
   echo "########################################################"
   echo "Usage Guide liquibase_install.sh Script"
   echo "########################################################" 
   echo "Parameters :"
   echo "Param1: Action(Help/Install)"
   echo "Param2: Tag for init version that you want to install"
   echo "########################################################"
   echo "Exemple1: Get Usage Help"
   echo "Command: ./liquibase_install.sh help "
   echo "########################################################"
   echo "Exemple2: Install init version "
   echo "Command: ./liquibase_install.sh Install init_db"
   echo "########################################################"  
   break
		;;
	2)  
    echo "########################################################"
    echo "Usage Guide liquibase_migration.sh Script"
    echo "########################################################" 
    echo "Parameters :"
    echo "Param1: Action (Help/Migration)"
    echo "Param2: Tag for version that you want to install"
    echo "########################################################"
    echo "Exemple1: Get Usage Help"
    echo "Command: ./liquibase_migration.sh help "
    echo "########################################################"
    echo "Exemple2: Migrate To project Version 1.0"
    echo "Command: ./liquibase_migration.sh Migration v1.0"
    echo "########################################################"   
		break
		;;
  3)
    echo "########################################################"
    echo "Usage Guide liquibase_upgrade.sh Script"
    echo "########################################################" 
    echo "Parameters :"
    echo "Param1: Action (Help/Upgrade)"
    echo "Param2: Tag for version that you want to install"
    echo "########################################################"
    echo "Exemple1: Get Usage Help"
    echo "Command: ./liquibase_upgrade.sh help "
    echo "########################################################"
    echo "Exemple2: Upgrade To Version 3.0"
    echo "Command: ./liquibase_upgrade.sh Upgrade v3.0"
    echo "########################################################"
		break
		;;
	*)
		echo "Wrong Action Choice, please enter a valid Action Number (1/2/3)"
		;;
  esac
done

fi
}
