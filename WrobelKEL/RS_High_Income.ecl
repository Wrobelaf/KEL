//HPCC Systems KEL Compiler Version 0.11.2
#OPTION('expandSelectCreateRow',true);
IMPORT KEL011 AS KEL;
IMPORT RQ_High_Income FROM WrobelKEL;
IMPORT * FROM KEL011.Null;
__RoxieQuery := RQ_High_Income;
OUTPUT(__RoxieQuery.Res0,NAMED('Result'));
