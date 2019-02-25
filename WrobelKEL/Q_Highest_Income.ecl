//HPCC Systems KEL Compiler Version 0.11.2
IMPORT KEL011 AS KEL;
IMPORT E_Person FROM WrobelKEL;
IMPORT * FROM KEL011.Null;
EXPORT Q_Highest_Income := MODULE
  SHARED TYPEOF(E_Person.__Result) __E_Person := E_Person.__Result;
  SHARED __EE1774 := __E_Person;
  SHARED __EE1699 := __EE1774._income_;
  SHARED __EE1928 := __EE1774;
  SHARED __EE1949 := NORMALIZE(__EE1928,__T(LEFT._income_),TRANSFORM(E_Person._income_Layout,SELF:=RIGHT));
  __JC1961(E_Person._income_Layout __EE1699) := __T(__OP2(__EE1699._income_,=,KEL.Aggregates.MaxN(__EE1949,__EE1949._income_)));
  SHARED __EE1962 := __EE1774(EXISTS(__CHILDJOINFILTER(__EE1699,__JC1961)));
  EXPORT Res0 := __UNWRAP(__EE1962);
END;
