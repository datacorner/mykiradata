SET DEFINE OFF;
--SQL Statement which produced this data:
--
--  SELECT * FROM DGM.DIM_SCORECARD;
--
Insert into DIM_SCORECARD
   (SCO_PK, SCO_NAME, SCO_DESCRIPTION, SCO_LASTRUN, SCO_DATETIME_LOAD, 
    SCO_IDENTIFIER, SCO_FUNCKEY, SCO_PROJECT, SCO_FULLPATH)
 Values
   (2, 'HIN_Discovery_Scorecard', 'HIN_Discovery_Scorecard', TO_TIMESTAMP('07/01/2014 22:48:35.000000','DD/MM/YYYY HH24:MI:SS.FF'), TO_TIMESTAMP('26/01/2017 08:29:15.000000','DD/MM/YYYY HH24:MI:SS.FF'), 
    'HIN_Discovery_Scorecard', 'HIN_Discovery_Scorecard', NULL, NULL);
Insert into DIM_SCORECARD
   (SCO_PK, SCO_NAME, SCO_DESCRIPTION, SCO_LASTRUN, SCO_DATETIME_LOAD, 
    SCO_IDENTIFIER, SCO_FUNCKEY, SCO_PROJECT, SCO_FULLPATH)
 Values
   (3, 'HIN_Individual_Before_and_After', 'HIN_Individual_Before_and_After', TO_TIMESTAMP('07/01/2014 22:49:50.000000','DD/MM/YYYY HH24:MI:SS.FF'), TO_TIMESTAMP('26/01/2017 08:29:15.000000','DD/MM/YYYY HH24:MI:SS.FF'), 
    'HIN_Individual_Before_and_After', 'HIN_Individual_Before_and_After', NULL, NULL);
Insert into DIM_SCORECARD
   (SCO_PK, SCO_NAME, SCO_DESCRIPTION, SCO_LASTRUN, SCO_DATETIME_LOAD, 
    SCO_IDENTIFIER, SCO_FUNCKEY, SCO_PROJECT, SCO_FULLPATH)
 Values
   (4, 'MDM_Hub_Scorecard', 'MDM_Hub_Scorecard', TO_TIMESTAMP('30/01/2016 10:11:30.000000','DD/MM/YYYY HH24:MI:SS.FF'), TO_TIMESTAMP('26/01/2017 08:29:15.000000','DD/MM/YYYY HH24:MI:SS.FF'), 
    'MDM_Hub_Scorecard', 'MDM_Hub_Scorecard', NULL, NULL);
Insert into DIM_SCORECARD
   (SCO_PK, SCO_NAME, SCO_DESCRIPTION, SCO_LASTRUN, SCO_DATETIME_LOAD, 
    SCO_IDENTIFIER, SCO_FUNCKEY, SCO_PROJECT, SCO_FULLPATH)
 Values
   (0, 'Unknown', 'Unknown', NULL, TO_TIMESTAMP('02/12/2016 02:23:49.000000','DD/MM/YYYY HH24:MI:SS.FF'), 
    NULL, 'UNKN', NULL, NULL);
Insert into DIM_SCORECARD
   (SCO_PK, SCO_NAME, SCO_DESCRIPTION, SCO_LASTRUN, SCO_DATETIME_LOAD, 
    SCO_IDENTIFIER, SCO_FUNCKEY, SCO_PROJECT, SCO_FULLPATH)
 Values
   (1, 'Contract_Scorecard', 'Contract_Scorecard', TO_TIMESTAMP('30/01/2016 04:03:44.000000','DD/MM/YYYY HH24:MI:SS.FF'), TO_TIMESTAMP('26/01/2017 08:29:15.000000','DD/MM/YYYY HH24:MI:SS.FF'), 
    'Contract_Scorecard', 'Contract_Scorecard', NULL, NULL);
COMMIT;