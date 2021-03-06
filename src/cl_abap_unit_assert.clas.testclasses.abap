CLASS ltcl_test DEFINITION FOR TESTING RISK LEVEL HARMLESS DURATION SHORT FINAL.

  PRIVATE SECTION.
    METHODS initial FOR TESTING.
    METHODS initial_ref FOR TESTING.
    METHODS equals FOR TESTING.
    METHODS equals_table FOR TESTING.
    METHODS differs FOR TESTING.

ENDCLASS.

CLASS ltcl_test IMPLEMENTATION.

  METHOD initial.

    DATA foo TYPE string.
    cl_abap_unit_assert=>assert_initial( foo ).
    foo = 'abc'.
    cl_abap_unit_assert=>assert_not_initial( foo ).

  ENDMETHOD.

  METHOD initial_ref.

    DATA zip TYPE REF TO cl_abap_zip.
    cl_abap_unit_assert=>assert_initial( zip ).
    CREATE OBJECT zip.
    cl_abap_unit_assert=>assert_not_initial( zip ).

  ENDMETHOD.

  METHOD equals.
    DATA bar TYPE i.
    cl_abap_unit_assert=>assert_equals( act = bar exp = bar ).
    bar = 2.
    cl_abap_unit_assert=>assert_equals( act = bar exp = bar ).

    cl_abap_unit_assert=>assert_equals( act = 2 exp = 2 ).
    cl_abap_unit_assert=>assert_equals( act = 'hello' exp = 'hello' ).
  ENDMETHOD.

  METHOD equals_table.
    DATA lt_tab1 TYPE string_table.
    DATA lt_tab2 TYPE string_table.
    APPEND 'foo' TO lt_tab1.
    APPEND 'foo' TO lt_tab2.
    cl_abap_unit_assert=>assert_equals( act = lt_tab1 exp = lt_tab2 ).
  ENDMETHOD.

  METHOD differs.
    cl_abap_unit_assert=>assert_differs( act = 1 exp = 2 ).
  ENDMETHOD.

ENDCLASS.