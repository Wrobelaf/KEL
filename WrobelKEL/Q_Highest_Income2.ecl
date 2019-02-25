//HPCC Systems KEL Compiler Version 0.11.2
IMPORT KEL011 AS KEL;
IMPORT E_Person FROM WrobelKEL;
IMPORT * FROM KEL011.Null;
EXPORT Q_Highest_Income2 := MODULE
  SHARED TYPEOF(E_Person.__Result) __E_Person := E_Person.__Result;
  SHARED __EE3056 := __E_Person;
  SHARED __EE2982 := __EE3056._income_;
  SHARED __EE3210 := __EE3056;
  SHARED __EE3231 := NORMALIZE(__EE3210,__T(LEFT._income_),TRANSFORM(E_Person._income_Layout,SELF:=RIGHT));
  __JC3243(E_Person._income_Layout __EE2982) := __T(__OP2(__EE2982._income_,=,KEL.Aggregates.MaxN(__EE3231,__EE3231._income_)));
  SHARED __EE3244 := __EE3056(EXISTS(__CHILDJOINFILTER(__EE2982,__JC3243)));
  EXPORT Res0 := __UNWRAP(__EE3244);
END;
