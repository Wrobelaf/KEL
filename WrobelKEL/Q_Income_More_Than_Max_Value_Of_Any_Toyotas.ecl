//HPCC Systems KEL Compiler Version 0.11.2
IMPORT KEL011 AS KEL;
IMPORT E_Person,E_Vehicle FROM WrobelKEL;
IMPORT * FROM KEL011.Null;
EXPORT Q_Income_More_Than_Max_Value_Of_Any_Toyotas := MODULE
  SHARED TYPEOF(E_Person.__Result) __E_Person := E_Person.__Result;
  SHARED TYPEOF(E_Vehicle.__Result) __E_Vehicle := E_Vehicle.__Result;
  SHARED __EE3903 := __E_Person;
  SHARED __EE4040 := __EE3903._income_;
  SHARED __EE3867 := __E_Vehicle;
  SHARED __EE3998 := __EE3867(__T(__OP2(__EE3867._make_,=,__CN('TOYOTA'))));
  __JC4043(E_Person._income_Layout __EE4040) := __T(__OP2(__EE4040._income_,>,KEL.Aggregates.MaxN(__EE3998,__EE3998._value_)));
  SHARED __EE4044 := __EE3903(EXISTS(__CHILDJOINFILTER(__EE4040,__JC4043)));
  EXPORT Res0 := __UNWRAP(__EE4044);
END;
