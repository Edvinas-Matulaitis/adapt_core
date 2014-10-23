<?php

/**
 * Implements hook_ctools_plugin_api().
 */
function adapt_core_ctools_plugin_api($module = NULL, $api = NULL) {
  if ($module == "strongarm" && $api == "strongarm") {
    return array("version" => "1");
  }
}

/**
 * Implements hook_entity_info_alter().
 */
function adapt_core_entity_info_alter(&$entity_info) {
  // Add some extra FPP
  if (module_exists('fieldable_panels_panes')) {
    // Unset the default one as it doesn't make much sense. This does not break
    // existing panels of this type.
    if (isset($entity_info['fieldable_panels_pane']['bundles']['fieldable_panels_pane'])) {
      unset($entity_info['fieldable_panels_pane']['bundles']['fieldable_panels_pane']);
    }

    // Basic Text
    $entity_info['fieldable_panels_pane']['bundles']['text'] = array(
      'label' => t('Text'),
      'admin' => array(
        'path' => 'admin/structure/fieldable-panels-panes/manage/%fieldable_panels_panes_type',
        'bundle argument' => 4,
        'real path' => 'admin/structure/fieldable-panels-panes/manage/text',
        'access arguments' => array('administer fieldable panels panes'),
      ),
    );

    // Basic Image
    $entity_info['fieldable_panels_pane']['bundles']['image'] = array(
      'label' => t('Image'),
      'admin' => array(
        'path' => 'admin/structure/fieldable-panels-panes/manage/%fieldable_panels_panes_type',
        'bundle argument' => 4,
        'real path' => 'admin/structure/fieldable-panels-panes/manage/image',
        'access arguments' => array('administer fieldable panels panes'),
      ),
    );

    // Image & Text
    $entity_info['fieldable_panels_pane']['bundles']['image_text'] = array(
      'label' => t('Image and text'),
      'admin' => array(
        'path' => 'admin/structure/fieldable-panels-panes/manage/%fieldable_panels_panes_type',
        'bundle argument' => 4,
        'real path' => 'admin/structure/fieldable-panels-panes/manage/image-text',
        'access arguments' => array('administer fieldable panels panes'),
      ),
    );
  }
}

/**
 * Implements hook_field_wrapper_elements_alter().
 */
function adapt_core_field_wrapper_elements_alter(&$wrapper_elements) {
  // Add more wrapper options
  $wrapper_elements['ul'] = t('UL');
  $wrapper_elements['ol'] = t('OL');
  $wrapper_elements['li'] = t('LI');
  $wrapper_elements['dl'] = t('DL');
  $wrapper_elements['dt'] = t('DT');
  $wrapper_elements['dd'] = t('DD');
}

/**
 * Implement the "Content Settings" fieldset in a pre-render. This fixes issues with image caused by initially
 * doing this in a form_alter.
 *
 * @see http://drupal.org/node/1567704
 */
function adapt_core_fieldable_panel_pane_pre_render($element) {
  // Add a content settings fieldset.
  $element['content_settings'] = array(
    '#type' => 'fieldset',
    '#title' => t('Content Settings'),
    '#weight' => 1,
  );

  // Add any remaining fields to the content settings fieldset.
  foreach ($element as $key => $value) {
    if (substr($key, 0, 6) == 'field_' || $key == 'body') {
      $element['content_settings'][$key] = $value;
      unset($element[$key]);
    }
  }

  return $element;
}

/**
 * Implements hook_form_FORM_ID_alter().
 *
 * Heavily "borrowed" from panopoly_widgets module
 */
function adapt_core_form_fieldable_panels_panes_fieldable_panels_pane_content_type_edit_form_alter(&$form, &$form_state, $form_id) {
  // Add fields to the FPP object if we are adding a reusable object for the first time
  if ($form_state['entity']->reusable && $form_state['op'] == 'add' && $form_state['rebuild'] == FALSE) {
    $form = fieldable_panels_panes_entity_edit_form($form, $form_state);
  }

  // Add a custom pre-render method to deal with "Content Settings" fieldset.
  $form['#pre_render'][] = 'adapt_core_fieldable_panel_pane_pre_render';

  // Remove the revisioning information
  $form['revision']['revision']['#type'] = 'value';
  $form['revision']['log']['#access'] = FALSE;

  // Add a widget setting
  $form['widget_settings']['#type'] = 'fieldset';
  $form['widget_settings']['#title'] = t('General Settings');
  $form['title']['#attributes']['placeholder'] = $form['title']['#title'];
  unset($form['title']['#title']);
  $form['widget_settings']['title'] = $form['title'];
  unset($form['title']);

  // Move the link field into the general settings tab.
  $form['widget_settings']['link'] = $form['link'];
  unset($form['link']);
  // Improve the reusable interface
  $form['reusable']['#title'] = t('Reusable Settings');
  $form['reusable']['#type'] = 'fieldset';
  $form['reusable']['#process'] = array('ctools_dependent_process');
  $form['reusable']['#id'] = 'reusable-settings';
  $form['reusable']['category']['#value'] = $form['reusable']['category']['#default_value'];
  $form['reusable']['category']['#type'] = 'value';
  $form['reusable']['admin_description']['#access'] = FALSE;

  // Set the proper dependencies for the reusable markup
  $form['reusable']['warning']['#dependency'] = array('edit-reusable' => array(1));
  $form['reusable']['warning']['#prefix'] = '<div id="reusable-wrapper">';
  $form['reusable']['warning']['#suffix'] = '</div>';
  $form['reusable']['warning']['#type'] = 'item';

  // Update the text for the reusable markup
  $form['reusable']['warning']['#markup'] = '<div class="description">' . t('Note: This item is reusable! Any changes made will be applied globally.') . '</div>';
}

/**
 * Implements hook_form_FORM_ID_alter().
 *
 * Hide adapt_core specific features from the features interface
 * can be enabled by settings adapt_modify_core to TRUE.
 */
function adapt_core_form_features_admin_form_alter(&$form, &$form_state) {
  if (variable_get('adapt_modify_core', FALSE) == FALSE) {
    $form['adapt']['#access'] = FALSE;
  }
}

/**
 * Implements hook_form_FORM_ID_alter().
 *
 * Add a few improvements to the features interface
 */
function adapt_core_form_features_export_form_alter(&$form, &$form_state) {
  // We want the Generate feature button to be easily accessible.
  $form['advanced']['#collapsed'] = FALSE;

  // Lets do a few tweaks if we are within a non standard install profile.
  $profile = variable_get('install_profile', 'standard');
  if (!in_array($profile, array('standard', 'minimal'))) {
    // Lets supply some good defaults for the developer.
    if ($form['info']['package']['#default_value'] == 'Features') {
      $form['info']['package']['#default_value'] = $profile;
    }

    if (empty($form['advanced']['generate_path']['#default_value'])) {
      $form['advanced']['generate_path']['#default_value'] = "profiles/{$profile}/modules/custom";
    }
  }
}

/**
 * Implements hook_system_info_alter().
 *
 * Hide features that are just examples from random modules.
 */
function adapt_core_system_info_alter(&$info, $file, $type) {
  $ignored_modules = array(
    'flexslider_example',
    'deploy_example',
    'uuid_services_example',
  );

  if ($type == 'module' && in_array($file->name, $ignored_modules)) {
    $info['hidden'] = TRUE;
  }
}
