//HPCC Systems KEL Compiler Version 0.11.2
IMPORT KEL011 AS KEL;
IMPORT B_Claim,B_Claim_For,B_Owns,B_Person,B_Vehicle FROM WrobelKEL;
IMPORT * FROM KEL011.Null;
EXPORT B_BuildAll_Queries := MODULE
  EXPORT BuildAll := PARALLEL(B_Claim.BuildAll,B_Claim_For.BuildAll,B_Owns.BuildAll,B_Person.BuildAll,B_Vehicle.BuildAll);
END;
