; make file
core = 7.x
api = 2

; ************
; * INCLUDES *
; ************

includes[adapt_media] = modules/adapt_media/adapt_media.make
includes[adapt_slider] = modules/adapt_slider/adapt_slider.make
includes[adapt_wysiwyg] = modules/adapt_wysiwyg/adapt_wysiwyg.make

; ***********
; * MODULES *
; ***********

; address field
projects[addressfield][subdir] = 'contrib'
projects[addressfield][version] = '1.0-beta5'

; admin menu
projects[admin_menu][subdir] = 'contrib'
projects[admin_menu][version] = '3.0-rc4'
projects[admin_menu][patch][1997386] = http://drupal.org/files/admin_menu-1997386.patch

; adminimal administration menu
projects[adminimal_admin_menu][subdir] = 'contrib'
projects[adminimal_admin_menu][version] = '1.5'

; admin views
projects[admin_views][subdir] = 'contrib'
projects[admin_views][version] = '1.2'

; background process
projects[background_process][subdir] = 'contrib'
projects[background_process][version] = '1.16'

; coder
projects[coder][subdir] = 'contrib'
projects[coder][version] = '2.1'

; client-side adaptive image
projects[cs_adaptive_image][subdir] = 'contrib'
projects[cs_adaptive_image][version] = '1.0'

; ctools
projects[ctools][subdir] = 'contrib'
projects[ctools][version] = '1.4'
projects[ctools][patch][n2195211n2195471] = 'http://www.drupal.org/files/issues/ctools-combined_patch_from_n2195211-15_and_n2195471-29--n2195471-47.patch'

; default config
projects[defaultconfig][subdir] = 'contrib'
projects[defaultconfig][version] = '1.x-dev'
projects[defaultconfig][download][type] = 'git'
projects[defaultconfig][download][url] = 'http://git.drupal.org/project/defaultconfig.git'
projects[defaultconfig][download][branch] = '7.x-1.x'
projects[defaultconfig][download][revision] = 'a62d2161bd21757c288b5ceacecd347db7f95619'

; deploy
projects[deploy][subdir] = 'contrib'
projects[deploy][version] = '2.x-dev'
projects[deploy][download][type] = 'git'
projects[deploy][download][url] = 'http://git.drupal.org/project/deploy.git'
projects[deploy][download][branch] = '7.x-2.x'
projects[deploy][download][revision] = '3ecb6b510fa689cc9481610f084178c4c8e98793'
projects[deploy][patch][2196109] = 'http://drupal.org/files/issues/deploy-views_missing_revision_id-2196109-8.patch'

; devel
projects[devel][subdir] = 'contrib'
projects[devel][version] = '1.5'

; entity
projects[entity][subdir] = contrib
projects[entity][version] = 1.5

; entityreference
projects[entityreference][subdir] = 'contrib'
projects[entityreference][version] = '1.1'

; entity dependency
projects[entity_dependency][subdir] = 'contrib'
projects[entity_dependency][version] = '1.x-dev'
projects[entity_dependency][download][type] = 'git'
projects[entity_dependency][download][url] = 'http://git.drupal.org/project/entity_dependency.git'
projects[entity_dependency][download][branch] = '7.x-1.x'
projects[entity_dependency][download][revision] = 'f20eb2945f880736b00c82d8a2b70fe29ef3c93d'

; entity view mode
projects[entity_view_mode][subdir] = contrib
projects[entity_view_mode][version] = '1.0-rc1'

; environment
; @todo should lock this module to a specific (re)version
projects[environment][subdir] = contrib

; features
projects[features][subdir] = 'contrib'
projects[features][version] = '2.2'

; diff
projects[diff][subdir] = contrib
projects[diff][version] = 3.2

; field group
projects[field_group][subdir] = 'contrib'
projects[field_group][version] = '1.4'

; field wrappers
projects[field_wrappers][subdir] = 'contrib'
projects[field_wrappers][version] = '1.0'

