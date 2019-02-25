//HPCC Systems KEL Compiler Version 0.11.2
IMPORT KEL011 AS KEL;
IMPORT B_Person,E_Person FROM WrobelKEL;
IMPORT * FROM KEL011.Null;
EXPORT RQ_Medians_By_Sex := MODULE
  SHARED __EE16498 := B_Person.IDX_Person_UID_Wrapped;
  SHARED __ST16978_Layout := RECORD
    KEL.typ.nstr _sex_;
    KEL.typ.int __RecordCount := 0;
  END;
  SHARED __EE16981 := PROJECT(TABLE(PROJECT(__EE16498,__ST16978_Layout),{KEL.typ.int __RecordCount := SUM(GROUP,__RecordCount),_sex_},_sex_,MERGE),__ST16978_Layout);
  SHARED __EE16502 := __EE16498;
  SHARED __ST12060_Layout := RECORD
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
  __ST12060_Layout __JT16516(E_Person.Layout __l, E_Person._age_Layout __r) := TRANSFORM
    SELF._age__1_ := __r._age_;
    SELF.__RecordCount := __r.__RecordCount;
    SELF := __l;
    SELF := __r;
  END;
  SHARED __EE16517 := NORMALIZE(__EE16502,__T(LEFT._age_),__JT16516(LEFT,RIGHT));
  SHARED __ST11857_Layout := RECORD
    KEL.typ.nstr _sex_;
    KEL.typ.nint _age_;
    KEL.typ.nuid UID;
  END;
  SHARED __EE16561 := PROJECT(__EE16517,TRANSFORM(__ST11857_Layout,SELF._age_ := LEFT._age__1_,SELF := LEFT));
  SHARED __ST11876_Layout := RECORD
    KEL.typ.nstr _sex_;
    KEL.typ.nint _age_;
  END;
  SHARED __EE16575 := PROJECT(__EE16561,__ST11876_Layout);
  SHARED __ST11891_Layout := RECORD
    KEL.typ.nint M_E_D_I_A_N__age_;
    KEL.typ.nstr _sex_;
  END;
  __ST11891_WeightLayout := {KEL.typ.int M_E_D_I_A_N__age_};
  __ST11891_WeightLayout __ST11891_WeightCalc(KEL.Aggregates.RankedFieldN __r) := TRANSFORM
    SELF.M_E_D_I_A_N__age_ := IF(__r.number = 1,KEL.Aggregates.NTileWeight(2,1,__r.size,__r.pos),0);
  END;
  __ST11891_Layout __ST11891_Normalize(__ST11891_Layout __r) := TRANSFORM
    SELF.M_E_D_I_A_N__age_ := __OP2(__r.M_E_D_I_A_N__age_,/,__CN(2));
    SELF := __r;
  END;
  __RK16791 := KEL.Aggregates.RankingGroupedSmall2(__EE16575,'_age_','_sex_',__ST11891_WeightLayout,__ST11891_Layout,__ST11891_WeightCalc,__ST11891_Normalize,TRUE,FALSE,TRUE);
  SHARED __EE16798 := __RK16791;
  SHARED __ST16989_Layout := RECORD
    KEL.typ.nint M_E_D_I_A_N__age_;
    KEL.typ.nstr _sex__1_;
  END;
  SHARED __EE16993 := PROJECT(__EE16798,TRANSFORM(__ST16989_Layout,SELF._sex__1_ := LEFT._sex_,SELF := LEFT));
  SHARED __ST17008_Layout := RECORD
    KEL.typ.nstr _sex_;
    KEL.typ.nint M_E_D_I_A_N__age_;
    KEL.typ.nstr _sex__1_;
    KEL.typ.int __RecordCount := 0;
  END;
  __JC17000(__ST16978_Layout __EE16981, __ST16989_Layout __EE16993) := __EEQP(__EE16981._sex_,__EE16993._sex__1_);
  __ST17008_Layout __JT17000(__ST16978_Layout __l, __ST16989_Layout __r) := TRANSFORM
    SELF := __l;
    SELF := __r;
  END;
  SHARED __EE17006 := JOIN(__EE16981,__EE16993,__JC17000(LEFT,RIGHT),__JT17000(LEFT,RIGHT),LEFT OUTER,SMART);
  SHARED __EE16810 := __EE16498;
  SHARED __ST12003_Layout := RECORD
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
  __ST12003_Layout __JT16821(E_Person.Layout __l, E_Person._income_Layout __r) := TRANSFORM
    SELF._income__1_ := __r._income_;
    SELF.__RecordCount := __r.__RecordCount;
    SELF := __l;
    SELF := __r;
  END;
  SHARED __EE16822 := NORMALIZE(__EE16810,__T(LEFT._income_),__JT16821(LEFT,RIGHT));
  SHARED __ST11645_Layout := RECORD
    KEL.typ.nstr _sex_;
    KEL.typ.nint _income_;
    KEL.typ.nuid UID;
  END;
  SHARED __EE16840 := PROJECT(__EE16822,TRANSFORM(__ST11645_Layout,SELF._income_ := LEFT._income__1_,SELF := LEFT));
  SHARED __ST11668_Layout := RECORD
    KEL.typ.nstr _sex_;
    KEL.typ.nint _income_;
  END;
  SHARED __EE16854 := PROJECT(__EE16840,__ST11668_Layout);
  SHARED __ST11686_Layout := RECORD
    KEL.typ.nint M_E_D_I_A_N__income_;
    KEL.typ.nint I_Q_R__income_;
    KEL.typ.nstr _sex_;
  END;
  __ST11686_WeightLayout := {KEL.typ.int M_E_D_I_A_N__income_,KEL.typ.int I_Q_R__income_};
  __ST11686_WeightLayout __ST11686_WeightCalc(KEL.Aggregates.RankedFieldN __r) := TRANSFORM
    SELF.M_E_D_I_A_N__income_ := IF(__r.number = 1,KEL.Aggregates.NTileWeight(2,1,__r.size,__r.pos),0);
    SELF.I_Q_R__income_ := IF(__r.number = 1,KEL.Aggregates.NTileWeight(4,3,__r.size,__r.pos) - KEL.Aggregates.NTileWeight(4,1,__r.size,__r.pos),0);
  END;
  __ST11686_Layout __ST11686_Normalize(__ST11686_Layout __r) := TRANSFORM
    SELF.M_E_D_I_A_N__income_ := __OP2(__r.M_E_D_I_A_N__income_,/,__CN(2));
    SELF.I_Q_R__income_ := __OP2(__r.I_Q_R__income_,/,__CN(4));
    SELF := __r;
  END;
  __RK16861 := KEL.Aggregates.RankingGroupedSmall2(__EE16854,'_income_','_sex_',__ST11686_WeightLayout,__ST11686_Layout,__ST11686_WeightCalc,__ST11686_Normalize,TRUE,FALSE,TRUE);
  SHARED __EE16877 := __RK16861;
  SHARED __ST12182_Layout := RECORD
    KEL.typ.nstr _sex_;
    KEL.typ.nint M_E_D_I_A_N__age_;
    KEL.typ.nstr _sex__1_;
    KEL.typ.nint M_E_D_I_A_N__income_;
    KEL.typ.nint I_Q_R__income_;
    KEL.typ.nstr _sex__2_;
    KEL.typ.int __RecordCount := 0;
  END;
  __JC17017(__ST17008_Layout __EE17006, __ST11686_Layout __EE16877) := __EEQP(__EE17006._sex_,__EE16877._sex_);
  __ST12182_Layout __JT17017(__ST17008_Layout __l, __ST11686_Layout __r) := TRANSFORM
    SELF._sex__2_ := __r._sex_;
    SELF := __l;
    SELF := __r;
  END;
  SHARED __EE17027 := JOIN(__EE17006,__EE16877,__JC17017(LEFT,RIGHT),__JT17017(LEFT,RIGHT),LEFT OUTER,SMART);
  SHARED __ST11259_Layout := RECORD
    KEL.typ.nstr _sex_;
    KEL.typ.nint M__income_;
    KEL.typ.nint I_Q_R__income_;
    KEL.typ.nint M__age_;
    KEL.typ.int __RecordCount := 0;
  END;
  SHARED __ST11259_Layout __ND17041__Project(__ST12182_Layout __PP17028) := TRANSFORM
    SELF.M__income_ := __PP17028.M_E_D_I_A_N__income_;
    SELF.M__age_ := __PP17028.M_E_D_I_A_N__age_;
    SELF := __PP17028;
  END;
  EXPORT Res0 := __UNWRAP(PROJECT(__EE17027,__ND17041__Project(LEFT)));
END;
