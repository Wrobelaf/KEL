//HPCC Systems KEL Compiler Version 0.11.2
#OPTION('expandSelectCreateRow',true);
IMPORT KEL011 AS KEL;
IMPORT * FROM KEL011.Null;
IMPORT * FROM WrobelKEL;

OUTPUT(Q_Show_Persons('RIOS').Res0,NAMED('ShowPersons_0'));

