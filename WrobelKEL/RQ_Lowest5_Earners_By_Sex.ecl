//HPCC Systems KEL Compiler Version 0.11.2
IMPORT KEL011 AS KEL;
IMPORT B_Person,E_Person FROM WrobelKEL;
IMPORT * FROM KEL011.Null;
EXPORT RQ_Lowest5_Earners_By_Sex := MODULE
  SHARED __EE15749 := B_Person.IDX_Person_UID_Wrapped;
  SHARED __EE15757 := __EE15749;
  SHARED __ST10835_Layout := RECORD
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
  __ST10835_Layout __JT15771(E_Person.Layout __l, E_Person._income_Layout __r) := TRANSFORM
    SELF._income__1_ := __r._income_;
    SELF.__RecordCount := __r.__RecordCount;
    SELF := __l;
    SELF := __r;
  END;
  SHARED __EE15772 := NORMALIZE(__EE15757,__T(LEFT._income_),__JT15771(LEFT,RIGHT));
  SHARED __ST10490_Layout := RECORD
    KEL.typ.nstr _sex_;
    KEL.typ.nint _income_;
    KEL.typ.nuid UID;
  END;
  SHARED __EE15816 := PROJECT(__EE15772,TRANSFORM(__ST10490_Layout,SELF._income_ := LEFT._income__1_,SELF := LEFT));
  SHARED __ST10509_Layout := RECORD
    KEL.typ.nstr _sex_;
    KEL.typ.nint _income_;
  END;
  SHARED __EE15830 := PROJECT(__EE15816,__ST10509_Layout);
  SHARED __ST10524_Layout := RECORD
    KEL.typ.nint R_A_N_K__income_;
    KEL.typ.nstr _sex_;
  END;
  __ST10524_WeightLayout := {KEL.typ.int R_A_N_K__income_};
  __ST10524_WeightLayout __ST10524_WeightCalc(KEL.Aggregates.RankedFieldN __r) := TRANSFORM
    SELF.R_A_N_K__income_ := IF(__r.number = 1,KEL.Aggregates.RankWeight(5,__r.size,__r.pos),0);
  END;
  __ST10524_Layout __ST10524_Normalize(__ST10524_Layout __r) := TRANSFORM
    SELF := __r;
  END;
  __RK16055 := KEL.Aggregates.RankingGroupedSmall2(__EE15830,'_income_','_sex_',__ST10524_WeightLayout,__ST10524_Layout,__ST10524_WeightCalc,__ST10524_Normalize,TRUE,FALSE,TRUE);
  SHARED __EE16062 := __RK16055;
  SHARED __ST10895_Layout := RECORD
    KEL.typ.nuid UID;
    KEL.typ.ndataset(E_Person._name_Layout) _name_;
    KEL.typ.nstr _sex_;
    KEL.typ.ndataset(E_Person._bdate_Layout) _bdate_;
    KEL.typ.ndataset(E_Person._age_Layout) _age_;
    KEL.typ.ndataset(E_Person._income_Layout) _income_;
    KEL.typ.ndataset(E_Person._address_Layout) _address_;
    KEL.typ.nint R_A_N_K__income_;
    KEL.typ.nstr _sex__1_;
    KEL.typ.int __RecordCount := 0;
  END;
  __JC16071(E_Person.Layout __EE15749, __ST10524_Layout __EE16062) := __EEQP(__EE15749._sex_,__EE16062._sex_);
  __ST10895_Layout __JT16071(E_Person.Layout __l, __ST10524_Layout __r) := TRANSFORM
    SELF._sex__1_ := __r._sex_;
    SELF := __l;
    SELF := __r;
  END;
  SHARED __EE16072 := JOIN(__EE15749,__EE16062,__JC16071(LEFT,RIGHT),__JT16071(LEFT,RIGHT),LEFT OUTER,SMART);
  SHARED __ST10578_Layout := RECORD
    KEL.typ.nuid UID;
    KEL.typ.ndataset(E_Person._name_Layout) _name_;
    KEL.typ.nstr _sex_;
    KEL.typ.ndataset(E_Person._bdate_Layout) _bdate_;
    KEL.typ.ndataset(E_Person._age_Layout) _age_;
    KEL.typ.ndataset(E_Person._income_Layout) _income_;
    KEL.typ.ndataset(E_Person._address_Layout) _address_;
    KEL.typ.nint R_A_N_K__income_;
    KEL.typ.int __RecordCount := 0;
  END;
  SHARED __EE16211 := PROJECT(__EE16072,__ST10578_Layout);
  SHARED __EE16243 := __EE16211._income_;
  __JC16245(E_Person._income_Layout __EE16243) := __T(__OP2(__EE16243._income_,<=,__EE16211.R_A_N_K__income_));
  SHARED __EE16270 := __EE16211(EXISTS(__CHILDJOINFILTER(__EE16243,__JC16245)));
  EXPORT Res0 := __UNWRAP(PROJECT(__EE16270,E_Person.Layout));
END;
