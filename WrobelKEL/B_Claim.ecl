//HPCC Systems KEL Compiler Version 0.11.2
IMPORT KEL011 AS KEL;
IMPORT E_Claim FROM WrobelKEL;
IMPORT * FROM KEL011.Null;
EXPORT B_Claim := MODULE
  SHARED __EE12484 := E_Claim.__Result;
  SHARED IDX_Claim_UID_Layout := RECORD
    KEL.typ.uid UID;
    __EE12484._amount_;
    __EE12484._date_;
    __EE12484._totalled_;
    __EE12484.__RecordCount;
  END;
  SHARED IDX_Claim_UID_Projected := PROJECT(__EE12484,TRANSFORM(IDX_Claim_UID_Layout,SELF.UID:=__T(LEFT.UID),SELF:=LEFT));
  EXPORT IDX_Claim_UID := INDEX(IDX_Claim_UID_Projected,{UID},{IDX_Claim_UID_Projected},'~key::KEL::WrobelKEL::Claim::UID');
  EXPORT IDX_Claim_UID_Build := BUILD(IDX_Claim_UID,OVERWRITE);
  EXPORT __ST12486_Layout := RECORDOF(IDX_Claim_UID);
  EXPORT IDX_Claim_UID_Wrapped := PROJECT(IDX_Claim_UID,TRANSFORM(E_Claim.Layout,SELF.UID := __CN(LEFT.UID),SELF:=LEFT));
  EXPORT BuildAll := PARALLEL(IDX_Claim_UID_Build);
END;
