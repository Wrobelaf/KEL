//HPCC Systems KEL Compiler Version 0.11.2
IMPORT KEL011 AS KEL;
IMPORT * FROM KEL011.Null;
EXPORT CFG_Queries := MODULE, VIRTUAL
  EXPORT Show_Persons_Params_Layout := RECORD
    KEL.typ.uid __QueryId := 0;
    KEL.typ.str _p__lname_ := '';
  END;
END;
