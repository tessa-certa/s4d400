*&---------------------------------------------------------------------*
*& Report z02_sql1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z02_sql1.

DATA: g_flight TYPE d400_s_flight,
      l_carrid TYPE d400_s_flight-carrid,
      l_connid TYPE d400_s_flight-connid,
      l_fldate TYPE d400_s_flight-fldate.

cl_s4d_input=>get_flight(
  IMPORTING
    ev_airline   = l_carrid
    ev_flight_no = l_connid
    ev_date      = l_fldate
).

SELECT SINGLE FROM sflight
FIELDS carrid, connid, fldate, planetype, seatsmax, seatsocc
WHERE carrid = @l_carrid AND connid = @l_connid AND fldate = @l_fldate
INTO @g_flight.

cl_s4d_output=>display_structure( iv_structure = g_flight ).
