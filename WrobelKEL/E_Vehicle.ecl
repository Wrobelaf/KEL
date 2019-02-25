//HPCC Systems KEL Compiler Version 0.11.2
IMPORT KEL011 AS KEL;
IMPORT KEL_tutorial;
IMPORT * FROM KEL011.Null;
EXPORT E_Vehicle := MODULE
  EXPORT Typ := KEL.typ.uid;
  EXPORT InLayout := RECORD
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
  END;
  SHARED VIRTUAL __SourceFilter(DATASET(InLayout) __ds) := __ds;
  SHARED VIRTUAL __GroupedFilter(GROUPED DATASET(InLayout) __ds) := __ds;
  SHARED __Mapping := 'id(UID),myear(_myear_:0),name.make(_make_:\'\'),name.model(_model_:\'\'),name.body(_body_:\'\'),vin(_vin_:\'\'),msrp(_msrp_:0),purchasedate(_purchasedate_:\'\'),purchaseprice(_purchaseprice_:0),value(_value_:0)';
  EXPORT KEL_tutorial_File_Vehicle_Small_File_Invalid := KEL_tutorial.File_Vehicle.Small.File((KEL.typ.uid)id = 0);
  SHARED __d0_Prefiltered := KEL_tutorial.File_Vehicle.Small.File((KEL.typ.uid)id <> 0);
  SHARED __d0 := __SourceFilter(KEL.FromFlat.Convert(__d0_Prefiltered,InLayout,__Mapping));
  EXPORT InData := __d0;
  EXPORT Layout := RECORD
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
  EXPORT __PostFilter := __GroupedFilter(GROUP(DISTRIBUTE(InData,HASH(UID)),UID,LOCAL,ALL));
  Vehicle_Group := __PostFilter;
  Layout Vehicle__Rollup(InLayout __r, DATASET(InLayout) __recs) := TRANSFORM
    SELF._myear_ := KEL.Intake.SingleValue(__recs,_myear_);
    SELF._make_ := KEL.Intake.SingleValue(__recs,_make_);
    SELF._model_ := KEL.Intake.SingleValue(__recs,_model_);
    SELF._body_ := KEL.Intake.SingleValue(__recs,_body_);
    SELF._vin_ := KEL.Intake.SingleValue(__recs,_vin_);
    SELF._msrp_ := KEL.Intake.SingleValue(__recs,_msrp_);
    SELF._purchasedate_ := KEL.Intake.SingleValue(__recs,_purchasedate_);
    SELF._purchaseprice_ := KEL.Intake.SingleValue(__recs,_purchaseprice_);
    SELF._value_ := KEL.Intake.SingleValue(__recs,_value_);
    SELF.__RecordCount := COUNT(__recs);
    SELF := __r;
  END;
  Layout Vehicle__Single_Rollup(InLayout __r) := TRANSFORM
    SELF.__RecordCount := 1;
    SELF := __r;
  END;
  EXPORT __PreResult := ROLLUP(HAVING(Vehicle_Group,COUNT(ROWS(LEFT))=1),GROUP,Vehicle__Single_Rollup(LEFT)) + ROLLUP(HAVING(Vehicle_Group,COUNT(ROWS(LEFT))>1),GROUP,Vehicle__Rollup(LEFT, ROWS(LEFT)));
  EXPORT __Result := __CLEARFLAGS(__PreResult) : PERSIST('~temp::KEL::WrobelKEL::Vehicle::Result',EXPIRE(7));
  EXPORT Result := __UNWRAP(__Result);
  EXPORT _myear__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,_myear_);
  EXPORT _make__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,_make_);
  EXPORT _model__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,_model_);
  EXPORT _body__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,_body_);
  EXPORT _vin__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,_vin_);
  EXPORT _msrp__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,_msrp_);
  EXPORT _purchasedate__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,_purchasedate_);
  EXPORT _purchaseprice__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,_purchaseprice_);
  EXPORT _value__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,_value_);
  EXPORT SanityCheck := DATASET([{COUNT(KEL_tutorial_File_Vehicle_Small_File_Invalid),COUNT(_myear__SingleValue_Invalid),COUNT(_make__SingleValue_Invalid),COUNT(_model__SingleValue_Invalid),COUNT(_body__SingleValue_Invalid),COUNT(_vin__SingleValue_Invalid),COUNT(_msrp__SingleValue_Invalid),COUNT(_purchasedate__SingleValue_Invalid),COUNT(_purchaseprice__SingleValue_Invalid),COUNT(_value__SingleValue_Invalid)}],{KEL.typ.int KEL_tutorial_File_Vehicle_Small_File_Invalid,KEL.typ.int _myear__SingleValue_Invalid,KEL.typ.int _make__SingleValue_Invalid,KEL.typ.int _model__SingleValue_Invalid,KEL.typ.int _body__SingleValue_Invalid,KEL.typ.int _vin__SingleValue_Invalid,KEL.typ.int _msrp__SingleValue_Invalid,KEL.typ.int _purchasedate__SingleValue_Invalid,KEL.typ.int _purchaseprice__SingleValue_Invalid,KEL.typ.int _value__SingleValue_Invalid});
  EXPORT NullCounts := DATASET([
    {'Vehicle','KEL_tutorial.File_Vehicle.Small.File','UID',COUNT(KEL_tutorial_File_Vehicle_Small_File_Invalid),COUNT(__d0)},
    {'Vehicle','KEL_tutorial.File_Vehicle.Small.File','myear',COUNT(__d0(__NL(_myear_))),COUNT(__d0(__NN(_myear_)))},
    {'Vehicle','KEL_tutorial.File_Vehicle.Small.File','name.make',COUNT(__d0(__NL(_make_))),COUNT(__d0(__NN(_make_)))},
    {'Vehicle','KEL_tutorial.File_Vehicle.Small.File','name.model',COUNT(__d0(__NL(_model_))),COUNT(__d0(__NN(_model_)))},
    {'Vehicle','KEL_tutorial.File_Vehicle.Small.File','name.body',COUNT(__d0(__NL(_body_))),COUNT(__d0(__NN(_body_)))},
    {'Vehicle','KEL_tutorial.File_Vehicle.Small.File','vin',COUNT(__d0(__NL(_vin_))),COUNT(__d0(__NN(_vin_)))},
    {'Vehicle','KEL_tutorial.File_Vehicle.Small.File','msrp',COUNT(__d0(__NL(_msrp_))),COUNT(__d0(__NN(_msrp_)))},
    {'Vehicle','KEL_tutorial.File_Vehicle.Small.File','purchasedate',COUNT(__d0(__NL(_purchasedate_))),COUNT(__d0(__NN(_purchasedate_)))},
    {'Vehicle','KEL_tutorial.File_Vehicle.Small.File','purchaseprice',COUNT(__d0(__NL(_purchaseprice_))),COUNT(__d0(__NN(_purchaseprice_)))},
    {'Vehicle','KEL_tutorial.File_Vehicle.Small.File','value',COUNT(__d0(__NL(_value_))),COUNT(__d0(__NN(_value_)))}]
  ,{KEL.typ.str entity,KEL.typ.str fileName,KEL.typ.str fieldName,KEL.typ.int nullCount,KEL.typ.int notNullCount});
END;
