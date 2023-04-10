fx_version 'cerulean'
game 'gta5'

lua54 'yes'
use_experimental_fxv2_oal 'yes'

shared_script '@es_extended/imports.lua'

server_script 'server.lua'

client_script 'client.lua'

dependencies {
	'es_extended',
	'esx_menu_default'
}