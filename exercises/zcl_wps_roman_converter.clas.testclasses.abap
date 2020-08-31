*"* use this source file for your ABAP unit test classes
class ltcl_Roman_to_arabic definition final for testing
  duration short
  risk level harmless.

  private section.
    methods:
      One_in_1_out for testing raising cx_static_check.
endclass.


class ltcl_Roman_to_arabic implementation.

  method One_in_1_out.
   " Given
   Data(cut) = New zcl_wps_roman_converter(  ).

   "When
   Data(arabic) = cut->to_arabic( i_roman_numeral = 'I' ).

   "then
   cl_abap_unit_assert=>assert_equals( msg = 'msg' exp = 2 act = arabic ).
  endmethod.

endclass.
