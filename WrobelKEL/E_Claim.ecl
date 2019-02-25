//HPCC Systems KEL Compiler Version 0.11.2
IMPORT KEL011 AS KEL;
IMPORT KEL_tutorial;
IMPORT * FROM KEL011.Null;
EXPORT E_Claim := MODULE
  EXPORT Typ := KEL.typ.uid;
  EXPORT InLayout := RECORD
    KEL.typ.nuid UID;
    KEL.typ.nint _amount_;
    KEL.typ.nstr _date_;
    KEL.typ.nstr _totalled_;
  END;
  SHARED VIRTUAL __SourceFilter(DATASET(InLayout) __ds) := __ds;
  SHARED VIRTUAL __GroupedFilter(GROUPED DATASET(InLayout) __ds) := __ds;
  SHARED __Mapping := 'id(UID),amount(_amount_:0),date(_date_:\'\'),totalled(_totalled_:\'\')';
  EXPORT KEL_tutorial_File_Claim_File_Invalid := KEL_tutorial.File_Claim.File((KEL.typ.uid)id = 0);
  SHARED __d0_Prefiltered := KEL_tutorial.File_Claim.File((KEL.typ.uid)id <> 0);
  SHARED __d0 := __SourceFilter(KEL.FromFlat.Convert(__d0_Prefiltered,InLayout,__Mapping));
  EXPORT InData := __d0;
  EXPORT Layout := RECORD
    KEL.typ.nuid UID;
    KEL.typ.nint _amount_;
    KEL.typ.nstr _date_;
    KEL.typ.nstr _totalled_;
    KEL.typ.int __RecordCount := 0;
  END;
  EXPORT __PostFilter := __GroupedFilter(GROUP(DISTRIBUTE(InData,HASH(UID)),UID,LOCAL,ALL));
  Claim_Group := __PostFilter;
  Layout Claim__Rollup(InLayout __r, DATASET(InLayout) __recs) := TRANSFORM
    SELF._amount_ := KEL.Intake.SingleValue(__recs,_amount_);
    SELF._date_ := KEL.Intake.SingleValue(__recs,_date_);
    SELF._totalled_ := KEL.Intake.SingleValue(__recs,_totalled_);
    SELF.__RecordCount := COUNT(__recs);
    SELF := __r;
  END;
  Layout Claim__Single_Rollup(InLayout __r) := TRANSFORM
    SELF.__RecordCount := 1;
    SELF := __r;
  END;
  EXPORT __PreResult := ROLLUP(HAVING(Claim_Group,COUNT(ROWS(LEFT))=1),GROUP,Claim__Single_Rollup(LEFT)) + ROLLUP(HAVING(Claim_Group,COUNT(ROWS(LEFT))>1),GROUP,Claim__Rollup(LEFT, ROWS(LEFT)));
  EXPORT __Result := __CLEARFLAGS(__PreResult) : PERSIST('~temp::KEL::WrobelKEL::Claim::Result',EXPIRE(7));
  EXPORT Result := __UNWRAP(__Result);
  EXPORT _amount__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,_amount_);
  EXPORT _date__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,_date_);
  EXPORT _totalled__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,_totalled_);
  EXPORT SanityCheck := DATASET([{COUNT(KEL_tutorial_File_Claim_File_Invalid),COUNT(_amount__SingleValue_Invalid),COUNT(_date__SingleValue_Invalid),COUNT(_totalled__SingleValue_Invalid)}],{KEL.typ.int KEL_tutorial_File_Claim_File_Invalid,KEL.typ.int _amount__SingleValue_Invalid,KEL.typ.int _date__SingleValue_Invalid,KEL.typ.int _totalled__SingleValue_Invalid});
  EXPORT NullCounts := DATASET([
    {'Claim','KEL_tutorial.File_Claim.File','UID',COUNT(KEL_tutorial_File_Claim_File_Invalid),COUNT(__d0)},
    {'Claim','KEL_tutorial.File_Claim.File','amount',COUNT(__d0(__NL(_amount_))),COUNT(__d0(__NN(_amount_)))},
    {'Claim','KEL_tutorial.File_Claim.File','date',COUNT(__d0(__NL(_date_))),COUNT(__d0(__NN(_date_)))},
    {'Claim','KEL_tutorial.File_Claim.File','totalled',COUNT(__d0(__NL(_totalled_))),COUNT(__d0(__NN(_totalled_)))}]
  ,{KEL.typ.str entity,KEL.typ.str fileName,KEL.typ.str fieldName,KEL.typ.int nullCount,KEL.typ.int notNullCount});
END;
