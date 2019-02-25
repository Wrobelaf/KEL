//HPCC Systems KEL Compiler Version 0.11.2
#OPTION('expandSelectCreateRow',true);
IMPORT KEL011 AS KEL;
IMPORT RQ_Show_All FROM WrobelKEL;
IMPORT * FROM KEL011.Null;
__RoxieQuery := RQ_Show_All;
OUTPUT(__RoxieQuery.Res0,NAMED('Result0'));
OUTPUT(__RoxieQuery.Res1,NAMED('Result1'));
OUTPUT(__RoxieQuery.Res2,NAMED('Result2'));
OUTPUT(__RoxieQuery.Res3,NAMED('Result3'));
OUTPUT(__RoxieQuery.Res4,NAMED('Result4'));
