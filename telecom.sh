# Created by power3lectronics
# Telecom script
# Company's private data has been supressed
# Private data replaced by (PRIVATE DATA)
 
#!/bin/bash
 
echo
 
verifyHost(){ # verify the current host
    if test "$HOSTNAME" = (PRIVATE_DATA)
        then
            HOST= (PRIVATE_DATA)
            HOST_NAME=$HOSTNAME
            HOST_TARGET= (PRIVATE_DATA)
    elif test "$HOSTNAME" = (PRIVATE_DATA)
        then
            HOST= (PRIVATE_DATA)
            HOST_NAME=$HOSTNAME
            HOST_TARGET= (PRIVATE_DATA)
    fi # endif - host
}
 
trails(){
    cd (PRIVATE_DATA)
    if test $? -eq 1
        then
        echo
        verifyHost
        echo "*********************************************"
        echo "* DIRECTORY NOT FOUND IN $HOST_NAME *"
        echo "*                                           *"
        echo "* SEARCHING IN $HOST_TARGET           *"
        echo "*********************************************"
        echo
        ssh $HOST ls -ltr (PRIVATE_DATA)
        LAST_AUDIT=$(ssh $HOST ls -tr (PRIVATE_DATA)| tail -1 | cut -c11)
        echo
        echo -n "Get last (PRIVATE_DATA) file results in real time? [y/n] "
        read ANSWER
        if test "$ANSWER" = "y"
        then
            echo
            trap "echo; echo -------; echo; goBackToMenu" 2 # getting ctrl+c signal
            ssh $HOST tail -f (PRIVATE_DATA)
        elif test "$ANSWER" = "n"
        then
            echo
            goBackToMenu
        fi
    else
        LAST_AUDIT=$(ls -tr | tail -1 | cut -c11)
        echo
        ls -ltr
        echo
        echo -n "Get last AuditTrail file results in real time? [y/n] "
        read ANSWER
        if test "$ANSWER" = "y"
        then
            echo
            trap "echo; echo -------; echo; goBackToMenu" 2 # getting ctrl+c signal
            tail -f (PRIVATE_DATA)
        elif test "$ANSWER" = "n"
        then
            echo
            goBackToMenu
    fi
    echo
    fi
}
 
capabilities(){
    echo
    verifyHost
    cd (PRIVATE_DATA)
    if test $? -ne 0
        then
            echo
            echo "*********************************************"
            echo "* DIRECTORY NOT FOUND IN $HOST_NAME *"
            echo "*                                           *"
            echo "* SEARCHING IN $HOST_TARGET           *"
            echo "*********************************************"
            echo
            getHandsetData
            ssh $HOST ls (PRIVATE_DATA) | grep $MODEL | grep $MANUFACTURER
            while test $? -eq 1 # verify if handset exists
            do
                    echo "*************************************************************************"
                    echo "* HANDSET NOT FOUND. PLEASE, VERIFY THE HANDSET MODEL AND MANUFACTURER. *"
                    echo "*************************************************************************"
                    echo
                    getHandsetData
                    ssh $HOST ls (PRIVATE_DATA) | grep $MODEL | grep $MANUFACTURER
            done # end of verification
            echo
            echo -n "Copy the wanted XML file above and paste here: "
            read XML_FILE
            XML="$XML_FILE"
            XML1=$(echo $XML | cut -d" " -f1)
            XML2=$(echo $XML | cut -d" " -f2)
            XML3="$XML1\ $XML2"
            echo
            ssh $HOST cat (PRIVATE_DATA) | grep NAME
            while test $? -ne 0
            do
                echo
                echo "********************"
                echo "* INVALID XML FILE *"
                echo "********************"
                echo
                echo -n "Copy the wanted XML file above and paste here: "
                read XML_FILE
                XML="$XML_FILE"
                XML1=$(echo $XML | cut -d" " -f1)
                XML2=$(echo $XML | cut -d" " -f2)
                XML3="$XML1\ $XML2"
                echo
                ssh $HOST cat (PRIVATE_DATA) | grep NAME
            done
            echo
            goBackToMenu
        else
            getHandsetData
            echo
            ls | grep $MODEL | grep $MANUFACTURER
            while test $? -eq 1 # verify if handset exists
                    do
                    echo "*************************************************************************"
                    echo "* HANDSET NOT FOUND. PLEASE, VERIFY THE HANDSET MODEL AND MANUFACTURER. *"
                    echo "*************************************************************************"
                    echo
                    getHandsetData
                    ls | grep $MODEL | grep $MANUFACTURER
            done # end of verification
            echo
            echo -n "Copy the wanted XML file above and paste here: "
            read XML_FILE
            echo
            cat "$XML_FILE" | grep NAME
            while test $? -ne 0
            do
                echo
                echo "********************"
                echo "* INVALID XML FILE *"
                echo "********************"
                echo
                echo -n "Copy the wanted XML file above and paste here: "
                read XML_FILE
                echo
                cat "$XML_FILE" | grep NAME
            done
            echo
            goBackToMenu
    fi
}
 
