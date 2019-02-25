//HPCC Systems KEL Compiler Version 0.11.2
IMPORT KEL011 AS KEL;
IMPORT E_Person FROM WrobelKEL;
IMPORT * FROM KEL011.Null;
EXPORT Q_Lowest5_Earners_By_Sex := MODULE
  SHARED TYPEOF(E_Person.__Result) __E_Person := E_Person.__Result;
  SHARED __EE4218 := __E_Person;
  SHARED __EE5282 := __EE4218;
  SHARED __ST4651_Layout := RECORD
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
  __ST4651_Layout __JT5290(E_Person.Layout __l, E_Person._income_Layout __r) := TRANSFORM
    SELF._income__1_ := __r._income_;
    SELF.__RecordCount := __r.__RecordCount;
    SELF := __l;
    SELF := __r;
  END;
  SHARED __EE5291 := NORMALIZE(__EE5282,__T(LEFT._income_),__JT5290(LEFT,RIGHT));
  SHARED __ST4306_Layout := RECORD
    KEL.typ.nstr _sex_;
    KEL.typ.nint _income_;
    KEL.typ.nuid UID;
  END;
  SHARED __EE5309 := PROJECT(__EE5291,TRANSFORM(__ST4306_Layout,SELF._income_ := LEFT._income__1_,SELF := LEFT));
  SHARED __ST4325_Layout := RECORD
    KEL.typ.nstr _sex_;
    KEL.typ.nint _income_;
  END;
  SHARED __EE4826 := PROJECT(__EE5309,__ST4325_Layout);
  SHARED __ST4340_Layout := RECORD
    KEL.typ.nint R_A_N_K__income_;
    KEL.typ.nstr _sex_;
  END;
  __ST4340_WeightLayout := {KEL.typ.int R_A_N_K__income_};
  __ST4340_WeightLayout __ST4340_WeightCalc(KEL.Aggregates.RankedFieldN __r) := TRANSFORM
    SELF.R_A_N_K__income_ := IF(__r.number = 1,KEL.Aggregates.RankWeight(5,__r.size,__r.pos),0);
  END;
  __ST4340_Layout __ST4340_Normalize(__ST4340_Layout __r) := TRANSFORM
    SELF := __r;
  END;
  __RK5270 := KEL.Aggregates.RankingGroupedSmall2(__EE4826,'_income_','_sex_',__ST4340_WeightLayout,__ST4340_Layout,__ST4340_WeightCalc,__ST4340_Normalize,TRUE,FALSE,TRUE);
  SHARED __EE5277 := __RK5270;
  SHARED __ST4711_Layout := RECORD
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
  __JC5318(E_Person.Layout __EE4218, __ST4340_Layout __EE5277) := __EEQP(__EE4218._sex_,__EE5277._sex_);
  __ST4711_Layout __JT5318(E_Person.Layout __l, __ST4340_Layout __r) := TRANSFORM
    SELF._sex__1_ := __r._sex_;
    SELF := __l;
    SELF := __r;
  END;
  SHARED __EE5319 := JOIN(__EE4218,__EE5277,__JC5318(LEFT,RIGHT),__JT5318(LEFT,RIGHT),LEFT OUTER,SMART);
  SHARED __ST4394_Layout := RECORD
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
  SHARED __EE5387 := PROJECT(__EE5319,__ST4394_Layout);
  SHARED __EE5398 := __EE5387._income_;
  __JC5401(E_Person._income_Layout __EE5398) := __T(__OP2(__EE5398._income_,<=,__EE5387.R_A_N_K__income_));
  SHARED __EE5402 := __EE5387(EXISTS(__CHILDJOINFILTER(__EE5398,__JC5401)));
  EXPORT Res0 := __UNWRAP(PROJECT(__EE5402,E_Person.Layout));
END;
