#!/usr/bin/env bash
# extracts quarterly loan files from FN SF Performance_All.zip
# USAGE:
#
# REFERENCE:
# https://capitalmarkets.fanniemae.com/credit-risk-transfer/single-family-credit-risk-transfer/fannie-mae-single-family-loan-performance-data
# https://datadynamics.fanniemae.com/data-dynamics/#/downloadLoanData/Single-Family
# SETUP
# Primary Dataset is shown in this page, the 
# https://datadynamics.fanniemae.com/data-dynamics/#/downloadLoanData/Single-Family
# INPUTROOT_DIR stores the source and intermediate files 
export INPUTROOT_DIR=/data/tmp
export PERFALL_ZIP=Performance_All.zip
export DOWNLOAD=downloads
export STAGING=staging
# RELEASE is a subdir which keeps each quarterly release separate
# including the source and intermediate files
# the name is the range of quarterly files
# releases update every quarter about 45 days after the quarter;
# i.e., Q1 updates around May 15
export RELEASE=2000Q1-2023Q4

while [ "$#" -gt 0 ]
do
    case "$1" in
	-a)
	    ALL_F=Y
	    ;;
        -c)
            SEP=','
            ;;
        -D)
            shift; export DBNAME="$1"
            ;;
        -l | --load)
            LOAD_F=Y
            ;;
        --list)
            LIST_F=Y
            LOAD_F=N	    
            ;;
        -n)
            LOAD_F=N
            ;;
        -p)
            SEP='|'
            ;;
        -q)
            shift; export QTR_FILE="$1"
            ;;
        -t)
            SEP=
            ;;
        -T)
            shift; export TABLENAME="$1"
            ;;
        -v)
            VERBOSE_F=Y
            ;;
	-x | --extract) # extract
            export EXTRACT_F="Y"
	    ;;
	-y | --year) # filter by year
            shift; export YEAR_F="$1"
	    ;;
	*)
	    eval "$1" ; # override variables with args in the form FOO=bar
	    ;;
    esac
    shift
done




checkdir() {
    NAME="$1"
    VALUE="$(eval echo $(eval 'echo \$$1'))"
    if [ \! -d "${VALUE}" ]
    then
	if [ "c" == "$2" -o "create" == "$2" ]
	then
	    PARENT="$(dirname ${VALUE})"
	    if [ \! -d "${PARENT}" ]
	    then
		echo "ERROR: ${NAME}=${VALUE} path does not exist"
		echo "       cannot create dir ${VALUE}"
		echo "       because ${PARENT} does not exist"
		exit 1
	    else
		echo "creating dir ${VALUE}"		
		mkdir "${VALUE}"
	    fi
	else
	    echo "ERROR: ${NAME}=${VALUE} path does not exist, exiting!"
	    exit 1
	fi
    fi
}

checkfile() {
    NAME="$1"
    VALUE="$(eval echo $(eval 'echo \$$1'))"
    if [ \! -f "${VALUE}" ]
    then
	echo "ERROR: ${NAME}=${VALUE} path does not exist, exiting!"
	exit 1
    fi
}

if [ "$VERBOSE_F" = "Y" ]
then
    set -xv
fi

export RELEASE_DIR="${INPUTROOT_DIR}/${RELEASE}"
export DOWNLOAD_DIR="${RELEASE_DIR}/${DOWNLOAD}"
export STAGING_DIR="${RELEASE_DIR}/${STAGING}"
export PERFALL_ZIP_PATH="${DOWNLOAD_DIR}/${PERFALL_ZIP}"

# error checking
checkdir INPUTROOT_DIR
checkdir RELEASE_DIR
checkdir DOWNLOAD_DIR
checkdir STAGING_DIR create
checkfile PERFALL_ZIP_PATH

if [ "${LIST_F}" = "Y" -o "${ALL_F}" = "Y" ]
then
    export PERFALL_LIST="$(unzip -Z -1 "${PERFALL_ZIP_PATH}" | sort)"
fi    

if [ -n "${YEAR_F}" ]
then
    export PERFALL_LIST="$(unzip -Z -1 "${PERFALL_ZIP_PATH}" | grep "${YEAR_F}" | sort)"
fi


if [ -z "${PERFALL_LIST}" -a -z "${QTR_FILE}" ]
then
    echo "Either -a (all), -q (quarter YYYYQQ), -y (year)"
    exit 1
elif [ -z "${PERFALL_LIST}" ]
then
     export PERFALL_LIST="${QTR_FILE}"
fi

echo "EXTRACTING ${PERFALL_LIST}"

if [ -z "${EXTRACT_F}" -o "N" = "${EXTRACT_F}" ]
then
    if [ "Y" = "${LIST_F}" ]
    then
	echo "${PERFALL_LIST}"
    fi
    exit 0 
fi
if [ "N" = "${LOAD_F}" ]
then
    exit 0
fi


for QTR_FILE in ${PERFALL_LIST}
do
    time unzip "${PERFALL_ZIP_PATH}" "${QTR_FILE}" -d "${STAGING_DIR}"
done


if [ "$VERBOSE_F" = "Y" ]
then
   set + xv
fi


##





