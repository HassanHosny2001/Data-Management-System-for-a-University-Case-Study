﻿DROP TRIGGER UNIVERSITY.ON_STUDENT_DELETE;

CREATE OR REPLACE TRIGGER UNIVERSITY.on_student_delete
BEFORE DELETE ON UNIVERSITY.STUDENTS FOR EACH ROW
BEGIN
  DELETE FROM enroll WHERE student_id = :OLD.student_id;
END;
/
