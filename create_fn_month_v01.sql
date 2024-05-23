# create_fn_month_v01
# v02 - drops columns not used
CREATE TABLE `fn_month` (
  #`POOL_ID` varchar(4) DEFAULT NULL, /* 01 */
  `LOAN_ID` decimal(12,0) unsigned NOT NULL, /* 02 */
  `ACT_PERIOD` char(6) NOT NULL, /* 03 */
  #`CHANNEL` enum('R','C','B') NOT NULL, /* 04 */
  #`SELLER` varchar(256) DEFAULT NULL, /* 05 */
  #`SERVICER` varchar(256) DEFAULT NULL, /* 06 */
  # `MASTER_SERVICER` varchar(50) DEFAULT NULL, /* 07 */
  #`ORIG_RATE` decimal(5,3) unsigned DEFAULT NULL,/* 08 */
  `CURR_RATE` decimal(5,3) unsigned DEFAULT NULL,/* 09 */
  #`ORIG_UPB` decimal(12,2) unsigned DEFAULT NULL,/* 10 */
  # `ISSUANCE_UPB` decimal(12,2) unsigned DEFAULT NULL,/* 11*/
  `CURRENT_UPB` decimal(12,2) unsigned DEFAULT NULL,/* 12 */
  #`ORIG_TERM` decimal(3,0) unsigned NOT NULL,/* 13 */
  #`ORIG_DATE` char(6) NOT NULL,/* 14 */
  #`FIRST_PAY` char(6) NOT NULL,/* 15 */
  `LOAN_AGE` decimal(3,0) DEFAULT NULL,/* 16 */
  `REM_MONTHS` decimal(3,0) unsigned DEFAULT NULL,/* 17 */
  `ADJ_REM_MONTHS` decimal(3,0) unsigned DEFAULT NULL,/* 18 */
  #`MATR_DT` char(6) DEFAULT NULL,/* 19 */
  #`OLTV` decimal(3,0) unsigned DEFAULT NULL,/* 20 */
  #`OCLTV` decimal(3,0) unsigned DEFAULT NULL,/* 21 */
  #`NUM_BO` decimal(2,0) unsigned DEFAULT NULL,/* 22 */
  #`DTI` decimal(2,0) unsigned DEFAULT NULL,/* 23 */
  #`CSCORE_B` decimal(3,0) unsigned DEFAULT NULL,/* 24 */
  #`CSCORE_C` decimal(3,0) unsigned DEFAULT NULL,/* 25 */
  #`FIRST_FLAG` enum('Y','N') DEFAULT NULL,/* 26 */
  #`PURPOSE` enum('C','R','P','U') DEFAULT NULL,/* 27*/
  #`PROP` enum('CO','CP','PU','MH','SF') DEFAULT NULL,/* 28 */
  #`NO_UNITS` decimal(1,0) unsigned DEFAULT NULL,/* 29 */
  #`OCC_STAT` enum('P','S','I','U') DEFAULT NULL,/* 30 */
  #`STATE` char(2) DEFAULT NULL,/* 31 */
  #`MSA` varchar(5) DEFAULT NULL,/* 32 */
  #`ZIP` varchar(3) DEFAULT NULL,/* 33 */
  #`MI_PCT` decimal(5,2) unsigned DEFAULT NULL,/* 34 */
  # `PRODUCT` enum('ARM','FRM') DEFAULT NULL,/* 35 */
  # `PPMT_FLG` enum('Y','N') DEFAULT NULL,/* 36 */
  # `IO` enum('Y','N') DEFAULT NULL,/* 37 */
  # `FIRST_PAY_IO` decimal(6,0) unsigned DEFAULT NULL,/* 38 */
  # `MNTHS_TO_AMTZ_IO` decimal(3,0) unsigned DEFAULT NULL,/* 39 */
  `DLQ_STATUS` char(2) DEFAULT NULL,/* 40 */
  `PMT_HISTORY` char(48) DEFAULT NULL,/* 41 */
  `MOD_FLAG` enum('Y','N') DEFAULT NULL,/* 42 */
  # `MI_CANCEL_FLAG` enum('Y','M','NA') DEFAULT NULL,/* 43 */
  #`ZERO_BAL_CODE` enum('01','02','03','06','09','15','16','96','97','98') DEFAULT NULL,/* 44 */
  #`ZB_DTE` char(6) DEFAULT NULL,/* 45 */
  #`LAST_UPB` decimal(12,2) unsigned DEFAULT NULL,/* 46 */
  # `RPRCH_DTE` decimal(6,0) unsigned DEFAULT NULL,/* 47 */
  # `CURR_SCHD_PRNCPL` decimal(12,2) unsigned DEFAULT NULL,/* 48 */
  `TOT_SCHD_PRNCPL` decimal(12,2) DEFAULT NULL,/* 49 */
  # `UNSCHD_PRNCPL_CURR` decimal(17,2) unsigned DEFAULT NULL,/* 50 */
  `LAST_PAID_INSTALLMENT_DATE` char(6)  DEFAULT NULL,/* 51 */
  #`FORECLOSURE_DATE` char(6)  DEFAULT NULL,/* 52 */
  #`DISPOSITION_DATE` char(6)  DEFAULT NULL,/* 53 */
  #`FORECLOSURE_COSTS` decimal(12,2) unsigned DEFAULT NULL,/* 54 */
  #`PROPERTY_PRESERVATION_AND_REPAIR_COSTS` decimal(12,2) unsigned DEFAULT NULL,/* 55 */
  #`ASSET_RECOVERY_COSTS` decimal(12,2) unsigned DEFAULT NULL,/* 56 */
  #`MISCELLANEOUS_HOLDING_EXPENSES_AND_CREDITS` decimal(12,2) DEFAULT NULL,/* 57 */
  #`ASSOCIATED_TAXES_FOR_HOLDING_PROPERTY` decimal(12,2) unsigned DEFAULT NULL,/* 58 */
  #`NET_SALES_PROCEEDS` decimal(12,2) DEFAULT NULL,/* 59 */
  #`CREDIT_ENHANCEMENT_PROCEEDS` decimal(12,2) unsigned DEFAULT NULL,/* 60 */
  #`REPURCHASES_MAKE_WHOLE_PROCEEDS` decimal(12,2) unsigned DEFAULT NULL,/* 61 */
  #`OTHER_FORECLOSURE_PROCEEDS` decimal(12,2) unsigned DEFAULT NULL,/* 62 */
  #`NON_INTEREST_BEARING_UPB` decimal(12,2) unsigned DEFAULT NULL,/* 63 */
  #`PRINCIPAL_FORGIVENESS_AMOUNT` decimal(12,2) unsigned DEFAULT NULL,/* 64 */
  # `ORIGINAL_LIST_START_DATE` decimal(6,0) unsigned DEFAULT NULL,/* 65 */
  # `ORIGINAL_LIST_PRICE` decimal(12,2) unsigned DEFAULT NULL,/* 66 */
  # `CURRENT_LIST_START_DATE` decimal(6,0) unsigned DEFAULT NULL,/* 67 */
  # `CURRENT_LIST_PRICE` decimal(12,2) unsigned DEFAULT NULL,/* 68 */
  # `ISSUE_SCOREB` decimal(3,0) unsigned DEFAULT NULL,/* 69 */
  # `ISSUE_SCOREC` decimal(3,0) unsigned DEFAULT NULL,/* 70 */
  # `CURR_SCOREB` decimal(3,0) unsigned DEFAULT NULL,/* 71 */
  # `CURR_SCOREC` decimal(3,0) unsigned DEFAULT NULL,/* 72 */
  #`MI_TYPE` enum('1','2','3') DEFAULT NULL,/* 73 */ 
  `SERV_IND` enum('Y','N') DEFAULT NULL, /* change in servicing activity */ /* 74 */
  # `CURRENT_PERIOD_MODIFICATION_LOSS_AMOUNT` decimal(12,2) unsigned DEFAULT NULL,/* 75 */
  # `CUMULATIVE_MODIFICATION_LOSS_AMOUNT` decimal(12,2) unsigned DEFAULT NULL,/* 76 */
  # `CURRENT_PERIOD_CREDIT_EVENT_NET_GAIN_OR_LOSS` decimal(12,2) DEFAULT NULL,/* 77 */
  # `CUMULATIVE_CREDIT_EVENT_NET_GAIN_OR_LOSS` decimal(12,2) DEFAULT NULL,/* 78 */
  #`HOMEREADY_PROGRAM_INDICATOR` enum('F','H','R','O','7','9') DEFAULT NULL,/* 79 */
  #`FORECLOSURE_PRINCIPAL_WRITE_OFF_AMOUNT` decimal(12,2) DEFAULT NULL,/* 80 */
  #`RELOCATION_MORTGAGE_INDICATOR` enum('Y','N') DEFAULT NULL,/* 81 */
  # `ZERO_BALANCE_CODE_CHANGE_DATE` decimal(6,0) unsigned DEFAULT NULL,/* 82 */
  # `LOAN_HOLDBACK_INDICATOR` enum('Y','N') DEFAULT NULL,/* 83 */
  #`LOAN_HOLDBACK_EFFECTIVE_DATE` decimal(6,0) unsigned DEFAULT NULL,/* 84 */
  #`DELINQUENT_ACCRUED_INTEREST` decimal(12,2) DEFAULT NULL,/* 85 */
  #`PROPERTY_INSPECTION_WAIVER_INDICATOR` enum('A','C','P','R','W','O') DEFAULT NULL,/* 86 */
  #`HIGH_BALANCE_LOAN_INDICATOR` enum('Y','N') DEFAULT NULL,/* 87 */
  # `ARM_5_YR_INDICATOR` enum('Y','N') DEFAULT NULL,/* 88 */
  # `ARM_PRODUCT_TYPE` varchar(100) DEFAULT NULL,/* 89 */
  # `MONTHS_UNTIL_FIRST_PAYMENT_RESET` decimal(4,0) unsigned DEFAULT NULL,/* 90 */
  # `MONTHS_BETWEEN_SUBSEQUENT_PAYMENT_RESET` decimal(4,0) unsigned DEFAULT NULL,/* 91 */
  # `INTEREST_RATE_CHANGE_DATE` decimal(6,0) unsigned DEFAULT NULL,/* 92 */
  # `PAYMENT_CHANGE_DATE` decimal(6,0) unsigned DEFAULT NULL,/* 93 */
  # `ARM_INDEX` varchar(100) DEFAULT NULL,/* 94 */
  # `ARM_CAP_STRUCTURE` varchar(10) DEFAULT NULL,/* 95 */
  # `INITIAL_INTEREST_RATE_CAP` decimal(6,4) DEFAULT NULL,/* 96 */
  # `PERIODIC_INTEREST_RATE_CAP` decimal(6,4) DEFAULT NULL,/* 97 */
  # `LIFETIME_INTEREST_RATE_CAP` decimal(6,4) DEFAULT NULL,/* 98 */
  # `MARGIN` decimal(6,4) DEFAULT NULL,/* 99 */
  # `BALLOON_INDICATOR` enum('Y','N') DEFAULT NULL,/* 100 */
  # `PLAN_NUMBER` decimal(4,0) unsigned DEFAULT NULL,/* 101 */
  `FORBEARANCE_INDICATOR` enum('F','R','T','O','N','7','9') DEFAULT NULL,/* 102 */ 
  # `HIGH_LOAN_TO_VALUE_HLTV_REFINANCE_OPTION_INDICATOR` enum('Y','N') DEFAULT NULL,/* 103 */
  # `DEAL_NAME` varchar(200) DEFAULT NULL,/* 104 */
  #`RE_PROCS_FLAG` enum('Y','N') DEFAULT NULL,/* repurchase */ /* 105 */
  `ADR_TYPE` enum('P','C','D','7','9') DEFAULT NULL,/* 106 */
  `ADR_COUNT` decimal(3,0) unsigned DEFAULT NULL,/* 107 */
  `ADR_UPB` decimal(12,2) unsigned DEFAULT NULL,/* 108 */
  `QFILE` varchar(12) NOT NULL,/* */
  constraint fn_month_act_period_ck
  	     check((act_period is null or
	     (cast(substring(act_period from 1 for 4) as unsigned)
               between 1990 and 2999
	     and cast(substring(act_period from 5 for 2) as unsigned)
	       between 1 and 12))),
  constraint fn_month_dlq_status_ck
  	     check((cast(dlq_status as unsigned)
               between 0 and 99)),
  constraint fn_month_last_paid_installment_date_ck
  	     check((last_paid_installment_date is null or
	     (cast(substring(last_paid_installment_date from 1 for 4) as unsigned)
               between 1990 and 2999
	     and cast(substring(last_paid_installment_date from 5 for 2) as unsigned)
	       between 1 and 12))),
  constraint fn_month_qfile_ck
  	     check((cast(substring(qfile from 1 for 4) as unsigned)
	     	 between 1990 and 2999
	     and substring(qfile from 5 for 1)='Q'
	     and cast(substring(qfile from 6 for 1) as unsigned)
	     	 between 1 and 4)),
  UNIQUE KEY `loan_id_act_period_uidx` (`LOAN_ID`,`ACT_PERIOD`),
  KEY `act_period_idx` (`ACT_PERIOD`),
  KEY `loan_age_idx` (`LOAN_AGE`),
  KEY `qfile_idx` (`QFILE`)  
)
