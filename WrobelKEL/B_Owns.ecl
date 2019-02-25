//HPCC Systems KEL Compiler Version 0.11.2
IMPORT KEL011 AS KEL;
IMPORT E_Owns,E_Person,E_Vehicle FROM WrobelKEL;
IMPORT * FROM KEL011.Null;
EXPORT B_Owns := MODULE
  SHARED __EE12477 := E_Owns.__Result;
  SHARED __IDX_Owns__owner__Filtered := __EE12477(__NN(__EE12477._owner_));
  SHARED IDX_Owns__owner__Layout := RECORD
    E_Person.Typ _owner_;
    __IDX_Owns__owner__Filtered._veh_;
    __IDX_Owns__owner__Filtered.__RecordCount;
  END;
  SHARED IDX_Owns__owner__Projected := PROJECT(__IDX_Owns__owner__Filtered,TRANSFORM(IDX_Owns__owner__Layout,SELF._owner_:=__T(LEFT._owner_),SELF:=LEFT));
  EXPORT IDX_Owns__owner_ := INDEX(IDX_Owns__owner__Projected,{_owner_},{IDX_Owns__owner__Projected},'~key::KEL::WrobelKEL::Owns::_owner_');
  EXPORT IDX_Owns__owner__Build := BUILD(IDX_Owns__owner_,OVERWRITE);
  EXPORT __ST12479_Layout := RECORDOF(IDX_Owns__owner_);
  EXPORT IDX_Owns__owner__Wrapped := PROJECT(IDX_Owns__owner_,TRANSFORM(E_Owns.Layout,SELF._owner_ := __CN(LEFT._owner_),SELF:=LEFT));
  EXPORT BuildAll := PARALLEL(IDX_Owns__owner__Build);
END;
