/* This query shows patients with morning appointments for Dr. Alanna Atherton in the month of February */

SELECT 
patient.patient_id,patient_fname,patient_lname,
employee.employee_id,employee_fname,employee_lname, 
appointment_date,appointment_time, appointment_type
FROM patient, appointment,employee
WHERE patient.patient_id=appointment.patient_id AND appointment.employee_id=employee.employee_id AND employee_fname = ‘Alanna’ AND employee_lname = ‘Atherton’
AND appointment_date BETWEEN '01-FEB-20' AND '28-FEB-20' AND appointment_time < '12:00';

/* This query shows which departments hired new employees after February 1st, 2020 */

SELECT 
Department.department_id,department.department_name, 
employee.employee_fname, employee.employee_lname,employee.hire_date
FROM department, employee
WHERE department.department_id = employee.department_id
AND hire_date > TO_DATE(‘02/01/2020’, ‘MM/DD/YYYY’)
ORDER BY hire_date ASC;

/* This query shows which training courses employees have completed and the expiration date of these training courses */

SELECT 
employee_fname AS Trainee_FirstName, 
employee_lname AS Trainee_LastName, 
Training_Course, Certification_Expiration 
FROM employee, training
WHERE training.employee_id = employee.employee_id
ORDER BY Certification_expiration;

/* This query shows the different appointment types and how many appointments of this type was scheduled during the year */

SELECT 
COUNT(appointment_id) AS NumOfAppointments, 
appointment_type 
FROM APPOINTMENT 
GROUP BY appointment_type 
HAVING COUNT(appointment_id) > 0 
ORDER BY COUNT(appointment_id) DESC;

/* This query shows a list of nurses and the years of experience they have. 
This will be ordered by the amount of years of experience each nurse has aquired. */

SELECT 
employee_fname AS nurse_fname, 
employee_lname AS nurse_lname, years_of_experience 
FROM employee, nurse 
WHERE employee.employee_id = nurse.employee_id 
ORDER BY years_of_experience DESC;
