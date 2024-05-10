# create_fn_orig
# v08 version for orig
# v03 for nano, uses sparse version of fncrt_sfloan_v02
CREATE TABLE `fn_orig` (
  `LOAN_ID` decimal(12,0) unsigned NOT NULL,
  `CHANNEL` enum('R','C','B') NOT NULL,
  `SELLER` varchar(256) DEFAULT NULL,
  `SERVICER` varchar(256) DEFAULT NULL,
  `ORIG_RATE` decimal(5,3) unsigned DEFAULT NULL,
  `ORIG_UPB` decimal(12,2) unsigned DEFAULT NULL,
  `ORIG_TERM` decimal(3,0) unsigned NOT NULL,
  `ORIG_DATE` char(6) NOT NULL,
  `FIRST_PAY` char(6)  NOT NULL,
  `MATR_DT` char(6)  NOT NULL,
  `OLTV` decimal(3,0) unsigned DEFAULT NULL,
  `OCLTV` decimal(3,0) unsigned DEFAULT NULL,
  `NUM_BO` decimal(2,0) unsigned DEFAULT NULL,
  `DTI` decimal(2,0) unsigned DEFAULT NULL,
  `CSCORE_B` decimal(3,0) unsigned DEFAULT NULL,
  `CSCORE_C` decimal(3,0) unsigned DEFAULT NULL,
  `FIRST_FLAG` enum('Y','N') DEFAULT NULL,
  `PURPOSE` enum('C','R','P','U') DEFAULT NULL,
  `PROP` enum('CO','CP','PU','MH','SF') DEFAULT NULL,
  `NO_UNITS` decimal(1,0) unsigned DEFAULT NULL,
  `OCC_STAT` enum('P','S','I','U') DEFAULT NULL,
  `STATE` char(2) DEFAULT NULL,
  `MSA` varchar(5) DEFAULT NULL,
  `ZIP` varchar(3) DEFAULT NULL,
  `MI_PCT` decimal(5,2) unsigned DEFAULT NULL,
  `MI_TYPE` enum('1','2','3') DEFAULT NULL,
  `HOMEREADY_PROGRAM_INDICATOR` enum('F','H','R','O','7','9') DEFAULT NULL,
  `RELOCATION_MORTGAGE_INDICATOR` enum('Y','N') DEFAULT NULL,
  `PROPERTY_INSPECTION_WAIVER_INDICATOR` enum('A','C','P','R','W','O') DEFAULT NULL,
  `HIGH_BALANCE_LOAN_INDICATOR` enum('Y','N') DEFAULT NULL,
  `HIGH_LOAN_TO_VALUE_HLTV_REFINANCE_OPTION_INDICATOR` enum('Y','N') DEFAULT NULL,
  QFILE varchar(12) NOT NULL,
  SEQ_ID int not null auto_increment,

  constraint orig_date_ck
           check((orig_date is null or
         (cast(substring(orig_date from 1 for 4) as unsigned)
               between 1990 and 2999
         and cast(substring(orig_date from 5 for 2) as unsigned)
           between 1 and 12))),
  constraint first_pay_ck
           check((first_pay is null or
         (cast(substring(first_pay from 1 for 4) as unsigned)
               between 1990 and 2999
         and cast(substring(first_pay from 5 for 2) as unsigned)
           between 1 and 12))),
  constraint matr_dt_ck
           check((matr_dt is null or
         (cast(substring(matr_dt from 1 for 4) as unsigned)
               between 1990 and 2999
         and cast(substring(matr_dt from 5 for 2) as unsigned)
           between 1 and 12))),

   UNIQUE KEY `LOAN_ID_UIDX` (`LOAN_ID`),
   UNIQUE KEY `SEQ_ID_UIDX` (`SEQ_ID`),

   key  `CHANNEL_idx` (  `CHANNEL`),
   key  `SELLER_idx` ( `SELLER` ),
   key  `SERVICER_idx` ( `SERVICER` ),
   key  `ORIG_RATE_idx` ( `ORIG_RATE` ),
   key  `ORIG_UPB_idx` ( `ORIG_UPB` ),
   key  `ORIG_TERM_idx` ( `ORIG_TERM` ),
   key  `ORIG_DATE_idx` ( `ORIG_DATE` ),
   key  `FIRST_PAY_idx` ( `FIRST_PAY` ),
   key  `OLTV_idx` ( `OLTV` ),
   key  `OCLTV_idx` ( `OCLTV` ),
   key  `NUM_B_idxO`( `NUM_BO`),
   key  `DTI_idx` ( `DTI` ),
   key  `CSCORE_B_idx` ( `CSCORE_B` ),
   key  `CSCORE_C_idx` ( `CSCORE_C` ),
   key  `FIRST_FLA_idxG`( `FIRST_FLAG`),
   key  `PURPOSE_idx` ( `PURPOSE` ),
   key  `PROP_idx` ( `PROP` ),
   key  `NO_UNITS_idx` ( `NO_UNITS` ),
   key  `OCC_STAT_idx` ( `OCC_STAT` ),
   key  `STATE_idx` ( `STATE` ),
   key  `MSA_idx` ( `MSA` ),
   key  `MI_TYPE_idx` ( `MI_TYPE` ),
   key  `HOMEREADY_PROGRAM_INDICATOR_idx` ( `HOMEREADY_PROGRAM_INDICATOR` ),
   key  `PROPERTY_INSPECTION_WAIVER_INDICATOR_idx` ( `PROPERTY_INSPECTION_WAIVER_INDICATOR`)
)

