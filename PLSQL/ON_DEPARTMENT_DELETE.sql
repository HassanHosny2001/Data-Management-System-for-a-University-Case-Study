﻿DROP TRIGGER UNIVERSITY.ON_DEPARTMENT_DELETE;

CREATE OR REPLACE TRIGGER UNIVERSITY.on_department_delete
BEFORE DELETE ON UNIVERSITY.DEPARTMENTS FOR EACH ROW
BEGIN
  DELETE FROM courses WHERE department_id = :OLD.department_id;
  DELETE FROM students WHERE department_id = :OLD.department_id;
END;
/