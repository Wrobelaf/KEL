//HPCC Systems KEL Compiler Version 0.11.2
IMPORT KEL011 AS KEL;
IMPORT B_Person,B_Vehicle,E_Person,E_Vehicle FROM WrobelKEL;
IMPORT * FROM KEL011.Null;
EXPORT RQ_Income_More_Than_Max_Value_Of_Any_Toyotas := MODULE
  SHARED __EE15646 := B_Person.IDX_Person_UID_Wrapped;
  SHARED __EE15661 := __EE15646._income_;
  SHARED __EE15459 := B_Vehicle.IDX_Vehicle__make_;
  SHARED __EE15569 := __EE15459(KEL.Indexing.FKey(__EE15459._make_) = KEL.Indexing.HKey('TOYOTA') AND KEL.Indexing.VKey(__EE15459._make_) = 'TOYOTA');
  SHARED __EE15571 := B_Vehicle.IDX_Vehicle_UID;
  __JC15581(B_Vehicle.__ST12509_Layout __EE15569, B_Vehicle.__ST12495_Layout __EE15571) := __T(__EE15569.UID) = __EE15571.UID;
  SHARED __EE15582 := JOIN(__EE15569,__EE15571,__JC15581(LEFT,RIGHT),TRANSFORM(B_Vehicle.__ST12495_Layout,SELF:=RIGHT),HASH,KEEP(1));
  SHARED __EE15629 := PROJECT(__EE15582,TRANSFORM(E_Vehicle.Layout,SELF.UID := __CN(LEFT.UID),SELF := LEFT));
  __JC15664(E_Person._income_Layout __EE15661) := __T(__OP2(__EE15661._income_,>,KEL.Aggregates.MaxN(__EE15629,__EE15629._value_)));
  SHARED __EE15665 := __EE15646(EXISTS(__CHILDJOINFILTER(__EE15661,__JC15664)));
  EXPORT Res0 := __UNWRAP(__EE15665);
END;
