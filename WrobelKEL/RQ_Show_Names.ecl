//HPCC Systems KEL Compiler Version 0.11.2
IMPORT KEL011 AS KEL;
IMPORT B_Owns,B_Person,E_Owns,E_Person,E_Vehicle FROM WrobelKEL;
IMPORT * FROM KEL011.Null;
EXPORT RQ_Show_Names := MODULE
  SHARED __EE12872 := B_Person.IDX_Person_UID_Wrapped;
  SHARED __EE12875 := B_Owns.IDX_Owns__owner__Wrapped;
  SHARED __EE13028 := __EE12875(__NN(__EE12875._owner_));
  SHARED __ST8152_Layout := RECORD
    KEL.typ.nuid UID;
    KEL.typ.ndataset(E_Person._name_Layout) _name_;
    KEL.typ.nstr _sex_;
    KEL.typ.ndataset(E_Person._bdate_Layout) _bdate_;
    KEL.typ.ndataset(E_Person._age_Layout) _age_;
    KEL.typ.ndataset(E_Person._income_Layout) _income_;
    KEL.typ.ndataset(E_Person._address_Layout) _address_;
    KEL.typ.ndataset(E_Owns.Layout) Owns_;
    KEL.typ.int __RecordCount := 0;
  END;
  __JC13037(E_Person.Layout __EE12872, E_Owns.Layout __EE13028) := __EEQP(__EE12872.UID,__EE13028._owner_);
  __ST8152_Layout __Join__ST8152_Layout(E_Person.Layout __r, DATASET(E_Owns.Layout) __recs) := TRANSFORM
    SELF := __r;
    SELF.Owns_ := __CN(__recs);
  END;
  SHARED __EE13038 := DENORMALIZE(DISTRIBUTE(__EE12872,HASH(UID)),DISTRIBUTE(__EE13028,HASH(_owner_)),__JC13037(LEFT,RIGHT),GROUP,__Join__ST8152_Layout(LEFT,ROWS(RIGHT)),LOCAL);
  SHARED __ST8019_Layout := RECORD
    KEL.typ.nuid UID;
    KEL.typ.ndataset(E_Person._name_Layout) _name_;
    KEL.typ.ndataset(E_Owns.Layout) Owns_;
    KEL.typ.int __RecordCount := 0;
  END;
  SHARED __ST8019_Layout __ND12995__Project(__ST8152_Layout __PP12991) := TRANSFORM
    SELF := __PP12991;
  END;
  EXPORT Res0 := __UNWRAP(PROJECT(__EE13038,__ND12995__Project(LEFT)));
END;
