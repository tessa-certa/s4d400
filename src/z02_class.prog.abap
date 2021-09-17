*&---------------------------------------------------------------------*
*& Report z02_class
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z02_class.

CLASS lcl_airplane DEFINITION.

  PUBLIC  SECTION.

    TYPES: BEGIN OF t_attribute,
             attribute TYPE string,
             value     TYPE string,
           END OF t_attribute.

    TYPES t_attributes
        TYPE STANDARD TABLE OF t_attribute
        WITH NON-UNIQUE KEY attribute.

    CLASS-METHODS get_n_o_airplanes
      EXPORTING
        e_number TYPE i.

    METHODS set_attributes
      IMPORTING
        i_name      TYPE string
        i_planetype TYPE saplane-planetype.

    METHODS get_attributes
      EXPORTING
        e_attributes TYPE t_attributes.

  PRIVATE SECTION.

    CLASS-DATA gv_n_o_airplanes TYPE i VALUE 0.

    DATA: m_name      TYPE string,
          m_planetype TYPE saplane-planetype.

ENDCLASS.

CLASS lcl_airplane IMPLEMENTATION.

  METHOD set_attributes.
    m_name = i_name.
    m_planetype = i_planetype.
    gv_n_o_airplanes = gv_n_o_airplanes + 1.
  ENDMETHOD.

  METHOD get_attributes.
    e_attributes = VALUE #( ( attribute = `name` value = m_name )
                            ( attribute = `planetype` value = m_planetype ) ).
  ENDMETHOD.

  METHOD get_n_o_airplanes.
    e_number = gv_n_o_airplanes.
  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.

  DATA g_airplane TYPE REF TO lcl_airplane.
  DATA g_airplanes TYPE TABLE OF REF TO lcl_airplane.



  DO 3 TIMES.
    g_airplane = NEW #( ).
    g_airplanes = VALUE #( BASE g_airplanes ( g_airplane ) ).
  ENDDO.

  g_airplanes[ 1 ]->set_attributes(
             EXPORTING
              i_name = `Plane1`
              i_planetype = `747-400` ).

  g_airplanes[ 2 ]->set_attributes(
             EXPORTING
              i_name = `Plane2`
              i_planetype = `747-400` ).



  g_airplanes[ 3 ]->set_attributes(
             EXPORTING
              i_name = `Plane3`
              i_planetype = `747-400` ).

  DATA: g_attributes TYPE lcl_airplane=>t_attributes,
        g_output     TYPE lcl_airplane=>t_attributes.

  LOOP AT g_airplanes INTO g_airplane.
    g_airplane->get_attributes(
      IMPORTING
        e_attributes = g_attributes
    ).
    g_output = CORRESPONDING #( BASE ( g_output ) g_attributes ).
  ENDLOOP.

  cl_s4d_output=>display_table( g_output ).
