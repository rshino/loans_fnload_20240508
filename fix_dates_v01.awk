#!/usr/bin/awk -f
# make_fn_orig
# v01

function mmccyy2ccyymm(mmccyy){
    if (mmccyy=="")
        return("")
    return substr(mmccyy,3,4) substr(mmccyy,1,2)
}

BEGIN{
    FS=OFS="|"
}
{
    loan_id = $2
    $14=mmccyy2ccyymm($14) # ORIG_DATE
    $15=mmccyy2ccyymm($15) # FIRST_PAY
    $19=mmccyy2ccyymm($19) # MATR_DT
    $45=mmccyy2ccyymm($45) # ZB_DTE
    $51=mmccyy2ccyymm($51) # LAST_PAID_INSTALLMENT_DATE
    $52=mmccyy2ccyymm($52) # FORECLOSURE_DATE
    $53=mmccyy2ccyymm($53) # DISPOSITION_DATE
    print $0
}