; fieldable panels panes
projects[fieldable_panels_panes][subdir] = 'contrib'
projects[fieldable_panels_panes][version] = '1.5'

; google analytics
projects[google_analytics][subdir] = 'contrib'
projects[google_analytics][version] = '1.4'

; google tag
projects[google_tag][subdir] = contrib
projects[google_tag][version] = 1.0

; jquery update
projects[jquery_update][subdir] = contrib
projects[jquery_update][version] = 2.4

; libraries
projects[libraries][subdir] = 'contrib'
projects[libraries][version] = '2.2'

; link
projects[link][subdir] = 'contrib'
projects[link][version] = '1.2'

; linkit
projects[linkit][subdir] = 'contrib'
projects[linkit][version] = '3.2'

; menu block
projects[menu_block][subdir] = 'contrib'
projects[menu_block][version] = '2.4'

; panels
projects[panels][subdir] = 'contrib'
projects[panels][version] = '3.4'

; panels everywhere
projects[panels_everywhere][subdir] = 'contrib'
projects[panels_everywhere][version] = '1.0-rc1'

; panelizer
projects[panelizer][subdir] = 'contrib'
projects[panelizer][version] = '3.1'

; page manager existing pages
projects[pm_existing_pages][subdir] = 'contrib'
projects[pm_existing_pages][version] = '1.4'

; pathauto
projects[pathauto][subdir] = 'contrib'
projects[pathauto][version] = '1.2'

; progress
projects[progress][subdir] = 'contrib'
projects[progress][version] = '1.4'

; rules
projects[rules][subdir] = 'contrib'
projects[rules][version] = '2.7'

; smart trim
projects[smart_trim][subdir] = 'contrib'
projects[smart_trim][version] = '1.4'

; smtp
projects[smtp][subdir] = 'contrib'
projects[smtp][download][branch] = '7.x-1.x'
projects[smtp][download][type] = 'git'
projects[smtp][download][url] = 'http://git.drupal.org/project/smtp.git'
projects[smtp][download][revision] = 'd4493ff4fb116f5933e45111b510e4b1c3bdf727'

; stage file proxy
projects[stage_file_proxy][subdir] = 'contrib'
projects[stage_file_proxy][version] = '1.4'

; strongarm
projects[strongarm][subdir] = 'contrib'
projects[strongarm][version] = '2.0'

; title
projects[title][subdir] = 'contrib'
projects[title][version] = '1.0-alpha7'

; token
projects[token][subdir] = 'contrib'
projects[token][version] = '1.5'

; transliteration
projects[transliteration][subdir] = 'contrib'
projects[transliteration][version] = '3.2'

; uuid
projects[uuid][subdir] = 'contrib'
projects[uuid][version] = '1.x-dev'
projects[uuid][download][type] = 'git'
projects[uuid][download][url] = 'http://git.drupal.org/project/uuid.git'
projects[uuid][download][branch] = '7.x-1.x'
projects[uuid][download][revision] = '45d745c48a20f6a3cfc12f3a634b81f21a519a0a'

; ultimate cron
projects[ultimate_cron][subdir] = 'contrib'
projects[ultimate_cron][version] = '1.10'

; variable
projects[variable][subdir] = 'contrib'
projects[variable][version] = '2.5'

; views
projects[views][subdir] = 'contrib'
projects[views][version] = '3.8'

; views bulk operations
projects[views_bulk_operations][subdir] = 'contrib'
projects[views_bulk_operations][version] = '3.2'

; xmlsitemap
projects[xmlsitemap][subdir] = 'contrib'
projects[xmlsitemap][version] = '2.0'

; **********
; * THEMES *
; **********

; adminimal
projects[adminimal_theme][type] = 'theme'
projects[adminimal_theme][subdir] = 'contrib'
projects[adminimal_theme][version] = '1.18'

; ****************
; * TRANSLATIONS *
; ****************
translations[] = da

; Include makefile from profile to allow overriding the adapt core makefile
; includes[adapt_core_override] = "../../../adapt_core_override.make"
