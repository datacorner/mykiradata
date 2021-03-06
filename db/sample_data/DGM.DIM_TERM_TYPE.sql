SET DEFINE OFF;
--SQL Statement which produced this data:
--
--  SELECT * FROM DGM.DIM_TERM_TYPE;
--
Insert into DIM_TERM_TYPE
   (TRT_PK, TRT_NAME, TRT_DESCRIPTION, TRT_DATETIME_LOAD, TRT_FUNCKEY)
 Values
   (2, 'Entities', 'Entities', TO_TIMESTAMP('26/01/2017 08:29:11.000000','DD/MM/YYYY HH24:MI:SS.FF'), 'Entities');
Insert into DIM_TERM_TYPE
   (TRT_PK, TRT_NAME, TRT_DESCRIPTION, TRT_DATETIME_LOAD, TRT_FUNCKEY)
 Values
   (3, 'Attributes', 'Attributes', TO_TIMESTAMP('26/01/2017 08:29:11.000000','DD/MM/YYYY HH24:MI:SS.FF'), 'Attributes');
Insert into DIM_TERM_TYPE
   (TRT_PK, TRT_NAME, TRT_DESCRIPTION, TRT_DATETIME_LOAD, TRT_FUNCKEY)
 Values
   (4, 'Data Quality Controls', 'Data Quality Controls', TO_TIMESTAMP('26/01/2017 08:29:11.000000','DD/MM/YYYY HH24:MI:SS.FF'), 'Data Quality Controls');
Insert into DIM_TERM_TYPE
   (TRT_PK, TRT_NAME, TRT_DESCRIPTION, TRT_DATETIME_LOAD, TRT_FUNCKEY)
 Values
   (0, 'Unknown', 'UNKN', NULL, 'UNKN');
Insert into DIM_TERM_TYPE
   (TRT_PK, TRT_NAME, TRT_DESCRIPTION, TRT_DATETIME_LOAD, TRT_FUNCKEY)
 Values
   (1, 'Applications', 'Applications', TO_TIMESTAMP('26/01/2017 08:29:11.000000','DD/MM/YYYY HH24:MI:SS.FF'), 'Applications');
Insert into DIM_TERM_TYPE
   (TRT_PK, TRT_NAME, TRT_DESCRIPTION, TRT_DATETIME_LOAD, TRT_FUNCKEY)
 Values
   (5, NULL, NULL, TO_TIMESTAMP('06/01/2017 07:23:03.000000','DD/MM/YYYY HH24:MI:SS.FF'), NULL);
COMMIT;
