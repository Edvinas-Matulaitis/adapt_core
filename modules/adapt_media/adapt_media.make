; make file
core = 7.x
api = 2

; ***********
; * MODULES *
; ***********

; file entity
projects[file_entity][type] = 'module'
projects[file_entity][subdir] = 'contrib'
projects[file_entity][download][branch] = '7.x-2.x'
projects[file_entity][download][type] = 'git'
projects[file_entity][download][url] = 'http://git.drupal.org/project/file_entity.git'
projects[file_entity][download][revision] = '08509fd227b5d7152884c1966f4ff1519523a4a6'

; imageapi optimize
; projects[imageapi_optimize][type] = 'module'
; projects[imageapi_optimize][subdir] = 'contrib'
; projects[imageapi_optimize][branch] = '7.x-1.x'
; projects[imageapi_optimize][revision] = '36f59d0d711524ef0ddadd2288b677dbbcbd0859'

; media
projects[media][type] = 'module'
projects[media][subdir] = 'contrib'
projects[media][download][branch] = '7.x-2.x'
projects[media][download][type] = 'git'
projects[media][download][url] = 'http://git.drupal.org/project/media.git'
projects[media][download][revision] = 'ecab531a2b217b8957d414edc22fe368d0d9a542'
; Fix for media browser overlay not getting the correct z-index value
; see https://www.drupal.org/node/2082045#comment-8972571 and the previous comment in that thread for more information
projects[media][patch][] = 'http://www.drupal.org/files/issues/media_browser_modal-2082045-17.patch'

; media youtube
projects[media_youtube][type] = 'module'
projects[media_youtube][subdir] = 'contrib'
projects[media_youtube][download][branch] = '7.x-3.x'
projects[media_youtube][download][type] = 'git'
projects[media_youtube][download][url] = 'http://git.drupal.org/project/media_youtube.git'
projects[media_youtube][download][revision] = '2ae8891894292502b9cae249018849bfbf98387d'
