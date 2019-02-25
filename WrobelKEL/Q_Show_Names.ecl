//HPCC Systems KEL Compiler Version 0.11.2
IMPORT KEL011 AS KEL;
IMPORT E_Owns,E_Person,E_Vehicle FROM WrobelKEL;
IMPORT * FROM KEL011.Null;
EXPORT Q_Show_Names := MODULE
  SHARED TYPEOF(E_Owns.__Result) __E_Owns := E_Owns.__Result;
  SHARED TYPEOF(E_Person.__Result) __E_Person := E_Person.__Result;
  SHARED __EE767 := __E_Person;
  SHARED __EE743 := __E_Owns;
  SHARED __EE984 := __EE743(__NN(__EE743._owner_));
  SHARED __ST826_Layout := RECORD
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
  __JC993(E_Person.Layout __EE767, E_Owns.Layout __EE984) := __EEQP(__EE767.UID,__EE984._owner_);
  __ST826_Layout __Join__ST826_Layout(E_Person.Layout __r, DATASET(E_Owns.Layout) __recs) := TRANSFORM
    SELF := __r;
    SELF.Owns_ := __CN(__recs);
  END;
  SHARED __EE994 := DENORMALIZE(DISTRIBUTE(__EE767,HASH(UID)),DISTRIBUTE(__EE984,HASH(_owner_)),__JC993(LEFT,RIGHT),GROUP,__Join__ST826_Layout(LEFT,ROWS(RIGHT)),LOCAL);
  SHARED __ST295_Layout := RECORD
    KEL.typ.nuid UID;
    KEL.typ.ndataset(E_Person._name_Layout) _name_;
    KEL.typ.ndataset(E_Owns.Layout) Owns_;
    KEL.typ.int __RecordCount := 0;
  END;
  SHARED __ST295_Layout __ND951__Project(__ST826_Layout __PP947) := TRANSFORM
    SELF := __PP947;
  END;
  EXPORT Res0 := __UNWRAP(PROJECT(__EE994,__ND951__Project(LEFT)));
END;
