<?php
/**
 * @file
 * adapt_core.features.inc
 */

/**
 * Implements hook_ctools_plugin_api().
 */
function adapt_core_ctools_plugin_api($module = NULL, $api = NULL) {
  if ($module == "strongarm" && $api == "strongarm") {
    return array("version" => "1");
  }
}

/**
 * Implements hook_node_info().
 */
function adapt_core_node_info() {
  $items = array(
    'page' => array(
      'name' => t('Basic Page'),
      'base' => 'node_content',
      'description' => t('Add a new page.'),
      'has_title' => '1',
      'title_label' => t('Title'),
      'help' => '',
    ),
  );
  return $items;
}