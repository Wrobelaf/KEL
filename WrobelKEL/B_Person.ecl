//HPCC Systems KEL Compiler Version 0.11.2
IMPORT KEL011 AS KEL;
IMPORT E_Person FROM WrobelKEL;
IMPORT * FROM KEL011.Null;
EXPORT B_Person := MODULE
  SHARED __EE12439 := E_Person.__Result;
  SHARED IDX_Person_UID_Layout := RECORD
    KEL.typ.uid UID;
    __EE12439._name_;
    __EE12439._sex_;
    __EE12439._bdate_;
    __EE12439._age_;
    __EE12439._income_;
    __EE12439._address_;
    __EE12439.__RecordCount;
  END;
  SHARED IDX_Person_UID_Projected := PROJECT(__EE12439,TRANSFORM(IDX_Person_UID_Layout,SELF.UID:=__T(LEFT.UID),SELF:=LEFT));
  EXPORT IDX_Person_UID := INDEX(IDX_Person_UID_Projected,{UID},{IDX_Person_UID_Projected},'~key::KEL::WrobelKEL::Person::UID');
  EXPORT IDX_Person_UID_Build := BUILD(IDX_Person_UID,OVERWRITE);
  EXPORT __ST12441_Layout := RECORDOF(IDX_Person_UID);
  EXPORT IDX_Person_UID_Wrapped := PROJECT(IDX_Person_UID,TRANSFORM(E_Person.Layout,SELF.UID := __CN(LEFT.UID),SELF:=LEFT));
  SHARED __EE12470 := E_Person.__Result;
  SHARED __IDX_Person__sex__Filtered := __EE12470(__NN(__EE12470._sex_));
  SHARED IDX_Person__sex__Layout := RECORD
    KEL.typ.str _sex_;
    UNSIGNED4 ___sex__Key;
    __IDX_Person__sex__Filtered.UID;
  END;
  SHARED IDX_Person__sex__Projected := PROJECT(__IDX_Person__sex__Filtered,TRANSFORM(IDX_Person__sex__Layout,SELF._sex_:=__T(LEFT._sex_),SELF.___sex__Key:=HASH32(__T(LEFT._sex_)),SELF:=LEFT));
  EXPORT IDX_Person__sex_ := INDEX(IDX_Person__sex__Projected,{___sex__Key},{IDX_Person__sex__Projected},'~key::KEL::WrobelKEL::Person::_sex_');
  EXPORT IDX_Person__sex__Build := BUILD(IDX_Person__sex_,OVERWRITE);
  EXPORT __ST12472_Layout := RECORDOF(IDX_Person__sex_);
  EXPORT BuildAll := PARALLEL(IDX_Person_UID_Build,IDX_Person__sex__Build);
END;
