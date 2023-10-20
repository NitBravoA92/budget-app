const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Proxima Nova Condensed', ...defaultTheme.fontFamily.sans],
        pacific: ['Pacifico', 'cursive'],
      },
      colors: {
        'main': {
          400: '#3778c2',
          500: '#2364ae',
          700: '#195aa4',
          800: '#054690',
          900: '#00418b',
        },
        'secondary': '#5fb523',
        'text_color': '#434b54',
      },
      keyframes: {
        hideElement: {
          '0%': { display: 'block' },
          '100%': { display: 'none' },
        },
      },
      animation: {
        'fade-out': 'hideElement 0s ease-out 3s forwards',
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
