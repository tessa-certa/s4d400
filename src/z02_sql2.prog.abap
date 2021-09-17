*&---------------------------------------------------------------------*
*& Report z02_sql2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z02_sql2.
DATA: g_flights  TYPE d400_t_flights,
      l_airline  TYPE d400_s_flight-carrid,
      l_flnumber TYPE d400_s_flight-connid.

cl_s4d_input=>get_connection(
  IMPORTING
    ev_airline   = l_airline
    ev_flight_no = l_flnumber
).

SELECT FROM sflight
FIELDS carrid, connid, fldate, planetype, seatsmax, seatsocc
WHERE carrid = @l_airline AND connid = @l_flnumber
INTO TABLE @g_flights.

cl_s4d_output=>display_table( it_table = g_flights  ).
