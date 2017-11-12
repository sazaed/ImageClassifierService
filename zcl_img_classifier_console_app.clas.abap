CLASS zcl_img_classifier_console_app DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_img_classifier_console_app IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA(cf_service_mgr) = cl_cf_servicemanager=>get_instance( ).

    DATA(cf_service) = cf_service_mgr->get_service(
        service_name            = 'Image Classifier Service'
        use_default_service_key = abap_true
    ).

    DATA(cf_img_classifier) = NEW zcl_img_classifier_service( cf_service ).

    cf_img_classifier->add_image_by_uri( EXPORTING
        image_uri = '/sap/public/bc/images/sap_logo2.jpg'
        name      = 'file'
    ).

    cf_img_classifier->classify_image( EXPORTING
        model_name = 'brands-model'
        model_version = 1
    ).

    out->write( cf_img_classifier->get_prediction_json( ) ).

  ENDMETHOD.
ENDCLASS.
