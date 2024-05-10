#!/usr/bin/bash
# load_fn_orig
# this version loads the orig table from the raw data
#
# USAGE:
# loads selected quarters
#
# REFERENCE:
# https://capitalmarkets.fanniemae.com/credit-risk-transfer/single-family-credit-risk-transfer/fannie-mae-single-family-loan-performance-data
# https://datadynamics.fanniemae.com/data-dynamics/#/downloadLoanData/Single-Family

set -xv
RUNDIR="${PWD}"
DBNAME=loans
TABLENAME=fn_orig
USR=${LOGNAME}

if [ \! -p "${NAMEDPIPE}" ]
then
    mkfifo "${NAMEDPIPE}"
fi

set -xv
echo "`date`: Starting full load"

pushd /tmp

for quarter in "$@" ##${quarter_list} 
do
    basequarter=$(basename ${quarter})
    QNAME="$(echo ${basequarter} |sed 's/^.*\([0-9][0-9][0-9][0-9]Q[1-4]\).*$/\1/')"
    echo "$(date): Extracting file ${quarter} name ${QNAME}";
    # -f2-6,8-10,12-34,40-42,44-46,49,51-64,73,74,79,80,81,86,87,102,103,105-108
    # -f1-5,6-8 , 9-31,32-34,35-37,38,39-52,53,54,55,56,57,58,59, 60, 61, 62-65
    # -f2, 4, 5, 6, 8, 10, 13, 14, 15, 19-34, 73, 79, 81, 86, 87
    time funzip "${quarter}" -p | egrep '^([^\|]*\|){43}\|.*$' \
	| sort -t'|' -k2,2n -k3,3rn | sort -u -t'|' -k2,2 \
	| cut -d'|' -f2,4,5,6,8,10,13,14,15,19-34,73,79,81,86,87,103 \
	| "${RUNDIR}"/fn_orig_v6.awk |  sed -e 's/||/|\\N|/g' -e 's/^|/\\N|/g' \
	| sed -e 's/||/|\\N|/g' -e 's/|$/|\\N/' | sed -e "s/\$/|${QNAME}/" \
	| mysql --login-path="${USR}" "${DBNAME}" --local-infile -e \
	"load data local infile '/dev/stdin' into table ${TABLENAME} fields terminated by '|' optionally enclosed by '\"';show count(*) warnings;show warnings ; "
    RET=$?
    if [ $RET -ne 0 ]
    then
	exit $RET
    fi
done

echo "`date`: Completed load of #@"
popd

##
##
