//HPCC Systems KEL Compiler Version 0.11.2
IMPORT KEL011 AS KEL;
IMPORT B_Person,E_Person FROM WrobelKEL;
IMPORT * FROM KEL011.Null;
EXPORT RQ_High_Income := MODULE
  SHARED __EE13914 := B_Person.IDX_Person_UID_Wrapped;
  SHARED __EE13949 := __EE13914._income_;
  SHARED __EE14021 := __EE13914;
  SHARED __EE14061 := NORMALIZE(__EE14021,__T(LEFT._income_),TRANSFORM(E_Person._income_Layout,SELF:=RIGHT));
  SHARED __EE14066 := __EE14061;
  __JC14225(E_Person._income_Layout __EE13949) := __T(__OP2(__EE13949._income_,>,KEL.Aggregates.AveN(__EE14066,__EE14066._income_)));
  SHARED __EE14226 := __EE13914(EXISTS(__CHILDJOINFILTER(__EE13949,__JC14225)));
  SHARED __ST9346_Layout := RECORD
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
  __ST9346_Layout __JT14138(E_Person.Layout __l, KEL.typ.int __c) := TRANSFORM
    __r := (__T(__l._name_))[__c];
    SELF.__RecordCount := __r.__RecordCount;
    SELF := __l;
    SELF := __r;
  END;
  SHARED __EE14139 := NORMALIZE(__EE14226,MAX(1,COUNT(__T(LEFT._name_))),__JT14138(LEFT,COUNTER));
  SHARED __ST8832_Layout := RECORD
    KEL.typ.nuid UID;
    KEL.typ.nstr _fname_;
    KEL.typ.nstr _lname_;
    KEL.typ.ndataset(E_Person._income_Layout) _income_;
    KEL.typ.nfloat A_V_E__income_;
    KEL.typ.int __RecordCount := 0;
  END;
  SHARED __ST8832_Layout __ND14211__Project(__ST9346_Layout __PP14140) := TRANSFORM
    SELF.A_V_E__income_ := KEL.Aggregates.AveN(__EE14061,__EE14061._income_);
    SELF := __PP14140;
  END;
  SHARED __ST8832_Layout __ND14211__Rollup(__ST8832_Layout __r, DATASET(__ST8832_Layout) __recs) := TRANSFORM
    SELF.__RecordCount := SUM(__recs,__RecordCount);
    SELF := __r;
  END;
  EXPORT Res0 := __UNWRAP(ROLLUP(GROUP(DISTRIBUTE(PROJECT(__EE14139,__ND14211__Project(LEFT)),HASH(UID)),UID,_fname_,_lname_,A_V_E__income_,LOCAL,ALL),GROUP,__ND14211__Rollup(LEFT, ROWS(LEFT))));
END;
