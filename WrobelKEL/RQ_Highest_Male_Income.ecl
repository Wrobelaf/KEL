//HPCC Systems KEL Compiler Version 0.11.2
IMPORT KEL011 AS KEL;
IMPORT B_Person,E_Person FROM WrobelKEL;
IMPORT * FROM KEL011.Null;
EXPORT RQ_Highest_Male_Income := MODULE
  SHARED __EE14508 := B_Person.IDX_Person__sex_;
  SHARED __EE14775 := __EE14508(KEL.Indexing.FKey(__EE14508._sex_) = KEL.Indexing.HKey('M') AND KEL.Indexing.VKey(__EE14508._sex_) = 'M');
  SHARED __EE14777 := B_Person.IDX_Person_UID;
  __JC14787(B_Person.__ST12472_Layout __EE14775, B_Person.__ST12441_Layout __EE14777) := __T(__EE14775.UID) = __EE14777.UID;
  SHARED __EE14788 := JOIN(__EE14775,__EE14777,__JC14787(LEFT,RIGHT),TRANSFORM(B_Person.__ST12441_Layout,SELF:=RIGHT),HASH,KEEP(1));
  SHARED __EE15318 := PROJECT(__EE14788,TRANSFORM(E_Person.Layout,SELF.UID := __CN(LEFT.UID),SELF := LEFT));
  SHARED __EE15353 := __EE15318._income_;
  SHARED __EE15334 := __EE15318;
  SHARED __EE15346 := NORMALIZE(__EE15334,__T(LEFT._income_),TRANSFORM(E_Person._income_Layout,SELF:=RIGHT));
  __JC15356(E_Person._income_Layout __EE15353) := __T(__OP2(__EE15353._income_,=,KEL.Aggregates.MaxN(__EE15346,__EE15346._income_)));
  SHARED __EE15357 := __EE15318(EXISTS(__CHILDJOINFILTER(__EE15353,__JC15356)));
  EXPORT Res0 := __UNWRAP(__EE15357);
END;
