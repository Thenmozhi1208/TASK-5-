CLASS zcit_employes DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcit_employes IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    " Step 1 – Data Declarations
    DATA: gv_id     TYPE i,
          gv_name   TYPE string,
          gv_salary TYPE i.

    CONSTANTS: gc_min_salary TYPE i VALUE 20000.

    " Step 2 – Create Structure
    TYPES: BEGIN OF ty_employee,
             id     TYPE i,
             name   TYPE string,
             salary TYPE i,
           END OF ty_employee.

    " Step 3 – Create Internal Table
    DATA: gt_employees TYPE STANDARD TABLE OF ty_employee,
          gs_employee  TYPE ty_employee.

    " Step 4 – Insert Employee Records
    gs_employee-id = 101.
    gs_employee-name = 'Anitha'.
    gs_employee-salary = 40000.
    APPEND gs_employee TO gt_employees.

    gs_employee-id = 102.
    gs_employee-name = 'Karthik'.
    gs_employee-salary = 18000.
    APPEND gs_employee TO gt_employees.

    " Step 5 – Display All Employees
    LOOP AT gt_employees INTO gs_employee.
      out->write( |{ gs_employee-id } { gs_employee-name } { gs_employee-salary }| ).
    ENDLOOP.

    " Step 6 – READ TABLE using key
    READ TABLE gt_employees INTO gs_employee
         WITH KEY id = 102.

    " Step 7 – Check SY-SUBRC
    IF sy-subrc = 0.
      out->write( |Employee Found: { gs_employee-name }| ).
    ELSE.
      out->write( 'Employee Not Found' ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.
