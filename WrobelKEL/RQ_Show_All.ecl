//HPCC Systems KEL Compiler Version 0.11.2
IMPORT KEL011 AS KEL;
IMPORT B_Claim,B_Claim_For,B_Owns,B_Person,B_Vehicle,E_Claim,E_Claim_For,E_Owns,E_Person,E_Vehicle FROM WrobelKEL;
IMPORT * FROM KEL011.Null;
EXPORT RQ_Show_All := MODULE
  SHARED __EE12522 := B_Person.IDX_Person_UID_Wrapped;
  SHARED __EE12524 := __EE12522;
  EXPORT Res0 := __UNWRAP(__EE12524);
  SHARED __EE12527 := B_Vehicle.IDX_Vehicle_UID_Wrapped;
  SHARED __EE12529 := __EE12527;
  EXPORT Res1 := __UNWRAP(__EE12529);
  SHARED __EE12532 := B_Claim.IDX_Claim_UID_Wrapped;
  SHARED __EE12534 := __EE12532;
  EXPORT Res2 := __UNWRAP(__EE12534);
  SHARED __EE12537 := B_Owns.IDX_Owns__owner__Wrapped;
  SHARED __EE12539 := __EE12537;
  EXPORT Res3 := __UNWRAP(__EE12539);
  SHARED __EE12542 := B_Claim_For.IDX_Claim_For__claim__Wrapped;
  EXPORT Res4 := __UNWRAP(__EE12542);
END;