logs(){
    echo
    verifyHost
    ls -ltr (PRIVATE_DATA) | grep -q (PRIVATE_DATA)
    if test $? -eq 0
        then
            LOG_NUMBER1=$(ls -tr (PRIVATE_DATA) | grep (PRIVATE_DATA) | tail -1 | cut -c8) # get the number of the newest Log file
            LOG_DATE1=$(date -r (PRIVATE_DATA) +%s) # get the time elapsed since 1970 until the last update of the log file
    else
        echo "*********************************************"
        echo "* DIRECTORY NOT FOUND IN $HOST_NAME *"
        echo "*                                           *"
        echo "* SEARCHING IN $HOST_TARGET           *"
        echo "*********************************************"
        fi
        ssh $HOST ls -tr (PRIVATE_DATA) | grep -q (PRIVATE_DATA) # also filtering by linqus because of a non wanted line
        if test $? -eq 0
            then
                LOG_NUMBER2=$(ssh $HOST ls -tr (PRIVATE_DATA) | grep (PRIVATE_DATA) | tail -1 | cut -c8)
                LOG_DATE2=$(ssh $HOST date -r (PRIVATE_DATA) +%s) # get the time elapsed since 1970 until the last update of the log file
    fi
    if test $LOG_DATE1 -gt $LOG_DATE2
        then
            ls -ltr (PRIVATE_DATA) | grep (PRIVATE_DATA)
        elif test $LOG_DATE2 -gt $LOG_DATE1
            then
                ssh $HOST ls -ltr (PRIVATE_DATA) | grep (PRIVATE_DATA) | grep (PRIVATE_DATA)
    fi
    echo
    echo -n "Get last Log file results in real time? [y/n] "
    read ANSWER
    if test "$ANSWER" = "y"
    then
    echo
    if test $LOG_DATE1 -gt $LOG_DATE2
            then
            trap "echo; echo -------; echo; goBackToMenu" 2 # getting ctrl+c signal
            tail -f (PRIVATE_DATA)
            elif test $LOG_DATE2 -gt $LOG_DATE1
            then
            ssh $HOST tail -f (PRIVATE_DATA)
    fi
    elif test "$ANSWER" = "n"
    then
    echo
    goBackToMenu
    fi
}
 
searchAgain(){ # used on templates
    echo -n "Search again? [y/n] "
    read ANSWER
    if test "$ANSWER" != "y" -a "$ANSWER" != "n" # verify answer
        then
            echo
            echo "******************"
            echo "* INVALID OPTION *"
            echo "******************"
            echo
            searchAgain
            echo
        elif test "$ANSWER" = "y"
            then
                echo
                template
                echo
        elif test "$ANSWER" = "n"
            then
                echo
                goBackToMenu
                echo
    fi # verify answer
}
 
searchAgainSsh(){ # used on templates
    echo -n "Search again? [y/n] "
    read ANSWER
    if test "$ANSWER" != "y" -a "$ANSWER" != "n" # verify answer
        then
            echo
            echo "******************"
            echo "* INVALID OPTION *"
            echo "******************"
            echo
            searchAgain
            echo
        elif test "$ANSWER" = "y"
            then
                echo
                templateSearchSsh
                echo
        elif test "$ANSWER" = "n"
            then
                echo
                goBackToMenu
                echo
    fi # verify answer
}
 
getGenericSsh(){
    echo "**************************************************************"
    echo "* MODEL NOT FOUND. IT MAY RECIEVES GENERIC TEMPLATE SETTINGS *"
    echo "**************************************************************"
    echo
    echo -n "Get generic template? [y/n] "
    read ANSWER
    while test "$ANSWER" != "y" -a "$ANSWER" != "n"
    do
        echo
        echo "******************"
        echo "* INVALID OPTION *"
        echo "******************"
        echo
        echo -n "Get generic template? [y/n] "
        read ANSWER
    done
    if test "$ANSWER" = "y" # verify answer
    then
        echo
        GENERIC=$(ssh $HOST find (PRIVATE_DATA) -name (PRIVATE_DATA) | tail -1)
        ssh $HOST cat $GENERIC
        echo
        goBackToMenu
    elif test "$ANSWER" = "n"
    then
        echo
        searchAgainSsh
        echo
    fi # verify answer
}
 
