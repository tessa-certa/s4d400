*&---------------------------------------------------------------------*
*& Report z02_itab
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z02_itab.
DATA gt_connections TYPE z02_connections.
gt_connections = VALUE #( ( carrid = 'LH'
                            connid = '400' )
                          ( carrid = 'LH'
                            connid = '402' ) ).
DATA gt_flights TYPE d400_t_flights.

CALL FUNCTION 'Z_02_getflightconn'
  EXPORTING
    it_connections = gt_connections
  IMPORTING
    et_flights     = gt_flights
  EXCEPTIONS
    error_message  = 1
    OTHERS         = 2.

DATA gt_percentage TYPE d400_t_percentage.

gt_percentage = CORRESPONDING #( gt_flights ).



LOOP AT gt_percentage REFERENCE INTO data(l_percentage).
   l_percentage->percentage = l_percentage->seatsocc / l_percentage->seatsmax * 100.
ENDLOOP.

cl_s4d_output=>display_table( gt_percentage ).
