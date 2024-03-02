fx_version 'cerulean'

game 'gta5'

author 'Caticus / Team 5M'

discord 'https://discord.gg/cVrXvgNNna'

client_scripts {
	'config.lua',
	'client.lua'
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'config.lua',
	'server.lua'
}



ui_page{
    'html/index.html'
}

files {
    'html/*.*',
    'html/**/*.*',
}
