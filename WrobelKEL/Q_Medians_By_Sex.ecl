//HPCC Systems KEL Compiler Version 0.11.2
IMPORT KEL011 AS KEL;
IMPORT E_Person FROM WrobelKEL;
IMPORT * FROM KEL011.Null;
EXPORT Q_Medians_By_Sex := MODULE
  SHARED TYPEOF(E_Person.__Result) __E_Person := E_Person.__Result;
  SHARED __EE5891 := __E_Person;
  SHARED __ST6840_Layout := RECORD
    KEL.typ.nstr _sex_;
    KEL.typ.int __RecordCount := 0;
  END;
  SHARED __EE7042 := PROJECT(TABLE(PROJECT(__EE5891,__ST6840_Layout),{KEL.typ.int __RecordCount := SUM(GROUP,__RecordCount),_sex_},_sex_,MERGE),__ST6840_Layout);
  SHARED __EE7005 := __EE5891;
  SHARED __ST6400_Layout := RECORD
    KEL.typ.nuid UID;
    KEL.typ.ndataset(E_Person._name_Layout) _name_;
    KEL.typ.nstr _sex_;
    KEL.typ.ndataset(E_Person._bdate_Layout) _bdate_;
    KEL.typ.ndataset(E_Person._age_Layout) _age_;
    KEL.typ.ndataset(E_Person._income_Layout) _income_;
    KEL.typ.ndataset(E_Person._address_Layout) _address_;
    KEL.typ.nint _age__1_;
    KEL.typ.int __RecordCount := 0;
  END;
  __ST6400_Layout __JT7013(E_Person.Layout __l, E_Person._age_Layout __r) := TRANSFORM
    SELF._age__1_ := __r._age_;
    SELF.__RecordCount := __r.__RecordCount;
    SELF := __l;
    SELF := __r;
  END;
  SHARED __EE7014 := NORMALIZE(__EE7005,__T(LEFT._age_),__JT7013(LEFT,RIGHT));
  SHARED __ST6197_Layout := RECORD
    KEL.typ.nstr _sex_;
    KEL.typ.nint _age_;
    KEL.typ.nuid UID;
  END;
  SHARED __EE7032 := PROJECT(__EE7014,TRANSFORM(__ST6197_Layout,SELF._age_ := LEFT._age__1_,SELF := LEFT));
  SHARED __ST6216_Layout := RECORD
    KEL.typ.nstr _sex_;
    KEL.typ.nint _age_;
  END;
  SHARED __EE6951 := PROJECT(__EE7032,__ST6216_Layout);
  SHARED __ST6231_Layout := RECORD
    KEL.typ.nint M_E_D_I_A_N__age_;
    KEL.typ.nstr _sex_;
  END;
  __ST6231_WeightLayout := {KEL.typ.int M_E_D_I_A_N__age_};
  __ST6231_WeightLayout __ST6231_WeightCalc(KEL.Aggregates.RankedFieldN __r) := TRANSFORM
    SELF.M_E_D_I_A_N__age_ := IF(__r.number = 1,KEL.Aggregates.NTileWeight(2,1,__r.size,__r.pos),0);
  END;
  __ST6231_Layout __ST6231_Normalize(__ST6231_Layout __r) := TRANSFORM
    SELF.M_E_D_I_A_N__age_ := __OP2(__r.M_E_D_I_A_N__age_,/,__CN(2));
    SELF := __r;
  END;
  __RK6958 := KEL.Aggregates.RankingGroupedSmall2(__EE6951,'_age_','_sex_',__ST6231_WeightLayout,__ST6231_Layout,__ST6231_WeightCalc,__ST6231_Normalize,TRUE,FALSE,TRUE);
  SHARED __EE6968 := __RK6958;
  SHARED __ST6851_Layout := RECORD
    KEL.typ.nint M_E_D_I_A_N__age_;
    KEL.typ.nstr _sex__1_;
  END;
  SHARED __EE7056 := PROJECT(__EE6968,TRANSFORM(__ST6851_Layout,SELF._sex__1_ := LEFT._sex_,SELF := LEFT));
  SHARED __ST6870_Layout := RECORD
    KEL.typ.nstr _sex_;
    KEL.typ.nint M_E_D_I_A_N__age_;
    KEL.typ.nstr _sex__1_;
    KEL.typ.int __RecordCount := 0;
  END;
  __JC7065(__ST6840_Layout __EE7042, __ST6851_Layout __EE7056) := __EEQP(__EE7042._sex_,__EE7056._sex__1_);
  __ST6870_Layout __JT7065(__ST6840_Layout __l, __ST6851_Layout __r) := TRANSFORM
    SELF := __l;
    SELF := __r;
  END;
  SHARED __EE7066 := JOIN(__EE7042,__EE7056,__JC7065(LEFT,RIGHT),__JT7065(LEFT,RIGHT),LEFT OUTER,SMART);
  SHARED __EE6973 := __EE5891;
  SHARED __ST6343_Layout := RECORD
    KEL.typ.nuid UID;
    KEL.typ.ndataset(E_Person._name_Layout) _name_;
    KEL.typ.nstr _sex_;
    KEL.typ.ndataset(E_Person._bdate_Layout) _bdate_;
    KEL.typ.ndataset(E_Person._age_Layout) _age_;
    KEL.typ.ndataset(E_Person._income_Layout) _income_;
    KEL.typ.ndataset(E_Person._address_Layout) _address_;
    KEL.typ.nint _income__1_;
    KEL.typ.int __RecordCount := 0;
  END;
  __ST6343_Layout __JT6981(E_Person.Layout __l, E_Person._income_Layout __r) := TRANSFORM
    SELF._income__1_ := __r._income_;
    SELF.__RecordCount := __r.__RecordCount;
    SELF := __l;
    SELF := __r;
  END;
  SHARED __EE6982 := NORMALIZE(__EE6973,__T(LEFT._income_),__JT6981(LEFT,RIGHT));
  SHARED __ST5985_Layout := RECORD
    KEL.typ.nstr _sex_;
    KEL.typ.nint _income_;
    KEL.typ.nuid UID;
  END;
  SHARED __EE7000 := PROJECT(__EE6982,TRANSFORM(__ST5985_Layout,SELF._income_ := LEFT._income__1_,SELF := LEFT));
  SHARED __ST6008_Layout := RECORD
    KEL.typ.nstr _sex_;
    KEL.typ.nint _income_;
  END;
  SHARED __EE6601 := PROJECT(__EE7000,__ST6008_Layout);
  SHARED __ST6026_Layout := RECORD
    KEL.typ.nint M_E_D_I_A_N__income_;
    KEL.typ.nint I_Q_R__income_;
    KEL.typ.nstr _sex_;
  END;
  __ST6026_WeightLayout := {KEL.typ.int M_E_D_I_A_N__income_,KEL.typ.int I_Q_R__income_};
  __ST6026_WeightLayout __ST6026_WeightCalc(KEL.Aggregates.RankedFieldN __r) := TRANSFORM
    SELF.M_E_D_I_A_N__income_ := IF(__r.number = 1,KEL.Aggregates.NTileWeight(2,1,__r.size,__r.pos),0);
    SELF.I_Q_R__income_ := IF(__r.number = 1,KEL.Aggregates.NTileWeight(4,3,__r.size,__r.pos) - KEL.Aggregates.NTileWeight(4,1,__r.size,__r.pos),0);
  END;
  __ST6026_Layout __ST6026_Normalize(__ST6026_Layout __r) := TRANSFORM
    SELF.M_E_D_I_A_N__income_ := __OP2(__r.M_E_D_I_A_N__income_,/,__CN(2));
    SELF.I_Q_R__income_ := __OP2(__r.I_Q_R__income_,/,__CN(4));
    SELF := __r;
  END;
  __RK6925 := KEL.Aggregates.RankingGroupedSmall2(__EE6601,'_income_','_sex_',__ST6026_WeightLayout,__ST6026_Layout,__ST6026_WeightCalc,__ST6026_Normalize,TRUE,FALSE,TRUE);
  SHARED __EE6937 := __RK6925;
  SHARED __ST6522_Layout := RECORD
    KEL.typ.nstr _sex_;
    KEL.typ.nint M_E_D_I_A_N__age_;
    KEL.typ.nstr _sex__1_;
    KEL.typ.nint M_E_D_I_A_N__income_;
    KEL.typ.nint I_Q_R__income_;
    KEL.typ.nstr _sex__2_;
    KEL.typ.int __RecordCount := 0;
  END;
  __JC7075(__ST6870_Layout __EE7066, __ST6026_Layout __EE6937) := __EEQP(__EE7066._sex_,__EE6937._sex_);
  __ST6522_Layout __JT7075(__ST6870_Layout __l, __ST6026_Layout __r) := TRANSFORM
    SELF._sex__2_ := __r._sex_;
    SELF := __l;
    SELF := __r;
  END;
  SHARED __EE7076 := JOIN(__EE7066,__EE6937,__JC7075(LEFT,RIGHT),__JT7075(LEFT,RIGHT),LEFT OUTER,SMART);
  SHARED __ST544_Layout := RECORD
    KEL.typ.nstr _sex_;
    KEL.typ.nint M__income_;
    KEL.typ.nint I_Q_R__income_;
    KEL.typ.nint M__age_;
    KEL.typ.int __RecordCount := 0;
  END;
  SHARED __ST544_Layout __ND6903__Project(__ST6522_Layout __PP6890) := TRANSFORM
    SELF.M__income_ := __PP6890.M_E_D_I_A_N__income_;
    SELF.M__age_ := __PP6890.M_E_D_I_A_N__age_;
    SELF := __PP6890;
  END;
  EXPORT Res0 := __UNWRAP(PROJECT(__EE7076,__ND6903__Project(LEFT)));
END;
