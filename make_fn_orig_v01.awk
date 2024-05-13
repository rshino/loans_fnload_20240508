#!/usr/bin/awk -f
# make_fn_orig - make unique line per loan, using last
# v01

BEGIN{
    FS=OFS="|"
loan_id=0
last_line=""

}
$2 != loan_id && last_line != "" {
    print last_line
}
$16 != "" {
    loan_id = $2
    last_line=$0
}
END{
    print last_line
}
