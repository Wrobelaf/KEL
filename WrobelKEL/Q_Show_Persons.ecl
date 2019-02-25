//HPCC Systems KEL Compiler Version 0.11.2
IMPORT KEL011 AS KEL;
IMPORT E_Person,FN_Queries FROM WrobelKEL;
IMPORT * FROM KEL011.Null;
EXPORT Q_Show_Persons(KEL.typ.str __Pp_lname) := MODULE
  SHARED TYPEOF(E_Person.__Result) __E_Person := E_Person.__Result;
  SHARED __EE612 := __E_Person;
  SHARED __EE600 := __EE612._name_;
  __JC657(E_Person._name_Layout __EE600) := __T(FN_Queries.FN_R_E_G_E_X_F_I_N_D(__ECAST(KEL.typ.nstr,__CN(__Pp_lname)),__ECAST(KEL.typ.nstr,__EE600._lname_)));
  SHARED __EE658 := __EE612(EXISTS(__CHILDJOINFILTER(__EE600,__JC657)));
  EXPORT Res0 := __UNWRAP(__EE658);
END;
