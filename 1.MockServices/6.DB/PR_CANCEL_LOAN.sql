CREATE OR REPLACE PROCEDURE PR_CANCEL_LOAN (P_USER IN VARCHAR2 DEFAULT USER,
                                            P_ID_LOAD IN VARCHAR2
)  AUTHID CURRENT_USER IS
/******************************************************************************
   NAME:       PR_CANCEL_LOAN
   PURPOSE:    cancelar el loan en Wizard

   REVISIONS:
   VER        DATE        AUTHOR           DESCRIPTION
   ---------  ----------  ---------------  ------------------------------------
   1.0        08/09/2018  Gerardo Herrera.     1. CREATED THIS PROCEDURE.

   NOTES:

   AUTOMATICALLY AVAILABLE AUTO REPLACE KEYWORDS:
      OBJECT NAME:     PR_CANCEL_LOAN
      SYSDATE:         09/09/2018
      DATE AND TIME:   09/09/2018, 08:09:15 A.M., AND 09/09/2018 08:09:15 A.M.
      USERNAME:        Gerardo Herrera
      TABLE NAME:      (SET IN THE "NEW PL/SQL OBJECT" DIALOG)

******************************************************************************/
 
  v_job_name                  varchar2(30) := 'PR_CANCEL_LOAN';
  v_start_date                date         := sysdate;
  v_end_date                  date;
  v_comment_                  varchar2(255);
  v_successfull               varchar2(1)  :='N';
  v_total_readed_rows         number:=0;
  v_total_inserted_rows       number:=0;
  v_total_discarded_rows      number:=0;
  v_total_update_rows         number:=0;
  v_total_delete_rows         number:=0;
  v_usuario_bd                varchar2(30) := user;
  v_job_owner                 varchar2(30) := 'GERARDO HERRERA';
  v_job_type                  varchar2(30) := 'PL-SQL';
  v_dia                       varchar2(2);
  v_cadena                    varchar2(2000);
  v_temp_inserted_rows        number:=0;
  v_temp_update_rows          number:=0;
  v_temp_readed_rows          number:=0;
  v_data_date                 date := trunc(sysdate);
  v_job_id                    number;
  v_step                      number;
  v_Ln_Lmt_Cmmt                 Constant Number        := 1000;
  v_Ln_Cnt                      Number                 := 0;
begin
   -- ---------------------------------------------------------------------------
   -- Inicializa variables
   -- ---------------------------------------------------------------------------
   v_step        := 1;
   v_successfull := 'P';
   v_comment_ := 'Inicializando variables';
   DBMS_OUTPUT.PUT_LINE(v_comment_);
   commit;

   v_total_readed_rows    := 0;
   v_total_inserted_rows  := 0;
   v_total_discarded_rows := 0;
   v_total_update_rows    := 0;
   
   -- ---------------------------------------------------------------------------
   -- Insertando datos
   -- ---------------------------------------------------------------------------
   v_comment_ := 'Cancelando';
   DBMS_OUTPUT.PUT_LINE(v_comment_);
   Commit;

   UPDATE STG.T_LOAN
   SET DATE_MODIFY_LOAD = TRUNC(SYSDATE) , STATUS_LOAD = 0
   WHERE ID_LOAD = P_ID_LOAD;
   

   v_total_update_rows := v_total_update_rows + SQL%ROWCOUNT;
   v_comment_ := 'Registros Cancelados: '|| TO_CHAR(v_total_update_rows);
   DBMS_OUTPUT.PUT_LINE(v_comment_);
   commit;

  v_comment_ := 'Termino Ok ..';
  v_successfull := 'Y';
  DBMS_OUTPUT.PUT_LINE(v_comment_);
  commit;
  
exception when others then
  rollback;
  v_comment_ := (v_comment_ || ' ' || sqlcode || ' ' || sqlerrm);
  DBMS_OUTPUT.PUT_LINE(v_comment_);
  commit;
  raise;

end;

/
