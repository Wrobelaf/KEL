//HPCC Systems KEL Compiler Version 0.11.2
IMPORT KEL011 AS KEL;
IMPORT E_Person FROM WrobelKEL;
IMPORT * FROM KEL011.Null;
EXPORT Q_Highest_Male_Income := MODULE
  SHARED TYPEOF(E_Person.__Result) __E_Person := E_Person.__Result;
  SHARED __EE3402 := __E_Person;
  SHARED __EE3748 := __EE3402(__T(__OP2(__EE3402._sex_,=,__CN('M'))));
  SHARED __EE3783 := __EE3748._income_;
  SHARED __EE3764 := __EE3748;
  SHARED __EE3776 := NORMALIZE(__EE3764,__T(LEFT._income_),TRANSFORM(E_Person._income_Layout,SELF:=RIGHT));
  __JC3786(E_Person._income_Layout __EE3783) := __T(__OP2(__EE3783._income_,=,KEL.Aggregates.MaxN(__EE3776,__EE3776._income_)));
  SHARED __EE3787 := __EE3748(EXISTS(__CHILDJOINFILTER(__EE3783,__JC3786)));
  EXPORT Res0 := __UNWRAP(__EE3787);
END;
