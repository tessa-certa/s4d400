*&---------------------------------------------------------------------*
*& Report z02_structure
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z02_structure.
types: begin of ts_complete,
       carrid type Z02_connection-carrid,
       connid type Z02_connection-connid,
       cityfrom type Z02_connection-cityfrom,
       cityto type Z02_connection-cityto,
       fldate type d400_s_flight-fldate,
       planetype type d400_s_flight-planetype,
       seatsmax type d400_s_flight-seatsmax,
       seatsocc type d400_s_flight-seatsocc,
       END OF TS_COMPLETE.

data gs_conn type Z02_connection.


gs_conn = value #( carrid = 'LH'
                   connid = '0400'
                   Cityfrom = 'Frankfurt'
                   Cityto = 'New York' ).


data gs_flight type d400_s_flight.


cl_s4d400_flight_model=>get_next_flight(
  EXPORTING
    iv_carrid = gs_conn-carrid
    iv_connid = gs_conn-connid
  IMPORTING
    es_flight = gs_flight
).

data gs_complete type ts_complete.

gs_complete = CORRESPONDING #( Base ( gs_conn ) gs_flight ).

cl_s4d_output=>display_structure( gs_complete ).



*CATCH cx_s4d400_no_data.
*CATCH cx_s4d400_no_data.
