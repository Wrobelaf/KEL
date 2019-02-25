//HPCC Systems KEL Compiler Version 0.11.2
IMPORT KEL011 AS KEL;
IMPORT B_Person,B_Vehicle,E_Person,E_Vehicle FROM WrobelKEL;
IMPORT * FROM KEL011.Null;
EXPORT RQ_Income_More_Than_Ave_Value := MODULE
  SHARED __EE10214 := B_Person.IDX_Person_UID_Wrapped;
  SHARED __EE10229 := __EE10214._income_;
  SHARED __EE10027 := B_Vehicle.IDX_Vehicle__make_;
  SHARED __EE10137 := __EE10027(KEL.Indexing.FKey(__EE10027._make_) = KEL.Indexing.HKey('TOYOTA') AND KEL.Indexing.VKey(__EE10027._make_) = 'TOYOTA');
  SHARED __EE10139 := B_Vehicle.IDX_Vehicle_UID;
  __JC10149(B_Vehicle.__ST7032_Layout __EE10137, B_Vehicle.__ST7018_Layout __EE10139) := __T(__EE10137.UID) = __EE10139.UID;
  SHARED __EE10150 := JOIN(__EE10137,__EE10139,__JC10149(LEFT,RIGHT),TRANSFORM(B_Vehicle.__ST7018_Layout,SELF:=RIGHT),HASH,KEEP(1));
  SHARED __EE10197 := PROJECT(__EE10150,TRANSFORM(E_Vehicle.Layout,SELF.UID := __CN(LEFT.UID),SELF := LEFT));
  __JC10232(E_Person._income_Layout __EE10229) := __T(__OP2(__EE10229._income_,>,KEL.Aggregates.MaxN(__EE10197,__EE10197._value_)));
  SHARED __EE10233 := __EE10214(EXISTS(__CHILDJOINFILTER(__EE10229,__JC10232)));
  EXPORT Res0 := __UNWRAP(__EE10233);
END;
