//HPCC Systems KEL Compiler Version 0.11.2
#OPTION('expandSelectCreateRow',true);
IMPORT KEL011 AS KEL;
IMPORT RQ_Show_Names_And_Vehs FROM WrobelKEL;
IMPORT * FROM KEL011.Null;
__RoxieQuery := RQ_Show_Names_And_Vehs;
OUTPUT(__RoxieQuery.Res0,NAMED('Result'));
