//HPCC Systems KEL Compiler Version 0.11.2
IMPORT KEL011 AS KEL;
IMPORT E_Owns,E_Person,E_Vehicle FROM WrobelKEL;
IMPORT * FROM KEL011.Null;
EXPORT Q_Show_Names_And_Vehs := MODULE
  SHARED TYPEOF(E_Owns.__Result) __E_Owns := E_Owns.__Result;
  SHARED TYPEOF(E_Person.__Result) __E_Person := E_Person.__Result;
  SHARED TYPEOF(E_Vehicle.__Result) __E_Vehicle := E_Vehicle.__Result;
  SHARED __EE1153 := __E_Person;
  SHARED __EE1380 := __E_Owns;
  SHARED __EE1510 := __EE1380(__NN(__EE1380._owner_));
  SHARED __EE1379 := __E_Vehicle;
  SHARED __ST1209_Layout := RECORD
    KEL.typ.ntyp(E_Person.Typ) _owner_;
    KEL.typ.ntyp(E_Vehicle.Typ) _veh_;
    KEL.typ.nuid UID;
    KEL.typ.nint _myear_;
    KEL.typ.nstr _make_;
    KEL.typ.nstr _model_;
    KEL.typ.nstr _body_;
    KEL.typ.nstr _vin_;
    KEL.typ.nint _msrp_;
    KEL.typ.nstr _purchasedate_;
    KEL.typ.nint _purchaseprice_;
    KEL.typ.nint _value_;
    KEL.typ.int __RecordCount := 0;
  END;
  __JC1516(E_Owns.Layout __EE1510, E_Vehicle.Layout __EE1379) := __EEQP(__EE1510._veh_,__EE1379.UID);
  __ST1209_Layout __JT1516(E_Owns.Layout __l, E_Vehicle.Layout __r) := TRANSFORM
    SELF := __l;
    SELF := __r;
  END;
  SHARED __EE1517 := JOIN(__EE1510,__EE1379,__JC1516(LEFT,RIGHT),__JT1516(LEFT,RIGHT),LEFT OUTER,HASH);
  SHARED __ST1303_Layout := RECORD
    KEL.typ.nuid UID;
    KEL.typ.ndataset(E_Person._name_Layout) _name_;
    KEL.typ.nstr _sex_;
    KEL.typ.ndataset(E_Person._bdate_Layout) _bdate_;
    KEL.typ.ndataset(E_Person._age_Layout) _age_;
    KEL.typ.ndataset(E_Person._income_Layout) _income_;
    KEL.typ.ndataset(E_Person._address_Layout) _address_;
    KEL.typ.ndataset(__ST1209_Layout) Owns_;
    KEL.typ.int __RecordCount := 0;
  END;
  __JC1542(E_Person.Layout __EE1153, __ST1209_Layout __EE1517) := __EEQP(__EE1153.UID,__EE1517._owner_);
  __ST1303_Layout __Join__ST1303_Layout(E_Person.Layout __r, DATASET(__ST1209_Layout) __recs) := TRANSFORM
    SELF := __r;
    SELF.Owns_ := __CN(__recs);
  END;
  SHARED __EE1543 := DENORMALIZE(DISTRIBUTE(__EE1153,HASH(UID)),DISTRIBUTE(__EE1517,HASH(_owner_)),__JC1542(LEFT,RIGHT),GROUP,__Join__ST1303_Layout(LEFT,ROWS(RIGHT)),LOCAL);
  SHARED __ST322_Layout := RECORD
    KEL.typ.nstr _fname_;
    KEL.typ.nstr _lname_;
    KEL.typ.int __RecordCount := 0;
  END;
  SHARED __ST326_Layout := RECORD
    KEL.typ.nstr _make_;
    KEL.typ.int __RecordCount := 0;
  END;
  SHARED __ST329_Layout := RECORD
    KEL.typ.nuid UID;
    KEL.typ.ndataset(__ST322_Layout) _name_;
    KEL.typ.ndataset(__ST326_Layout) Owns_;
    KEL.typ.int __RecordCount := 0;
  END;
  SHARED __ST329_Layout __ND1593__Project(__ST1303_Layout __PP1589) := TRANSFORM
    __EE1583 := __PP1589._name_;
    SELF._name_ := __BN(PROJECT(TABLE(PROJECT(__T(__EE1583),__ST322_Layout)(__NN(_fname_) OR __NN(_lname_)),{KEL.typ.int __RecordCount := SUM(GROUP,__RecordCount),_fname_,_lname_},_fname_,_lname_,MERGE),__ST322_Layout),__NL(__EE1583));
    __EE1587 := __PP1589.Owns_;
    SELF.Owns_ := __BN(PROJECT(TABLE(PROJECT(__T(__EE1587),__ST326_Layout)(__NN(_make_)),{KEL.typ.int __RecordCount := SUM(GROUP,__RecordCount),_make_},_make_,MERGE),__ST326_Layout),__NL(__EE1587));
    SELF := __PP1589;
  END;
  EXPORT Res0 := __UNWRAP(PROJECT(PROJECT(__EE1543,__ND1593__Project(LEFT)),__ST329_Layout));
END;
