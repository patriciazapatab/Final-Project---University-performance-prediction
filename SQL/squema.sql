USE university;

ALTER TABLE students
    MODIFY DNI VARCHAR(10),
    ADD PRIMARY KEY (DNI);
    
ALTER TABLE university_access
	MODIFY DNI VARCHAR(10),
	ADD CONSTRAINT fk_students_dni_access
	FOREIGN KEY (DNI) REFERENCES students(DNI);

ALTER TABLE previous_education
	MODIFY DNI VARCHAR(10),
	ADD CONSTRAINT fk_students_dni_education
	FOREIGN KEY (DNI) REFERENCES students(DNI);
    
ALTER TABLE matricules
	MODIFY DNI VARCHAR(10),
	ADD CONSTRAINT fk_students_dni_matricules
	FOREIGN KEY (DNI) REFERENCES students(DNI);
    
    SELECT DNI FROM matricules WHERE DNI NOT IN (SELECT DNI FROM students);
    DELETE FROM matricules
	WHERE DNI NOT IN (SELECT DNI FROM students);