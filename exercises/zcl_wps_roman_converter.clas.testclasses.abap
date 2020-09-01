*"* use this source file for your ABAP unit test classes
CLASS ltcl_Roman_to_arabic DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA: cut TYPE REF TO zcl_wps_roman_converter.
    METHODS:
      One_in_1_out FOR TESTING RAISING cx_static_check,
      two_in_2_out FOR TESTING RAISING cx_static_check,
      error_case for testing ,
      assert_error
      IMPORTING i_roman type string,
      setup.

ENDCLASS.


CLASS ltcl_Roman_to_arabic IMPLEMENTATION.

  METHOD One_in_1_out.
    "When
    DATA(arabic) = Cut->to_arabic( i_roman_numeral = 'I' ).

    "then
    cl_abap_unit_assert=>assert_equals( msg = 'msg' exp = 1 act = arabic ).
  ENDMETHOD.

  METHOD two_in_2_out.

    "When
    DATA(arabic) = cut->to_arabic( i_roman_numeral = 'II' ).

    "then
    cl_abap_unit_assert=>assert_equals( msg = 'msg' exp = 2 act = arabic ).
  ENDMETHOD.

  METHOD setup.
    " Given
    cut = NEW zcl_wps_roman_converter(  ).

  ENDMETHOD.

  METHOD assert_error.
    cl_abap_unit_assert=>assert_equals(  exp = zcl_wps_roman_converter=>error_value act = cut->to_arabic( i_roman ) ).
  ENDMETHOD.

  METHOD error_case.
    assert_error( i_roman = 'A' ).
    assert_error( i_roman = 'ABC' ).
    assert_error( i_roman = 'IIII' ).
    assert_error( i_roman = 'MCXXXXI' ).
    assert_error( i_roman = 'MIC'  ).
  ENDMETHOD.

ENDCLASS.
