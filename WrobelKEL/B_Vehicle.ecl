//HPCC Systems KEL Compiler Version 0.11.2
IMPORT KEL011 AS KEL;
IMPORT E_Vehicle FROM WrobelKEL;
IMPORT * FROM KEL011.Null;
EXPORT B_Vehicle := MODULE
  SHARED __EE12493 := E_Vehicle.__Result;
  SHARED IDX_Vehicle_UID_Layout := RECORD
    KEL.typ.uid UID;
    __EE12493._myear_;
    __EE12493._make_;
    __EE12493._model_;
    __EE12493._body_;
    __EE12493._vin_;
    __EE12493._msrp_;
    __EE12493._purchasedate_;
    __EE12493._purchaseprice_;
    __EE12493._value_;
    __EE12493.__RecordCount;
  END;
  SHARED IDX_Vehicle_UID_Projected := PROJECT(__EE12493,TRANSFORM(IDX_Vehicle_UID_Layout,SELF.UID:=__T(LEFT.UID),SELF:=LEFT));
  EXPORT IDX_Vehicle_UID := INDEX(IDX_Vehicle_UID_Projected,{UID},{IDX_Vehicle_UID_Projected},'~key::KEL::WrobelKEL::Vehicle::UID');
  EXPORT IDX_Vehicle_UID_Build := BUILD(IDX_Vehicle_UID,OVERWRITE);
  EXPORT __ST12495_Layout := RECORDOF(IDX_Vehicle_UID);
  EXPORT IDX_Vehicle_UID_Wrapped := PROJECT(IDX_Vehicle_UID,TRANSFORM(E_Vehicle.Layout,SELF.UID := __CN(LEFT.UID),SELF:=LEFT));
  SHARED __EE12507 := E_Vehicle.__Result;
  SHARED __IDX_Vehicle__make__Filtered := __EE12507(__NN(__EE12507._make_));
  SHARED IDX_Vehicle__make__Layout := RECORD
    KEL.typ.str _make_;
    UNSIGNED4 ___make__Key;
    __IDX_Vehicle__make__Filtered.UID;
  END;
  SHARED IDX_Vehicle__make__Projected := PROJECT(__IDX_Vehicle__make__Filtered,TRANSFORM(IDX_Vehicle__make__Layout,SELF._make_:=__T(LEFT._make_),SELF.___make__Key:=HASH32(__T(LEFT._make_)),SELF:=LEFT));
  EXPORT IDX_Vehicle__make_ := INDEX(IDX_Vehicle__make__Projected,{___make__Key},{IDX_Vehicle__make__Projected},'~key::KEL::WrobelKEL::Vehicle::_make_');
  EXPORT IDX_Vehicle__make__Build := BUILD(IDX_Vehicle__make_,OVERWRITE);
  EXPORT __ST12509_Layout := RECORDOF(IDX_Vehicle__make_);
  EXPORT BuildAll := PARALLEL(IDX_Vehicle_UID_Build,IDX_Vehicle__make__Build);
END;
