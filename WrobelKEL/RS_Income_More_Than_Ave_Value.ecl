﻿//HPCC Systems KEL Compiler Version 0.11.2
#OPTION('expandSelectCreateRow',true);
IMPORT KEL011 AS KEL;
IMPORT RQ_Income_More_Than_Ave_Value FROM WrobelKEL;
IMPORT * FROM KEL011.Null;
__RoxieQuery := RQ_Income_More_Than_Ave_Value;
OUTPUT(__RoxieQuery.Res0,NAMED('Result'));
