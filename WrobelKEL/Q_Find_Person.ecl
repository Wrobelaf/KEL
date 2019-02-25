//HPCC Systems KEL Compiler Version 0.11.2
IMPORT KEL011 AS KEL;
IMPORT E_Person FROM WrobelKEL;
IMPORT * FROM KEL011.Null;
EXPORT Q_Find_Person(KEL.typ.str __Pifname) := MODULE
  SHARED TYPEOF(E_Person.__Result) __E_Person := E_Person.__Result;
  SHARED __EE232 := __E_Person;
  SHARED __EE220 := __EE232._name_;
  __JC277(E_Person._name_Layout __EE220) := __T(__OP2(__EE220._fname_,=,__CN(__Pifname)));
  SHARED __EE278 := __EE232(EXISTS(__CHILDJOINFILTER(__EE220,__JC277)));
  EXPORT Res0 := __UNWRAP(__EE278);
END;
