//HPCC Systems KEL Compiler Version 0.11.2
IMPORT KEL011 AS KEL;
IMPORT KEL_tutorial;
IMPORT * FROM KEL011.Null;
EXPORT E_Person := MODULE
  EXPORT Typ := KEL.typ.uid;
  EXPORT InLayout := RECORD
    KEL.typ.nuid UID;
    KEL.typ.nstr _fname_;
    KEL.typ.nstr _mname_;
    KEL.typ.nstr _lname_;
    KEL.typ.nstr _sex_;
    KEL.typ.nstr _bdate_;
    KEL.typ.nint _age_;
    KEL.typ.nint _income_;
    KEL.typ.nstr _address1_;
    KEL.typ.nstr _address2_;
    KEL.typ.nstr _city_;
    KEL.typ.nstr _state_;
  END;
  SHARED VIRTUAL __SourceFilter(DATASET(InLayout) __ds) := __ds;
  SHARED VIRTUAL __GroupedFilter(GROUPED DATASET(InLayout) __ds) := __ds;
  SHARED __Mapping := 'id(UID),fname(_fname_:\'\'),mname(_mname_:\'\'),lname(_lname_:\'\'),sex(_sex_:\'\'),bdate(_bdate_:\'\'),age(_age_:0),income(_income_:0),address1(_address1_:\'\'),address2(_address2_:\'\'),city(_city_:\'\'),state(_state_:\'\')';
  EXPORT KEL_tutorial_File_Person_Small_File_Invalid := KEL_tutorial.File_Person.Small.File((KEL.typ.uid)id = 0);
  SHARED __d0_Prefiltered := KEL_tutorial.File_Person.Small.File((KEL.typ.uid)id <> 0);
  SHARED __d0 := __SourceFilter(KEL.FromFlat.Convert(__d0_Prefiltered,InLayout,__Mapping));
  EXPORT InData := __d0;
  EXPORT _name_Layout := RECORD
    KEL.typ.nstr _fname_;
    KEL.typ.nstr _mname_;
    KEL.typ.nstr _lname_;
    KEL.typ.int __RecordCount := 0;
  END;
  EXPORT _bdate_Layout := RECORD
    KEL.typ.nstr _bdate_;
    KEL.typ.int __RecordCount := 0;
  END;
  EXPORT _age_Layout := RECORD
    KEL.typ.nint _age_;
    KEL.typ.int __RecordCount := 0;
  END;
  EXPORT _income_Layout := RECORD
    KEL.typ.nint _income_;
    KEL.typ.int __RecordCount := 0;
  END;
  EXPORT _address_Layout := RECORD
    KEL.typ.nstr _address1_;
    KEL.typ.nstr _address2_;
    KEL.typ.nstr _city_;
    KEL.typ.nstr _state_;
    KEL.typ.int __RecordCount := 0;
  END;
  EXPORT Layout := RECORD
    KEL.typ.nuid UID;
    KEL.typ.ndataset(_name_Layout) _name_;
    KEL.typ.nstr _sex_;
    KEL.typ.ndataset(_bdate_Layout) _bdate_;
    KEL.typ.ndataset(_age_Layout) _age_;
    KEL.typ.ndataset(_income_Layout) _income_;
    KEL.typ.ndataset(_address_Layout) _address_;
    KEL.typ.int __RecordCount := 0;
  END;
  EXPORT __PostFilter := __GroupedFilter(GROUP(DISTRIBUTE(InData,HASH(UID)),UID,LOCAL,ALL));
  Person_Group := __PostFilter;
  Layout Person__Rollup(InLayout __r, DATASET(InLayout) __recs) := TRANSFORM
    SELF._name_ := __CN(PROJECT(TABLE(__recs,{KEL.typ.int __RecordCount := COUNT(GROUP),_fname_,_mname_,_lname_},_fname_,_mname_,_lname_),_name_Layout)(__NN(_fname_) OR __NN(_mname_) OR __NN(_lname_)));
    SELF._sex_ := KEL.Intake.SingleValue(__recs,_sex_);
    SELF._bdate_ := __CN(PROJECT(TABLE(__recs,{KEL.typ.int __RecordCount := COUNT(GROUP),_bdate_},_bdate_),_bdate_Layout)(__NN(_bdate_)));
    SELF._age_ := __CN(PROJECT(TABLE(__recs,{KEL.typ.int __RecordCount := COUNT(GROUP),_age_},_age_),_age_Layout)(__NN(_age_)));
    SELF._income_ := __CN(PROJECT(TABLE(__recs,{KEL.typ.int __RecordCount := COUNT(GROUP),_income_},_income_),_income_Layout)(__NN(_income_)));
    SELF._address_ := __CN(PROJECT(TABLE(__recs,{KEL.typ.int __RecordCount := COUNT(GROUP),_address1_,_address2_,_city_,_state_},_address1_,_address2_,_city_,_state_),_address_Layout)(__NN(_address1_) OR __NN(_address2_) OR __NN(_city_) OR __NN(_state_)));
    SELF.__RecordCount := COUNT(__recs);
    SELF := __r;
  END;
  Layout Person__Single_Rollup(InLayout __r) := TRANSFORM
    SELF._name_ := __CN(PROJECT(DATASET(__r),TRANSFORM(_name_Layout,SELF.__RecordCount:=1;,SELF:=LEFT))(__NN(_fname_) OR __NN(_mname_) OR __NN(_lname_)));
    SELF._bdate_ := __CN(PROJECT(DATASET(__r),TRANSFORM(_bdate_Layout,SELF.__RecordCount:=1;,SELF:=LEFT))(__NN(_bdate_)));
    SELF._age_ := __CN(PROJECT(DATASET(__r),TRANSFORM(_age_Layout,SELF.__RecordCount:=1;,SELF:=LEFT))(__NN(_age_)));
    SELF._income_ := __CN(PROJECT(DATASET(__r),TRANSFORM(_income_Layout,SELF.__RecordCount:=1;,SELF:=LEFT))(__NN(_income_)));
    SELF._address_ := __CN(PROJECT(DATASET(__r),TRANSFORM(_address_Layout,SELF.__RecordCount:=1;,SELF:=LEFT))(__NN(_address1_) OR __NN(_address2_) OR __NN(_city_) OR __NN(_state_)));
    SELF.__RecordCount := 1;
    SELF := __r;
  END;
  EXPORT __PreResult := ROLLUP(HAVING(Person_Group,COUNT(ROWS(LEFT))=1),GROUP,Person__Single_Rollup(LEFT)) + ROLLUP(HAVING(Person_Group,COUNT(ROWS(LEFT))>1),GROUP,Person__Rollup(LEFT, ROWS(LEFT)));
  EXPORT __Result := __CLEARFLAGS(__PreResult) : PERSIST('~temp::KEL::WrobelKEL::Person::Result',EXPIRE(7));
  EXPORT Result := __UNWRAP(__Result);
  EXPORT _sex__SingleValue_Invalid := KEL.Intake.DetectMultipleValues(__PreResult,_sex_);
  EXPORT SanityCheck := DATASET([{COUNT(KEL_tutorial_File_Person_Small_File_Invalid),COUNT(_sex__SingleValue_Invalid)}],{KEL.typ.int KEL_tutorial_File_Person_Small_File_Invalid,KEL.typ.int _sex__SingleValue_Invalid});
  EXPORT NullCounts := DATASET([
    {'Person','KEL_tutorial.File_Person.Small.File','UID',COUNT(KEL_tutorial_File_Person_Small_File_Invalid),COUNT(__d0)},
    {'Person','KEL_tutorial.File_Person.Small.File','fname',COUNT(__d0(__NL(_fname_))),COUNT(__d0(__NN(_fname_)))},
    {'Person','KEL_tutorial.File_Person.Small.File','mname',COUNT(__d0(__NL(_mname_))),COUNT(__d0(__NN(_mname_)))},
    {'Person','KEL_tutorial.File_Person.Small.File','lname',COUNT(__d0(__NL(_lname_))),COUNT(__d0(__NN(_lname_)))},
    {'Person','KEL_tutorial.File_Person.Small.File','sex',COUNT(__d0(__NL(_sex_))),COUNT(__d0(__NN(_sex_)))},
    {'Person','KEL_tutorial.File_Person.Small.File','bdate',COUNT(__d0(__NL(_bdate_))),COUNT(__d0(__NN(_bdate_)))},
    {'Person','KEL_tutorial.File_Person.Small.File','age',COUNT(__d0(__NL(_age_))),COUNT(__d0(__NN(_age_)))},
    {'Person','KEL_tutorial.File_Person.Small.File','income',COUNT(__d0(__NL(_income_))),COUNT(__d0(__NN(_income_)))},
    {'Person','KEL_tutorial.File_Person.Small.File','address1',COUNT(__d0(__NL(_address1_))),COUNT(__d0(__NN(_address1_)))},
    {'Person','KEL_tutorial.File_Person.Small.File','address2',COUNT(__d0(__NL(_address2_))),COUNT(__d0(__NN(_address2_)))},
    {'Person','KEL_tutorial.File_Person.Small.File','city',COUNT(__d0(__NL(_city_))),COUNT(__d0(__NN(_city_)))},
    {'Person','KEL_tutorial.File_Person.Small.File','state',COUNT(__d0(__NL(_state_))),COUNT(__d0(__NN(_state_)))}]
  ,{KEL.typ.str entity,KEL.typ.str fileName,KEL.typ.str fieldName,KEL.typ.int nullCount,KEL.typ.int notNullCount});
END;
