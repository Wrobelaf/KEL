//HPCC Systems KEL Compiler Version 0.11.2
IMPORT KEL011 AS KEL;
IMPORT B_Person,E_Person FROM WrobelKEL;
IMPORT * FROM KEL011.Null;
EXPORT RQ_Highest_Income := MODULE
  SHARED __EE13543 := B_Person.IDX_Person_UID_Wrapped;
  SHARED __EE13619 := __EE13543._income_;
  SHARED __EE13651 := __EE13543;
  SHARED __EE13672 := NORMALIZE(__EE13651,__T(LEFT._income_),TRANSFORM(E_Person._income_Layout,SELF:=RIGHT));
  __JC13684(E_Person._income_Layout __EE13619) := __T(__OP2(__EE13619._income_,=,KEL.Aggregates.MaxN(__EE13672,__EE13672._income_)));
  SHARED __EE13685 := __EE13543(EXISTS(__CHILDJOINFILTER(__EE13619,__JC13684)));
  EXPORT Res0 := __UNWRAP(__EE13685);
END;
