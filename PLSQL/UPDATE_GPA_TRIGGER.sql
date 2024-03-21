DROP TRIGGER UNIVERSITY.UPDATE_GPA_TRIGGER;

CREATE OR REPLACE TRIGGER UNIVERSITY.UPDATE_GPA_TRIGGER
FOR INSERT OR UPDATE OR DELETE ON UNIVERSITY.ENROLL 
COMPOUND TRIGGER
    TYPE enroll_rec_type IS RECORD (
        student_id   UNIVERSITY.ENROLL.student_id%TYPE,
        quality_points NUMBER,
        course_credits NUMBER
    );

    TYPE enroll_tab_type IS TABLE OF enroll_rec_type;
    enroll_tab enroll_tab_type := enroll_tab_type();

    BEFORE STATEMENT IS
    BEGIN
        -- Empty the collection before each statement
        enroll_tab := enroll_tab_type();
    END BEFORE STATEMENT;

    BEFORE EACH ROW IS
    BEGIN
        -- Populate the collection with relevant data for each row
        enroll_tab.EXTEND;
        enroll_tab(enroll_tab.LAST).student_id := :NEW.student_id;
        enroll_tab(enroll_tab.LAST).quality_points := :NEW.quality_points;
        enroll_tab(enroll_tab.LAST).course_credits := :NEW.course_id; -- Corrected binding
    END BEFORE EACH ROW;

    AFTER STATEMENT IS
    BEGIN
        -- Process the data in the collection after the statement
        FOR i IN 1..enroll_tab.COUNT
        LOOP
            DECLARE
                v_total_quality_points NUMBER;
                v_total_credits NUMBER;
                v_gpa NUMBER;
            BEGIN
                -- Calculate total quality points and total credits for the student
                SELECT COALESCE(SUM(e.quality_points), 0),
                       COALESCE(SUM(c.course_credits), 0)
                INTO v_total_quality_points, v_total_credits
                FROM enroll e
                JOIN courses c ON e.course_id = c.course_id
                WHERE e.student_id = enroll_tab(i).student_id;

                -- Avoid division by zero
                IF v_total_credits > 0 THEN
                    -- Calculate GPA using the formula
                    v_gpa := v_total_quality_points / v_total_credits;
                ELSE
                    -- If total credits are zero, set GPA to zero
                    v_gpa := 0;
                END IF;

                -- Update GPA on the students table
                UPDATE students
                SET gpa = v_gpa
                WHERE student_id = enroll_tab(i).student_id;
            END;
        END LOOP;
    END AFTER STATEMENT;

    AFTER EACH ROW IS
    BEGIN
        -- Populate the collection with relevant data for each row being deleted
        IF DELETING THEN
            enroll_tab.EXTEND;
            enroll_tab(enroll_tab.LAST).student_id := :OLD.student_id;
            enroll_tab(enroll_tab.LAST).quality_points := :OLD.quality_points;
            enroll_tab(enroll_tab.LAST).course_credits := :OLD.course_id;
        END IF;
    END AFTER EACH ROW;
END UPDATE_GPA_TRIGGER;
/
