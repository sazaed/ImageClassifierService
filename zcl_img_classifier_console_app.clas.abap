CLASS zcl_img_classifier_console_app DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_IMG_CLASSIFIER_CONSOLE_APP IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA(cf_service_mgr) = cl_cf_servicemanager=>get_instance( ).

    DATA(cf_service) = cf_service_mgr->get_service(
        service_name            = 'Image Classifier Service'
        use_default_service_key = abap_true
    ).

    DATA(cf_img_classifier) = NEW zcl_img_classifier_service( cf_service ).

    cf_img_classifier->add_image_by_uri( 'https://localhost/sap/images/IPhoneX_2.JPG' ).
    cf_img_classifier->classify_image( exporting model_name = 'products-demo' model_version = 2 ).

    data(dummy) = cf_img_classifier->get_result_json( ).
    out->write( dummy ).

  ENDMETHOD.
ENDCLASS.
