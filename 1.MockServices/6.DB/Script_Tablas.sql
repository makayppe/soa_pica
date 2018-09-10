----------------------------------------------------------------------
-- CREACION DE TABLA DE PRESTAMOS
----------------------------------------------------------------------
--DROP TABLE STG.T_LOAN;
CREATE TABLE STG.T_LOAN(
  ID_LOAD   NUMBER,
  TYPE_ID_PEOPLE VARCHAR(5 BYTE),
  ID_PEOPLE VARCHAR(100 BYTE),
  DATE_INSERT_LOAD   DATE,
  DATE_MODIFY_LOAD   DATE,
  AMOUNT_LOAD NUMBER,
  DESC_LOAD VARCHAR(500 BYTE),
  STATUS_LOAD INTEGER,
  CONSTRAINT PK_LOAN PRIMARY KEY (ID_LOAD)
)PARTITION BY LIST (DATE_INSERT_LOAD)
( PARTITION P20180901 VALUES (TO_DATE('20180901','YYYYMMDD'))
);

COMMENT ON TABLE  STG.T_LOAN IS 'Tabla para almacenar los prestamos';
COMMENT ON COLUMN STG.T_LOAN.ID_LOAD IS 'Secuencia utilizado como identificador de prestamos';
COMMENT ON COLUMN STG.T_LOAN.TYPE_ID_PEOPLE IS 'Tipo de identificacion de la persona que solicita el prestamo';
COMMENT ON COLUMN STG.T_LOAN.ID_PEOPLE IS 'Identificacion de Usuario que solicita el prestamo';
COMMENT ON COLUMN STG.T_LOAN.DATE_INSERT_LOAD IS 'Fecha de insercion del prestamo';
COMMENT ON COLUMN STG.T_LOAN.DATE_MODIFY_LOAD IS 'Fecha Ultima modificacion del prestamo';
COMMENT ON COLUMN STG.T_LOAN.AMOUNT_LOAD IS 'Monto del prestamo';
COMMENT ON COLUMN STG.T_LOAN.DESC_LOAD IS 'Descripcion del prestamo';
COMMENT ON COLUMN STG.T_LOAN.STATUS_LOAD IS 'status del prestamos 0 = Inactivo 1 = Activo ';

----------------------------------------------------------------------
-- CREACION DE SECUENCIA PRESTAMOS
----------------------------------------------------------------------
--DROP SEQUENCE STG.SEQ_LOAN;
CREATE SEQUENCE STG.SEQ_LOAN
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;
 
----------------------------------------------------------------------
-- CREACION DE PARTICIONES
----------------------------------------------------------------------
 Declare 
    Ld_Fch_Prttn       date := to_date('20180901','yyyymmdd');
    Ld_Fch_Prttn_fin   date := to_date('20181130','yyyymmdd');
    Resultado          varchar2(2000);
    Ln_Prttn           number:=0;

Begin 
  
  While Ld_Fch_Prttn <= Ld_Fch_Prttn_fin loop    

       -- 1
      begin

        Select COUNT(1)  Into Ln_Prttn
        From  Sys.All_Objects
        Where Object_Name = 'T_LOAN'
        And Owner='STG'
        And Subobject_Name='P'||TO_CHAR(Ld_Fch_Prttn,'YYYYMMDD')
        And Object_Type='TABLE PARTITION';

        If Ln_Prttn=0 Then
                Begin
                    Execute Immediate 'ALTER TABLE STG.T_LOAN ADD PARTITION P'|| To_Char(Ld_Fch_Prttn,'YYYYMMDD') ||
                          ' VALUES (TO_DATE( ' || Chr(39) || To_Char(Ld_Fch_Prttn,'YYYY-MM-DD') || ' 00:00:00'|| Chr(39) || ', '|| Chr(39) || 'SYYYY-MM-DD HH24:MI:SS'|| Chr(39) || ', ' ||
                           Chr(39)|| 'NLS_CALENDAR=GREGORIAN'|| Chr(39) || '))' ;
                End;      
        End If;
              --
      Exception
        When NO_DATA_FOUND Then
        NULL;
      End;
      Ld_Fch_Prttn := Ld_Fch_Prttn+1;
        
  End loop;
End;
/

----------------------------------------------------------------------
-- PRUEBA DE INSERCION DE PRESTAMO
----------------------------------------------------------------------

BEGIN
STG.PR_INSERT_LOAN ( P_TYPE_ID_PEOPLE => 'CE',
                     P_ID_PEOPLE => '123456',
                     P_AMOUNT_LOAD => 10000,
                     P_DESCRIPTION_LOAD => 'Prueba de Prestamo'
                    );
COMMIT;
END;
/


