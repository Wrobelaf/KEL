//HPCC Systems KEL Compiler Version 0.11.2
#OPTION('expandSelectCreateRow',true);
IMPORT KEL011 AS KEL;
IMPORT RQ_Medians_By_Sex FROM WrobelKEL;
IMPORT * FROM KEL011.Null;
__RoxieQuery := RQ_Medians_By_Sex;
OUTPUT(__RoxieQuery.Res0,NAMED('Result'));
