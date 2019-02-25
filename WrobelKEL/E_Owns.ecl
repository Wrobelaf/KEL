//HPCC Systems KEL Compiler Version 0.11.2
IMPORT KEL011 AS KEL;
IMPORT KEL_tutorial;
IMPORT E_Person,E_Vehicle FROM WrobelKEL;
IMPORT * FROM KEL011.Null;
EXPORT E_Owns := MODULE
  EXPORT Typ := KEL.typ.uid;
  EXPORT InLayout := RECORD
    KEL.typ.ntyp(E_Person.Typ) _owner_;
    KEL.typ.ntyp(E_Vehicle.Typ) _veh_;
  END;
  SHARED VIRTUAL __SourceFilter(DATASET(InLayout) __ds) := __ds;
  SHARED __Mapping := 'owner(_owner_:0),id(_veh_:0)';
  SHARED __d0_Prefiltered := KEL_tutorial.File_Vehicle.Small.File;
  SHARED __d0 := __SourceFilter(KEL.FromFlat.Convert(__d0_Prefiltered,InLayout,__Mapping));
  EXPORT InData := __d0;
  EXPORT Layout := RECORD
    KEL.typ.ntyp(E_Person.Typ) _owner_;
    KEL.typ.ntyp(E_Vehicle.Typ) _veh_;
    KEL.typ.int __RecordCount := 0;
  END;
  EXPORT __PreResult := PROJECT(TABLE(InData,{KEL.typ.int __RecordCount := COUNT(GROUP),_owner_,_veh_},_owner_,_veh_,MERGE),Layout);
  EXPORT __Result := __CLEARFLAGS(__PreResult) : PERSIST('~temp::KEL::WrobelKEL::Owns::Result',EXPIRE(7));
  EXPORT Result := __UNWRAP(__Result);
  EXPORT _owner__Orphan := JOIN(InData(__NN(_owner_)),E_Person.__Result,__EEQP(LEFT._owner_, RIGHT.UID),TRANSFORM(InLayout,SELF := LEFT,SELF:=[]),LEFT ONLY, HASH);
  EXPORT _veh__Orphan := JOIN(InData(__NN(_veh_)),E_Vehicle.__Result,__EEQP(LEFT._veh_, RIGHT.UID),TRANSFORM(InLayout,SELF := LEFT,SELF:=[]),LEFT ONLY, HASH);
  EXPORT SanityCheck := DATASET([{COUNT(_owner__Orphan),COUNT(_veh__Orphan)}],{KEL.typ.int _owner__Orphan,KEL.typ.int _veh__Orphan});
  EXPORT NullCounts := DATASET([
    {'Owns','KEL_tutorial.File_Vehicle.Small.File','owner',COUNT(__d0(__NL(_owner_))),COUNT(__d0(__NN(_owner_)))},
    {'Owns','KEL_tutorial.File_Vehicle.Small.File','id',COUNT(__d0(__NL(_veh_))),COUNT(__d0(__NN(_veh_)))}]
  ,{KEL.typ.str entity,KEL.typ.str fileName,KEL.typ.str fieldName,KEL.typ.int nullCount,KEL.typ.int notNullCount});
END;
