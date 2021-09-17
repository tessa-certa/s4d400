*&---------------------------------------------------------------------*
*& Report z02_stringaufgabe
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z02_stringaufgabe.
PARAMETERS p_string TYPE string.
DATA(p_sub_str) = substring( val = p_string  off = 0 len = 1 ).
CASE p_sub_str.
  WHEN 'A'.
    DATA(result) = to_lower( p_string ).
  WHEN 'Z'.
    result = reverse( p_string ).
  WHEN OTHERS.
    WHILE sy-index LE strlen( p_string ) .
      WRITE:  / |{ sy-index }: { substring( val = p_string off = sy-index - 1  len = 1 ) }|.
    ENDWHILE.
ENDCASE.
WRITE result.