getGeneric(){
    echo "**************************************************************"
    echo "* MODEL NOT FOUND. IT MAY RECIEVES GENERIC TEMPLATE SETTINGS *"
    echo "**************************************************************"
    echo
    echo -n "Get generic template? [y/n] "
    read ANSWER
    while test "$ANSWER" != "y" -a "$ANSWER" != "n"
    do
        echo
        echo "******************"
        echo "* INVALID OPTION *"
        echo "******************"
        echo
        echo -n "Get generic template? [y/n] "
        read ANSWER
    done
    if test "$ANSWER" = "y" # verify answer
    then
        echo
        GENERIC=$(find (PRIVATE_DATA) -name (PRIVATE_DATA) | tail -1)
        cat $GENERIC
        echo
        goBackToMenu
    elif test "$ANSWER" = "n"
    then
        echo
        searchAgain
        echo
    fi # verify answer
}
 
getHandsetData(){ # function to retrieve model and manufacturer information
    echo -n "Enter with the handset manufacturer: "
    read MANUFACTURER
    echo -n "Enter with the handset model: "
    read MODEL
    echo
    MODEL=$(echo $MODEL | tr '[:lower:]' '[:upper:]')
    MANUFACTURER=$(echo $MANUFACTURER | tr '[:lower:]' '[:upper:]')
}
 
 
templateSearchSsh(){
    echo
    getHandsetData
    ssh $HOST grep $MODEL (PRIVATE_DATA) | cut -c69- | grep (PRIVATE_DATA)
    if test $? -ne 0
    then
        getGenericSsh
    fi
    echo
    echo -n "Copy above and paste here the line with the wanted result: "
    read RESULT
    RESULT=$(echo $RESULT | cut -d"/" -f1)
    echo
    ssh $HOST cat (PRIVATE_DATA)
    while test $? -ne 0
    do
        echo
        echo "*****************"
        echo "* INVALID ENTRY *"
        echo "*****************"
        echo
        echo -n "Copy above and paste here the line with the wanted result: "
        read RESULT
        RESULT=$(echo $RESULT | cut -d"/" -f1)
        echo
        ssh $HOST cat (PRIVATE_DATA)
    done
    echo
    goBackToMenu
}
 
template(){
    echo
    cd (PRIVATE_DATA)
    if test $? -ne 0
    then
        verifyHost
        echo
        echo "*********************************************"
        echo "* DIRECTORY NOT FOUND IN $HOST_NAME *"
        echo "*                                           *"
        echo "* SEARCHING IN $HOST_TARGET           *"
        echo "*********************************************"
    #   echo
        templateSearchSsh
    fi
    getHandsetData
    echo
    grep $MODEL (PRIVATE_DATA) | grep $MANUFACTURER 
    if test $? -ne 0
    then
        getGeneric
    fi
    echo
    echo -n "Copy above and paste here the line with the wanted result: "
    read RESULT
    RESULT=$(echo $RESULT | cut -d"/" -f1)
    echo
    cat (PRIVATE_DATA)
    while test $? -ne 0
    do
        echo
        echo "*****************"
        echo "* INVALID ENTRY *"
        echo "*****************"
        echo
        echo -n "Copy above and paste here the line with the wanted result: "
        read RESULT
        RESULT=$(echo $RESULT | cut -d"/" -f1)
        echo
        cat (PRIVATE_DATA)
    done
    echo
    goBackToMenu
}
 
 
goBackToMenu(){
    echo -n "Back to Menu? [y/n] "
    read ANSWER
    if test "$ANSWER" = "y"
        then
        echo
        echo -------
        echo
        menu
        access
        elif test "$ANSWER" = "n"
            then
                echo
                exit
        elif test "$ANSWER" != "y" -a "$ANSWER" != "n"
            then
                echo
                echo "******************"
                echo "* INVALID OPTION *"
                echo "******************"
                echo
                goBackToMenu
    fi
} 
 
menu(){
    # menu
    echo "Which files would you like to access?"
    echo
    echo "1) Capabilities"
    echo "2) Templates"
    echo "3) Trails"
    echo "4) Logs"
    echo "5) exit Menu"
    echo
    # menu answer
    echo -n "Option number: "
    read OPTION
}
 
access(){
case $OPTION in
1)
    capabilities
     
;;
2)
    template
;;
3)
    trails
;;
4)
    logs
;;
5)
    echo
    exit
;;
*)
    echo
    echo "******************"
    echo "* INVALID OPTION *"
    echo "******************"
    echo
    menu # call again the menu
    access # recursive call to access function
    exit
;;
esac
}
 
menu
access
 
echo
