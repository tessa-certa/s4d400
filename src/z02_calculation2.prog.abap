*&---------------------------------------------------------------------*
*& Report z02_calculation2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z02_calculation2.
PARAMETERS gv_int1 TYPE i.
PARAMETERS gv_int2 TYPE i.
PARAMETERS gv_op TYPE c.

CASE gv_op.
  WHEN '+'.
    DATA gv_ergebnis type z00_packed.
    call function 'Z_02_ADDITION'
      EXPORTING
        im_p1    = conv z00_packed( gv_int1 )
        im_p2    = conv z00_packed( gv_int2 )
      IMPORTING
        e_result = gv_ergebnis
      ..
  WHEN '-'.
    gv_ergebnis = gv_int1 - gv_int2.
  WHEN '/'.
    IF gv_int2 <> 0.
      gv_ergebnis = gv_int1 / gv_int2.
    ELSE.
      CLEAR gv_ergebnis.
    ENDIF.
  WHEN '*'.
    gv_ergebnis = gv_int1 * gv_int2.
  WHEN '%'.
    DATA gv_ergebnis2 TYPE s4d400_percentage.
    CALL FUNCTION 'S4D400_CALCULATE_PERCENTAGE'
      EXPORTING
        iv_int1          = gv_int1
        iv_int2          = gv_int2
      IMPORTING
        ev_result        = gv_ergebnis2
      EXCEPTIONS
        division_by_zero = 1
        OTHERS           = 2.
    WRITE gv_ergebnis2.

ENDCASE.
WRITE gv_ergebnis.
