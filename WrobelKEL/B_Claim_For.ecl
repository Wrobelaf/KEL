//HPCC Systems KEL Compiler Version 0.11.2
IMPORT KEL011 AS KEL;
IMPORT E_Claim,E_Claim_For,E_Vehicle FROM WrobelKEL;
IMPORT * FROM KEL011.Null;
EXPORT B_Claim_For := MODULE
  SHARED __EE12514 := E_Claim_For.__Result;
  SHARED __IDX_Claim_For__claim__Filtered := __EE12514(__NN(__EE12514._claim_));
  SHARED IDX_Claim_For__claim__Layout := RECORD
    E_Claim.Typ _claim_;
    __IDX_Claim_For__claim__Filtered._veh_;
    __IDX_Claim_For__claim__Filtered.__RecordCount;
  END;
  SHARED IDX_Claim_For__claim__Projected := PROJECT(__IDX_Claim_For__claim__Filtered,TRANSFORM(IDX_Claim_For__claim__Layout,SELF._claim_:=__T(LEFT._claim_),SELF:=LEFT));
  EXPORT IDX_Claim_For__claim_ := INDEX(IDX_Claim_For__claim__Projected,{_claim_},{IDX_Claim_For__claim__Projected},'~key::KEL::WrobelKEL::Claim_For::_claim_');
  EXPORT IDX_Claim_For__claim__Build := BUILD(IDX_Claim_For__claim_,OVERWRITE);
  EXPORT __ST12516_Layout := RECORDOF(IDX_Claim_For__claim_);
  EXPORT IDX_Claim_For__claim__Wrapped := PROJECT(IDX_Claim_For__claim_,TRANSFORM(E_Claim_For.Layout,SELF._claim_ := __CN(LEFT._claim_),SELF:=LEFT));
  EXPORT BuildAll := PARALLEL(IDX_Claim_For__claim__Build);
END;
