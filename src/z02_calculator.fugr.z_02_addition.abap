FUNCTION z_02_addition.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IM_P1) TYPE  Z00_PACKED
*"     VALUE(IM_P2) TYPE  Z00_PACKED
*"  EXPORTING
*"     REFERENCE(E_RESULT) TYPE  Z00_PACKED
*"----------------------------------------------------------------------

  e_result = im_p1 + im_p2.




ENDFUNCTION.
