#!/usr/bin/awk -f
# transform fn sf orig dataset
# v4 uses only columns used in origination
function mmccyy2ccyymm(mmccyy){
    if (mmccyy=="")
	return("")
    return substr(mmccyy,3,4) substr(mmccyy,1,2)
}
BEGIN{FS=OFS="|"}
{
    $9=mmccyy2ccyymm($9) # ORIG_DATE
    $10=mmccyy2ccyymm($10) # FIRST_PAY
    $11=mmccyy2ccyymm($11) # MATR_DT
    print $0
}
