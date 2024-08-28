let mix = require('laravel-mix');
let tailwindcss = require('tailwindcss');

mix.setPublicPath('web')
    .js('web/imageSwiper.js', 'web/js')
    .postCss('web/styles.css', 'web/css', [
        tailwindcss('./tailwind.config.js')
    ])
    .version()
    .sourceMaps();

