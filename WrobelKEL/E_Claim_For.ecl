//HPCC Systems KEL Compiler Version 0.11.2
IMPORT KEL011 AS KEL;
IMPORT KEL_tutorial;
IMPORT E_Claim,E_Vehicle FROM WrobelKEL;
IMPORT * FROM KEL011.Null;
EXPORT E_Claim_For := MODULE
  EXPORT Typ := KEL.typ.uid;
  EXPORT InLayout := RECORD
    KEL.typ.ntyp(E_Vehicle.Typ) _veh_;
    KEL.typ.ntyp(E_Claim.Typ) _claim_;
  END;
  SHARED VIRTUAL __SourceFilter(DATASET(InLayout) __ds) := __ds;
  SHARED __Mapping := 'vehid(_veh_:0),id(_claim_:0)';
  SHARED __d0_Prefiltered := KEL_tutorial.File_Claim.File;
  SHARED __d0 := __SourceFilter(KEL.FromFlat.Convert(__d0_Prefiltered,InLayout,__Mapping));
  EXPORT InData := __d0;
  EXPORT Layout := RECORD
    KEL.typ.ntyp(E_Vehicle.Typ) _veh_;
    KEL.typ.ntyp(E_Claim.Typ) _claim_;
    KEL.typ.int __RecordCount := 0;
  END;
  EXPORT __PreResult := PROJECT(TABLE(InData,{KEL.typ.int __RecordCount := COUNT(GROUP),_veh_,_claim_},_veh_,_claim_,MERGE),Layout);
  EXPORT __Result := __CLEARFLAGS(__PreResult) : PERSIST('~temp::KEL::WrobelKEL::Claim_For::Result',EXPIRE(7));
  EXPORT Result := __UNWRAP(__Result);
  EXPORT _veh__Orphan := JOIN(InData(__NN(_veh_)),E_Vehicle.__Result,__EEQP(LEFT._veh_, RIGHT.UID),TRANSFORM(InLayout,SELF := LEFT,SELF:=[]),LEFT ONLY, HASH);
  EXPORT _claim__Orphan := JOIN(InData(__NN(_claim_)),E_Claim.__Result,__EEQP(LEFT._claim_, RIGHT.UID),TRANSFORM(InLayout,SELF := LEFT,SELF:=[]),LEFT ONLY, HASH);
  EXPORT SanityCheck := DATASET([{COUNT(_veh__Orphan),COUNT(_claim__Orphan)}],{KEL.typ.int _veh__Orphan,KEL.typ.int _claim__Orphan});
  EXPORT NullCounts := DATASET([
    {'ClaimFor','KEL_tutorial.File_Claim.File','vehid',COUNT(__d0(__NL(_veh_))),COUNT(__d0(__NN(_veh_)))},
    {'ClaimFor','KEL_tutorial.File_Claim.File','id',COUNT(__d0(__NL(_claim_))),COUNT(__d0(__NN(_claim_)))}]
  ,{KEL.typ.str entity,KEL.typ.str fileName,KEL.typ.str fieldName,KEL.typ.int nullCount,KEL.typ.int notNullCount});
END;
