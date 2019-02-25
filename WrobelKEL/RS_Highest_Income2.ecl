//HPCC Systems KEL Compiler Version 0.11.2
#OPTION('expandSelectCreateRow',true);
IMPORT KEL011 AS KEL;
IMPORT RQ_Highest_Income2 FROM WrobelKEL;
IMPORT * FROM KEL011.Null;
__RoxieQuery := RQ_Highest_Income2;
OUTPUT(__RoxieQuery.Res0,NAMED('Result'));
