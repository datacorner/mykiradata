SET DEFINE OFF;
--SQL Statement which produced this data:
--
--  SELECT * FROM DGM.LND_CATEGORY;
--
Insert into LND_CATEGORY
   (JOYFUNCKEY, CATEGORY_NAME, CATEGORY_DESCRIPTION, CATEGORY_FULLPATH, CATEGORY_PARENT_KEY, 
    JOYLOADDATE, JOYSTATUS)
 Values
   ('5802017255400', 'Business Rules', NULL, 'Business Rules', '5691648881600', 
    TO_TIMESTAMP('02/12/2016 02:24:35.000000','DD/MM/YYYY HH24:MI:SS.FF'), 'L');
Insert into LND_CATEGORY
   (JOYFUNCKEY, CATEGORY_NAME, CATEGORY_DESCRIPTION, CATEGORY_FULLPATH, CATEGORY_PARENT_KEY, 
    JOYLOADDATE, JOYSTATUS)
 Values
   ('5691648881600', 'Controls', NULL, 'Controls', '6098341290800', 
    TO_TIMESTAMP('24/01/2017 09:32:21.000000','DD/MM/YYYY HH24:MI:SS.FF'), 'L');
COMMIT;
