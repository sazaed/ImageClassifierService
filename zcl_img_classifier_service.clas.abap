CLASS zcl_img_classifier_service DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS
      constructor
        IMPORTING
          service TYPE REF TO if_cf_service.

    METHODS add_image_by_uri IMPORTING image_uri TYPE string.
    METHODS classify_image IMPORTING model_name TYPE string model_version TYPE i RETURNING VALUE(return_code) TYPE string.
    METHODS get_result_json RETURNING VALUE(json) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA:
      go_cf_service      TYPE REF TO if_cf_service,
      go_cf_srv_response TYPE REF TO cl_cf_srv_response.

ENDCLASS.



CLASS zcl_img_classifier_service IMPLEMENTATION.


  METHOD constructor.
    me->go_cf_service = service.
  ENDMETHOD.



  METHOD add_image_by_uri.
    "Implement...
  ENDMETHOD.

  METHOD classify_image.
    "ToDo write body.
    me->go_cf_srv_response = me->go_cf_service->post( 'body' ).
  ENDMETHOD.

  METHOD get_result_json.
    json = me->go_cf_srv_response->get_body( ).
  ENDMETHOD.

ENDCLASS.
