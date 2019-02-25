//HPCC Systems KEL Compiler Version 0.11.2
IMPORT KEL011 AS KEL;
IMPORT B_Person,CFG_Queries,E_Person,FN_Queries FROM WrobelKEL;
IMPORT * FROM KEL011.Null;
EXPORT RQ_Show_Persons(DATASET(CFG_Queries.Show_Persons_Params_Layout) __Show_Persons_Params) := MODULE
  SHARED __EE12547 := B_Person.IDX_Person_UID_Wrapped;
  SHARED __ST7627_Layout := RECORD
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
  __ST7627_Layout __JT12561(E_Person.Layout __l, E_Person._name_Layout __r) := TRANSFORM
    SELF.__RecordCount := __r.__RecordCount;
    SELF := __l;
    SELF := __r;
  END;
  SHARED __EE12562 := NORMALIZE(__EE12547,__T(LEFT._name_),__JT12561(LEFT,RIGHT));
  SHARED __EE7361 := __Show_Persons_Params;
  SHARED __ST7884_Layout := RECORD
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
    KEL.typ.uid __QueryId := 0;
    KEL.typ.str _p__lname_ := '';
    KEL.typ.int __RecordCount := 0;
  END;
  __JC12694(__ST7627_Layout __EE12562, CFG_Queries.Show_Persons_Params_Layout __EE7361) := __T(FN_Queries.FN_R_E_G_E_X_F_I_N_D(__ECAST(KEL.typ.nstr,__CN(__EE7361._p__lname_)),__ECAST(KEL.typ.nstr,__EE12562._lname_)));
  __ST7884_Layout __JT12694(__ST7627_Layout __l, CFG_Queries.Show_Persons_Params_Layout __r) := TRANSFORM
    SELF := __l;
    SELF := __r;
  END;
  SHARED __EE12723 := JOIN(__EE12562,__EE7361,__JC12694(LEFT,RIGHT),__JT12694(LEFT,RIGHT),INNER,ALL);
  SHARED __ST7294_Layout := RECORD
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
  EXPORT Res0 := __UNWRAP(PROJECT(__EE12723,__ST7294_Layout));
END;
