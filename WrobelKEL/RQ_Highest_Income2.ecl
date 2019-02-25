//HPCC Systems KEL Compiler Version 0.11.2
IMPORT KEL011 AS KEL;
IMPORT B_Person,E_Person FROM WrobelKEL;
IMPORT * FROM KEL011.Null;
EXPORT RQ_Highest_Income2 := MODULE
  SHARED __EE14313 := B_Person.IDX_Person_UID_Wrapped;
  SHARED __EE14389 := __EE14313._income_;
  SHARED __EE14421 := __EE14313;
  SHARED __EE14442 := NORMALIZE(__EE14421,__T(LEFT._income_),TRANSFORM(E_Person._income_Layout,SELF:=RIGHT));
  __JC14454(E_Person._income_Layout __EE14389) := __T(__OP2(__EE14389._income_,=,KEL.Aggregates.MaxN(__EE14442,__EE14442._income_)));
  SHARED __EE14455 := __EE14313(EXISTS(__CHILDJOINFILTER(__EE14389,__JC14454)));
  EXPORT Res0 := __UNWRAP(__EE14455);
END;
