//HPCC Systems KEL Compiler Version 0.11.2
IMPORT KEL011 AS KEL;
IMPORT $;
IMPORT * FROM KEL011.Null;
EXPORT FN_Queries := MODULE
  EXPORT KEL.typ.nbool FN_R_E_G_E_X_F_I_N_D(KEL.typ.nstr __PSearchFor, KEL.typ.nstr __PSource) := FUNCTION
    SearchFor := __T(__PSearchFor);
    Source := __T(__PSource);
    __IsNull := __NL(__PSearchFor) OR __NL(__PSource);
    __Value := REGEXFIND(SearchFor,Source,NOCASE);
    RETURN __BNT(__Value,__IsNull,KEL.typ.nbool);
  END;
END;
