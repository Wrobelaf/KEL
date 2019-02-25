//HPCC Systems KEL Compiler Version 0.11.2
#OPTION('expandSelectCreateRow',true);
IMPORT KEL011 AS KEL;
IMPORT CFG_Queries,RQ_Show_Persons FROM WrobelKEL;
IMPORT * FROM KEL011.Null;
KEL.typ.str __Pp_lname := '' : STORED('p_lname');
__RoxieQuery := RQ_Show_Persons(DATASET([{1,__Pp_lname}],CFG_Queries.Show_Persons_Params_Layout));
OUTPUT(__RoxieQuery.Res0,NAMED('Result'));
