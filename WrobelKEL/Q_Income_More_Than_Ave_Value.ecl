//HPCC Systems KEL Compiler Version 0.11.2
IMPORT KEL011 AS KEL;
IMPORT E_Person,E_Vehicle FROM WrobelKEL;
IMPORT * FROM KEL011.Null;
EXPORT Q_Income_More_Than_Ave_Value := MODULE
  SHARED TYPEOF(E_Person.__Result) __E_Person := E_Person.__Result;
  SHARED TYPEOF(E_Vehicle.__Result) __E_Vehicle := E_Vehicle.__Result;
  SHARED __EE3804 := __E_Person;
  SHARED __EE3941 := __EE3804._income_;
  SHARED __EE3768 := __E_Vehicle;
  SHARED __EE3899 := __EE3768(__T(__OP2(__EE3768._make_,=,__CN('TOYOTA'))));
  __JC3944(E_Person._income_Layout __EE3941) := __T(__OP2(__EE3941._income_,>,KEL.Aggregates.MaxN(__EE3899,__EE3899._value_)));
  SHARED __EE3945 := __EE3804(EXISTS(__CHILDJOINFILTER(__EE3941,__JC3944)));
  EXPORT Res0 := __UNWRAP(__EE3945);
END;
