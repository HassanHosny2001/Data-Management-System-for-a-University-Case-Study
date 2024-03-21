DROP TRIGGER UNIVERSITY.CALCULATE_POINTS_QUALITY;

CREATE OR REPLACE TRIGGER UNIVERSITY.calculate_points_quality
BEFORE INSERT OR UPDATE ON UNIVERSITY.ENROLL FOR EACH ROW
DECLARE
  grade_points NUMBER;
  max_gpa NUMBER := 4.00; -- Set the maximum GPA value
  v_course_credits NUMBER;
BEGIN
  -- Fetch the course_credits for the given course_id
  SELECT course_credits INTO v_course_credits
  FROM Courses
  WHERE course_id = :NEW.course_id;

  -- Define the grade points based on the grade
  CASE UPPER(:NEW.grade)
    WHEN 'A+' THEN grade_points := 4.00; -- Treat A+ as 4.00
    WHEN 'A'  THEN grade_points := 4.00;
    WHEN 'A-' THEN grade_points := 3.70;
    WHEN 'B+' THEN grade_points := 3.30;
    WHEN 'B'  THEN grade_points := 3.00;
    WHEN 'B-' THEN grade_points := 2.70;
    WHEN 'C+' THEN grade_points := 2.30;
    WHEN 'C'  THEN grade_points := 2.00;
    WHEN 'C-' THEN grade_points := 1.70;
    WHEN 'D+' THEN grade_points := 1.30;
    WHEN 'D'  THEN grade_points := 1.00;
    WHEN 'D-' THEN grade_points := 0.70;
    WHEN 'F'  THEN grade_points := 0.00;
    ELSE grade_points := 0; -- Default value for unrecognized grades
  END CASE;

  -- Calculate GPA and cap it at the maximum value
  :NEW.points := LEAST(grade_points, max_gpa);
  :NEW.quality_points := LEAST(grade_points, max_gpa) * v_course_credits;
END;
/
