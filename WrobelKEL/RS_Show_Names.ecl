//HPCC Systems KEL Compiler Version 0.11.2
#OPTION('expandSelectCreateRow',true);
IMPORT KEL011 AS KEL;
IMPORT RQ_Show_Names FROM WrobelKEL;
IMPORT * FROM KEL011.Null;
__RoxieQuery := RQ_Show_Names;
OUTPUT(__RoxieQuery.Res0,NAMED('Result'));
