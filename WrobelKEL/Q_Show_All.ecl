//HPCC Systems KEL Compiler Version 0.11.2
IMPORT KEL011 AS KEL;
IMPORT E_Claim,E_Claim_For,E_Owns,E_Person,E_Vehicle FROM WrobelKEL;
IMPORT * FROM KEL011.Null;
EXPORT Q_Show_All := MODULE
  SHARED TYPEOF(E_Claim.__Result) __E_Claim := E_Claim.__Result;
  SHARED TYPEOF(E_Claim_For.__Result) __E_Claim_For := E_Claim_For.__Result;
  SHARED TYPEOF(E_Owns.__Result) __E_Owns := E_Owns.__Result;
  SHARED TYPEOF(E_Person.__Result) __E_Person := E_Person.__Result;
  SHARED TYPEOF(E_Vehicle.__Result) __E_Vehicle := E_Vehicle.__Result;
  SHARED __EE570 := __E_Person;
  SHARED __EE572 := __EE570;
  EXPORT Res0 := __UNWRAP(__EE572);
  SHARED __EE574 := __E_Vehicle;
  SHARED __EE576 := __EE574;
  EXPORT Res1 := __UNWRAP(__EE576);
  SHARED __EE578 := __E_Claim;
  SHARED __EE580 := __EE578;
  EXPORT Res2 := __UNWRAP(__EE580);
  SHARED __EE582 := __E_Owns;
  SHARED __EE584 := __EE582;
  EXPORT Res3 := __UNWRAP(__EE584);
  SHARED __EE586 := __E_Claim_For;
  EXPORT Res4 := __UNWRAP(__EE586);
END;
