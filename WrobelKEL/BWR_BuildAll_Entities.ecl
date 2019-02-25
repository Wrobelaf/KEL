//HPCC Systems KEL Compiler Version 0.10.0-1
#OPTION('expandSelectCreateRow',true);
IMPORT KEL010 AS KEL;
IMPORT B_Claim,B_Claim_For,B_Owns,B_Person,B_Vehicle FROM WrobelKEL;
IMPORT * FROM KEL010.Null;
PARALLEL(B_Claim.BuildAll,B_Claim_For.BuildAll,B_Owns.BuildAll,B_Person.BuildAll,B_Vehicle.BuildAll);
