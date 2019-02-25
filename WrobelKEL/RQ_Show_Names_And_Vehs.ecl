//HPCC Systems KEL Compiler Version 0.11.2
IMPORT KEL011 AS KEL;
IMPORT B_Owns,B_Person,B_Vehicle,E_Owns,E_Person,E_Vehicle FROM WrobelKEL;
IMPORT * FROM KEL011.Null;
EXPORT RQ_Show_Names_And_Vehs := MODULE
  SHARED __EE13112 := B_Person.IDX_Person_UID_Wrapped;
  SHARED __EE13115 := B_Owns.IDX_Owns__owner__Wrapped;
  SHARED __EE13363 := __EE13115(__NN(__EE13115._owner_));
  SHARED __EE13118 := B_Vehicle.IDX_Vehicle_UID_Wrapped;
  SHARED __ST8390_Layout := RECORD
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
  __JC13369(E_Owns.Layout __EE13363, E_Vehicle.Layout __EE13118) := __EEQP(__EE13363._veh_,__EE13118.UID);
  __ST8390_Layout __JT13369(E_Owns.Layout __l, E_Vehicle.Layout __r) := TRANSFORM
    SELF := __l;
    SELF := __r;
  END;
  SHARED __EE13370 := JOIN(__EE13363,__EE13118,__JC13369(LEFT,RIGHT),__JT13369(LEFT,RIGHT),LEFT OUTER,HASH);
  SHARED __ST8484_Layout := RECORD
    KEL.typ.nuid UID;
    KEL.typ.ndataset(E_Person._name_Layout) _name_;
    KEL.typ.nstr _sex_;
    KEL.typ.ndataset(E_Person._bdate_Layout) _bdate_;
    KEL.typ.ndataset(E_Person._age_Layout) _age_;
    KEL.typ.ndataset(E_Person._income_Layout) _income_;
    KEL.typ.ndataset(E_Person._address_Layout) _address_;
    KEL.typ.ndataset(__ST8390_Layout) Owns_;
    KEL.typ.int __RecordCount := 0;
  END;
  __JC13395(E_Person.Layout __EE13112, __ST8390_Layout __EE13370) := __EEQP(__EE13112.UID,__EE13370._owner_);
  __ST8484_Layout __Join__ST8484_Layout(E_Person.Layout __r, DATASET(__ST8390_Layout) __recs) := TRANSFORM
    SELF := __r;
    SELF.Owns_ := __CN(__recs);
  END;
  SHARED __EE13396 := DENORMALIZE(DISTRIBUTE(__EE13112,HASH(UID)),DISTRIBUTE(__EE13370,HASH(_owner_)),__JC13395(LEFT,RIGHT),GROUP,__Join__ST8484_Layout(LEFT,ROWS(RIGHT)),LOCAL);
  SHARED __ST8235_Layout := RECORD
    KEL.typ.nstr _fname_;
    KEL.typ.nstr _lname_;
    KEL.typ.int __RecordCount := 0;
  END;
  SHARED __ST8239_Layout := RECORD
    KEL.typ.nstr _make_;
    KEL.typ.int __RecordCount := 0;
  END;
  SHARED __ST8242_Layout := RECORD
    KEL.typ.nuid UID;
    KEL.typ.ndataset(__ST8235_Layout) _name_;
    KEL.typ.ndataset(__ST8239_Layout) Owns_;
    KEL.typ.int __RecordCount := 0;
  END;
  SHARED __ST8242_Layout __ND13446__Project(__ST8484_Layout __PP13442) := TRANSFORM
    __EE13436 := __PP13442._name_;
    SELF._name_ := __BN(PROJECT(TABLE(PROJECT(__T(__EE13436),__ST8235_Layout)(__NN(_fname_) OR __NN(_lname_)),{KEL.typ.int __RecordCount := SUM(GROUP,__RecordCount),_fname_,_lname_},_fname_,_lname_,MERGE),__ST8235_Layout),__NL(__EE13436));
    __EE13440 := __PP13442.Owns_;
    SELF.Owns_ := __BN(PROJECT(TABLE(PROJECT(__T(__EE13440),__ST8239_Layout)(__NN(_make_)),{KEL.typ.int __RecordCount := SUM(GROUP,__RecordCount),_make_},_make_,MERGE),__ST8239_Layout),__NL(__EE13440));
    SELF := __PP13442;
  END;
  EXPORT Res0 := __UNWRAP(PROJECT(PROJECT(__EE13396,__ND13446__Project(LEFT)),__ST8242_Layout));
END;
