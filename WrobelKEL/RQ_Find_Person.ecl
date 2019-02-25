//HPCC Systems KEL Compiler Version 0.11.2
IMPORT KEL011 AS KEL;
IMPORT B_Person,CFG_Queries,E_Person FROM WrobelKEL;
IMPORT * FROM KEL011.Null;
EXPORT RQ_Find_Person(DATASET(CFG_Queries.Find_Person_Params_Layout) __Find_Person_Params) := MODULE
  SHARED __EE801 := __Find_Person_Params;
  SHARED __EE1786 := B_Person.IDX_Person__name___fname_;
  SHARED __ST1803_Layout := RECORD
    KEL.typ.uid __QueryId := 0;
    KEL.typ.str _ifname_ := '';
    KEL.typ.str _fname_ := '';
    KEL.typ.str _mname_ := '';
    KEL.typ.str _lname_ := '';
    KEL.typ.nuid UID;
    KEL.typ.int __RecordCount := 0;
  END;
  __JC2023(CFG_Queries.Find_Person_Params_Layout __EE801, B_Person.__ST1744_Layout __EE1786) := KEL.Indexing.FKey(__EE1786._fname_) = KEL.Indexing.HKey(__EE801._ifname_) AND KEL.Indexing.VKey(__EE1786._fname_) = __EE801._ifname_;
  __ST1803_Layout __JT2023(CFG_Queries.Find_Person_Params_Layout __l, B_Person.__ST1744_Layout __r) := TRANSFORM
    SELF := __l;
    SELF := __r;
  END;
  SHARED __EE2024 := JOIN(__EE801,__EE1786,__JC2023(LEFT,RIGHT),__JT2023(LEFT,RIGHT),INNER,HASH);
  SHARED __EE2026 := B_Person.IDX_Person_UID;
  SHARED __ST1849_Layout := RECORD
    KEL.typ.uid __QueryId := 0;
    KEL.typ.str _ifname_ := '';
    KEL.typ.str _fname_ := '';
    KEL.typ.str _mname_ := '';
    KEL.typ.str _lname_ := '';
    KEL.typ.nuid UID;
    KEL.typ.uid U_I_D__1_ := 0;
    KEL.typ.ndataset(E_Person._name_Layout) _name_;
    KEL.typ.nstr _sex_;
    KEL.typ.ndataset(E_Person._bdate_Layout) _bdate_;
    KEL.typ.ndataset(E_Person._age_Layout) _age_;
    KEL.typ.ndataset(E_Person._income_Layout) _income_;
    KEL.typ.ndataset(E_Person._address_Layout) _address_;
    KEL.typ.int __RecordCount := 0;
  END;
  __JC2036(__ST1803_Layout __EE2024, B_Person.__ST1713_Layout __EE2026) := __T(__EE2024.UID) = __EE2026.UID;
  __ST1849_Layout __JT2036(__ST1803_Layout __l, B_Person.__ST1713_Layout __r) := TRANSFORM
    SELF.U_I_D__1_ := __r.UID;
    SELF := __l;
    SELF := __r;
  END;
  SHARED __EE2037 := JOIN(__EE2024,__EE2026,__JC2036(LEFT,RIGHT),__JT2036(LEFT,RIGHT),INNER,HASH);
  SHARED __ST1184_Layout := RECORD
    KEL.typ.uid __QueryId := 0;
    KEL.typ.str _ifname_ := '';
    KEL.typ.nuid UID;
    KEL.typ.ndataset(E_Person._name_Layout) _name_;
    KEL.typ.nstr _sex_;
    KEL.typ.ndataset(E_Person._bdate_Layout) _bdate_;
    KEL.typ.ndataset(E_Person._age_Layout) _age_;
    KEL.typ.ndataset(E_Person._income_Layout) _income_;
    KEL.typ.ndataset(E_Person._address_Layout) _address_;
    KEL.typ.nstr _fname_;
    KEL.typ.nstr _mname_;
    KEL.typ.nstr _lname_;
    KEL.typ.int __RecordCount := 0;
  END;
  SHARED __ST1184_Layout __ND2167__Project(__ST1849_Layout __PP2038) := TRANSFORM
    SELF.UID := __CN(__PP2038.U_I_D__1_);
    SELF._fname_ := __CN(__PP2038._fname_);
    SELF._mname_ := __CN(__PP2038._mname_);
    SELF._lname_ := __CN(__PP2038._lname_);
    SELF := __PP2038;
  END;
  SHARED __EE2168 := PROJECT(__EE2037,__ND2167__Project(LEFT));
  SHARED __ST727_Layout := RECORD
    KEL.typ.nuid UID;
    KEL.typ.ndataset(E_Person._name_Layout) _name_;
    KEL.typ.nstr _sex_;
    KEL.typ.ndataset(E_Person._bdate_Layout) _bdate_;
    KEL.typ.ndataset(E_Person._age_Layout) _age_;
    KEL.typ.ndataset(E_Person._income_Layout) _income_;
    KEL.typ.ndataset(E_Person._address_Layout) _address_;
    KEL.typ.uid __QueryId := 0;
    KEL.typ.int __RecordCount := 0;
  END;
  EXPORT Res0 := __UNWRAP(PROJECT(__EE2168,__ST727_Layout));
END;
