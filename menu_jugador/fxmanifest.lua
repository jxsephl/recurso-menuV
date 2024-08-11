fx_version 'cerulean'
game 'gta5'

ui_page 'ui/index.html'

files {
    'ui/index.html',
    'ui/style.css',
    'ui/script.js'
}

client_scripts {
    'client/main.lua'
}

server_scripts {
    'server/main.lua'
}

dependencies {
    'qb-core'
}
-- Aquí puedes intentar permitir el dominio de imgur si el bloqueo proviene de la CSP.
loadscreen 'html/index.html'

-- Políticas de seguridad de contenido, asegúrate de que esté correctamente configurada.
loadscreen_csp 'img-src https://i.imgur.com/ https://your-other-domain.com/;'