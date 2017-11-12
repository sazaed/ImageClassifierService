CLASS zcl_img_classifier_service DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS
      constructor
        IMPORTING
          service TYPE REF TO if_cf_service.

    METHODS add_image_by_uri
      IMPORTING
        image_uri TYPE string.

    METHODS classify_image
      IMPORTING
        model_name    TYPE string
        model_version TYPE i
      RETURNING
        VALUE(return_code) TYPE string.

    METHODS get_prediction_json
        RETURNING
            VALUE(json) TYPE string.

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
    me->go_cf_service->add_binary_by_uri(
      EXPORTING
        iv_uri  = image_uri
        iv_name = 'file'
    ).

  ENDMETHOD.

  METHOD classify_image.
    data lv_model_version type string.
    lv_model_version = model_version.

    me->go_cf_service->add_form_data( iv_name = 'model_name' iv_value = model_name ).
    me->go_cf_service->add_form_data( iv_name = 'model_version' iv_value = lv_model_version ).

    me->go_cf_srv_response = me->go_cf_service->post_multiform( ).
  ENDMETHOD.

  METHOD get_prediction_json.
    json = me->go_cf_srv_response->get_array( 'predictions' ).
  ENDMETHOD.

ENDCLASS.
