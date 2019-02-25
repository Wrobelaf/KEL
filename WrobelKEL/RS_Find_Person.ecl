//HPCC Systems KEL Compiler Version 0.11.2
#OPTION('expandSelectCreateRow',true);
IMPORT KEL011 AS KEL;
IMPORT CFG_Queries,RQ_Find_Person FROM WrobelKEL;
IMPORT * FROM KEL011.Null;
KEL.typ.str __Pifname := '' : STORED('ifname');
__RoxieQuery := RQ_Find_Person(DATASET([{1,__Pifname}],CFG_Queries.Find_Person_Params_Layout));
OUTPUT(__RoxieQuery.Res0,NAMED('Result'));
