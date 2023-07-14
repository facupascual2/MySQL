-- 1. Obtener los datos completos de los empleados.
use personal;
Select * from empleados;
-- 2. Obtener los datos completos de los departamentos
select * from departamentos;
-- Listar el nombre de los departamentos.
select nombre_depto from departamentos;
-- Obtener el nombre y salario de todos los empleados.
select nombre,sal_emp from empleados;
-- Listar todas las comisiones.
select comision_emp from empleados;
-- Obtener los datos de los empleados cuyo cargo sea 'Secretaria'.
select * from empleados where cargo_emp = 'Secretaria';
-- Obtener los datos de los empleados vendedores, ordenados por nombre alfabéticamente.
select * from empleados where cargo_emp = 'vendedor' order by nombre asc ;
-- Obtener el nombre y cargo de todos los empleados, ordenados por salario de menor a mayor.
select nombre,cargo_emp,sal_emp from empleados order by sal_emp asc;
-- Obtener el nombre de o de los jefes que tengan su departamento situado en la ciudad de "Ciudad Real".
select nombre_jefe_depto, ciudad from departamentos where ciudad =  'Ciudad Real';
-- Elabore un listado donde para cada fila, figure el alias 'Nombre' y 'Cargo' para las respectivas tablas de empleados.

-- Listar los salarios y comisiones de los empleados del departamento 2000, ordenado por comisión de menor a mayor.
select nombre, sal_emp, comision_emp from empleados where id_depto = 2000;
-- Obtener el valor total a pagar a cada empleado del departamento 3000, que resulta de: sumar el salario y la comisión, más una bonificación de 500. Mostrar el nombre del empleado y el total a pagar, en orden alfabético.

-- Muestra los empleados cuyo nombre empiece con la letra J.
select nombre from empleados where nombre like 'J%';
-- Listar el salario, la comisión, el salario total (salario + comisión) y nombre, de aquellos empleados que tienen comisión superior a 1000.
select sal_emp,comision_emp, (sal_emp + comision_emp) , nombre from empleados where comision_emp > 1000;
-- Obtener un listado similar al anterior, pero de aquellos empleados que NO tienen comisión.
select sal_emp,comision_emp, (sal_emp + comision_emp) , nombre from empleados where comision_emp = 0;
-- Obtener la lista de los empleados que ganan una comisión superior a su sueldo.
select nombre, comision_emp, sal_emp  from empleados where comision_emp > sal_emp;
-- Listar los empleados cuya comisión es menor o igual que el 30% de su sueldo.
select nombre, comision_emp, sal_emp  from empleados where comision_emp <= 0.3* sal_emp;
-- Hallar los empleados cuyo nombre no contiene la cadena "MA".
select * from empleados where nombre not like "%MA";
-- Obtener los nombres de los departamentos que sean "Ventas", "Investigación" o 'Mantenimiento'.
select * from departamentos where nombre_depto IN ('Ventas', 'Investigación', 'Mantenimiento');
-- Ahora obtener el contrario, los nombres de los departamentos que no sean "Ventas" ni "Investigación" ni 'Mantenimiento'.
select * from departamentos where nombre_depto not IN ('Ventas', 'Investigación', 'Mantenimiento');
-- Mostrar el salario más alto de la empresa.
select MAX(sal_emp) from empleados;
-- Mostrar el nombre del último empleado de la lista por orden alfabético.
select nombre from empleados order by nombre desc limit 1;
-- Hallar el salario más alto, el más bajo y la diferencia entre ellos.
SELECT MAX(sal_emp) AS salario_maximo, MIN(sal_emp) AS salario_minimo, 
       MAX(sal_emp) - MIN(sal_emp) AS diferencia_salarios
FROM empleados;
-- Hallar el salario promedio por departamento.
SELECT departamento, AVG(salario) AS salario_promedio
FROM empleados
GROUP BY departamento;
-- Hallar los departamentos que tienen más de tres empleados. Mostrar el número de empleados de esos departamentos.
SELECT id_depto AS DEPARTAMENTO, AVG(sal_emp) AS 'SALARIO PROMEDIO' FROM empleados GROUP BY id_depto;
-- Hallar los departamentos que no tienen empleados
SELECT id_depto, COUNT(nombre) FROM empleados GROUP BY id_depto HAVING COUNT(nombre)>3;
-- Mostrar la lista de los empleados cuyo salario es mayor o igual que el promedio de la empresa. Ordenarlo por departamento.
