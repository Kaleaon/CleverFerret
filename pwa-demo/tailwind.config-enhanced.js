/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  darkMode: 'class',
  theme: {
    extend: {
      colors: {
        // Use CSS variables for dynamic theming
        primary: 'hsl(var(--color-primary) / <alpha-value>)',
        secondary: 'hsl(var(--color-secondary) / <alpha-value>)',
        background: 'hsl(var(--color-background) / <alpha-value>)',
        surface: 'hsl(var(--color-surface) / <alpha-value>)',
        'surface-variant': 'hsl(var(--color-surface-variant) / <alpha-value>)',
        'on-primary': 'hsl(var(--color-on-primary) / <alpha-value>)',
        'on-background': 'hsl(var(--color-on-background) / <alpha-value>)',
        'on-surface': 'hsl(var(--color-on-surface) / <alpha-value>)',
        'on-surface-variant': 'hsl(var(--color-on-surface-variant) / <alpha-value>)',
        
        // Semantic color aliases
        navy: 'hsl(var(--color-background) / <alpha-value>)',
        'light-navy': 'hsl(var(--color-surface) / <alpha-value>)',
        'lightest-navy': 'hsl(var(--color-surface-variant) / <alpha-value>)',
        gold: 'hsl(var(--color-primary) / <alpha-value>)',
        emerald: 'hsl(var(--color-secondary) / <alpha-value>)',
        'lightest-slate': 'hsl(var(--color-on-background) / <alpha-value>)',
        'light-slate': 'hsl(var(--color-on-surface) / <alpha-value>)',
        slate: 'hsl(var(--color-on-surface-variant) / <alpha-value>)',
      },
      fontFamily: {
        sans: ['Inter', 'ui-sans-serif', 'system-ui'],
        serif: ['ui-serif', 'Georgia'],
        mono: ['Fira Code', 'ui-monospace', 'SFMono-Regular'],
        display: ['Inter', 'ui-sans-serif', 'system-ui'],
      },
      fontSize: {
        'xs': ['0.75rem', { lineHeight: '1rem' }],
        'sm': ['0.875rem', { lineHeight: '1.25rem' }],
        'base': ['1rem', { lineHeight: '1.5rem' }],
        'lg': ['1.125rem', { lineHeight: '1.75rem' }],
        'xl': ['1.25rem', { lineHeight: '1.75rem' }],
        '2xl': ['1.5rem', { lineHeight: '2rem' }],
        '3xl': ['1.875rem', { lineHeight: '2.25rem' }],
        '4xl': ['2.25rem', { lineHeight: '2.5rem' }],
        '5xl': ['3rem', { lineHeight: '1' }],
        '6xl': ['3.75rem', { lineHeight: '1' }],
      },
      spacing: {
        '18': '4.5rem',
        '88': '22rem',
        '128': '32rem',
      },
      borderRadius: {
        'xl': '1rem',
        '2xl': '1.5rem',
        '3xl': '2rem',
      },
      boxShadow: {
        'glow': '0 0 20px hsl(var(--color-primary) / 0.3)',
        'glow-secondary': '0 0 20px hsl(var(--color-secondary) / 0.3)',
        'inner-glow': 'inset 0 0 20px hsl(var(--color-primary) / 0.1)',
      },
      animation: {
        'fade-in': 'fadeIn 0.3s ease-out',
        'slide-in': 'slideIn 0.3s ease-out',
        'bounce-subtle': 'bounce 1s infinite',
        'pulse-slow': 'pulse 3s cubic-bezier(0.4, 0, 0.6, 1) infinite',
      },
      keyframes: {
        fadeIn: {
          '0%': { opacity: '0', transform: 'translateY(10px)' },
          '100%': { opacity: '1', transform: 'translateY(0)' },
        },
        slideIn: {
          '0%': { transform: 'translateX(-100%)' },
          '100%': { transform: 'translateX(0)' },
        },
      },
      backdropBlur: {
        xs: '2px',
      },
      zIndex: {
        '100': '100',
        '1000': '1000',
        '1050': '1050',
        '1100': '1100',
        '1200': '1200',
      },
      transitionDuration: {
        '400': '400ms',
        '600': '600ms',
      },
      transitionTimingFunction: {
        'bounce': 'cubic-bezier(0.68, -0.55, 0.265, 1.55)',
        'ease-in-out-back': 'cubic-bezier(0.68, -0.55, 0.265, 1.55)',
      },
      backgroundImage: {
        'gradient-primary': 'linear-gradient(135deg, hsl(var(--color-primary)), hsl(var(--color-secondary)))',
        'gradient-surface': 'linear-gradient(135deg, hsl(var(--color-surface)), hsl(var(--color-surface-variant)))',
        'gradient-radial': 'radial-gradient(ellipse at center, var(--tw-gradient-stops))',
        'gradient-conic': 'conic-gradient(from 180deg at 50% 50%, var(--tw-gradient-stops))',
      },
      screens: {
        'xs': '475px',
        '3xl': '1920px',
      },
      aspectRatio: {
        'book': '2/3',
        'movie': '16/9',
        'square': '1/1',
      },
      gridTemplateColumns: {
        'auto-fill-200': 'repeat(auto-fill, minmax(200px, 1fr))',
        'auto-fill-250': 'repeat(auto-fill, minmax(250px, 1fr))',
        'auto-fill-300': 'repeat(auto-fill, minmax(300px, 1fr))',
      },
      flexGrow: {
        '2': '2',
        '3': '3',
      },
      maxWidth: {
        '8xl': '88rem',
        '9xl': '96rem',
      },
    },
  },
  plugins: [
    // Custom plugin for component utilities
    function({ addComponents, theme }) {
      addComponents({
        '.btn': {
          padding: theme('spacing.3') + ' ' + theme('spacing.6'),
          borderRadius: theme('borderRadius.md'),
          fontWeight: theme('fontWeight.semibold'),
          transition: 'all ' + theme('transitionDuration.200'),
          cursor: 'pointer',
          display: 'inline-flex',
          alignItems: 'center',
          justifyContent: 'center',
          gap: theme('spacing.2'),
          border: 'none',
          textDecoration: 'none',
          '&:focus': {
            outline: '2px solid hsl(var(--color-primary))',
            outlineOffset: '2px',
          },
        },
        '.btn-primary': {
          backgroundColor: 'hsl(var(--color-primary))',
          color: 'hsl(var(--color-on-primary))',
          '&:hover': {
            backgroundColor: 'hsl(var(--color-primary) / 0.9)',
            boxShadow: '0 0 20px hsl(var(--color-primary) / 0.3)',
            transform: 'translateY(-1px)',
          },
          '&:active': {
            transform: 'translateY(0)',
          },
        },
        '.btn-secondary': {
          backgroundColor: 'hsl(var(--color-secondary))',
          color: 'hsl(var(--color-on-primary))',
          '&:hover': {
            backgroundColor: 'hsl(var(--color-secondary) / 0.9)',
            boxShadow: '0 0 20px hsl(var(--color-secondary) / 0.3)',
            transform: 'translateY(-1px)',
          },
        },
        '.btn-ghost': {
          backgroundColor: 'transparent',
          color: 'hsl(var(--color-on-surface))',
          border: '1px solid hsl(var(--color-surface-variant))',
          '&:hover': {
            backgroundColor: 'hsl(var(--color-surface-variant))',
            color: 'hsl(var(--color-on-background))',
          },
        },
        '.card': {
          backgroundColor: 'hsl(var(--color-surface))',
          borderRadius: theme('borderRadius.lg'),
          padding: theme('spacing.6'),
          boxShadow: theme('boxShadow.DEFAULT'),
          border: '1px solid hsl(var(--color-surface-variant) / 0.2)',
          transition: 'all ' + theme('transitionDuration.300'),
          '&:hover': {
            boxShadow: theme('boxShadow.lg'),
            transform: 'translateY(-2px)',
          },
        },
        '.card-interactive': {
          cursor: 'pointer',
          '&:hover': {
            boxShadow: theme('boxShadow.xl'),
            transform: 'translateY(-4px)',
          },
        },
        '.input': {
          backgroundColor: 'hsl(var(--color-surface))',
          border: '1px solid hsl(var(--color-surface-variant))',
          color: 'hsl(var(--color-on-surface))',
          padding: theme('spacing.3') + ' ' + theme('spacing.4'),
          borderRadius: theme('borderRadius.md'),
          transition: 'all ' + theme('transitionDuration.150'),
          width: '100%',
          '&:focus': {
            borderColor: 'hsl(var(--color-primary))',
            boxShadow: '0 0 0 3px hsl(var(--color-primary) / 0.1)',
            outline: 'none',
          },
          '&::placeholder': {
            color: 'hsl(var(--color-on-surface-variant))',
          },
        },
        '.media-controls': {
          backgroundColor: 'hsl(var(--color-surface) / 0.9)',
          backdropFilter: 'blur(10px)',
          borderRadius: theme('borderRadius.xl'),
          padding: theme('spacing.4'),
          position: 'fixed',
          bottom: theme('spacing.5'),
          left: '50%',
          transform: 'translateX(-50%)',
          zIndex: theme('zIndex.1050'),
          border: '1px solid hsl(var(--color-surface-variant))',
          boxShadow: theme('boxShadow.2xl'),
        },
        '.drop-zone': {
          border: '2px dashed hsl(var(--color-surface-variant))',
          borderRadius: theme('borderRadius.lg'),
          padding: theme('spacing.8'),
          textAlign: 'center',
          transition: 'all ' + theme('transitionDuration.300'),
          backgroundColor: 'hsl(var(--color-surface) / 0.5)',
          '&.drag-over': {
            borderColor: 'hsl(var(--color-primary))',
            backgroundColor: 'hsl(var(--color-primary) / 0.1)',
            transform: 'scale(1.02)',
          },
          '&:hover': {
            borderColor: 'hsl(var(--color-secondary))',
            backgroundColor: 'hsl(var(--color-secondary) / 0.05)',
          },
        },
      })
    },
    
    // Custom plugin for utilities
    function({ addUtilities, theme }) {
      addUtilities({
        '.text-gradient': {
          backgroundImage: 'linear-gradient(135deg, hsl(var(--color-primary)), hsl(var(--color-secondary)))',
          backgroundClip: 'text',
          '-webkit-background-clip': 'text',
          color: 'transparent',
        },
        '.hover-lift': {
          transition: `transform ${theme('transitionDuration.300')}, box-shadow ${theme('transitionDuration.300')}`,
          '&:hover': {
            transform: 'translateY(-2px)',
            boxShadow: theme('boxShadow.lg'),
          },
        },
        '.hover-glow': {
          transition: `box-shadow ${theme('transitionDuration.300')}`,
          '&:hover': {
            boxShadow: '0 0 20px hsl(var(--color-primary) / 0.3)',
          },
        },
        '.hover-scale': {
          transition: `transform ${theme('transitionDuration.300')}`,
          '&:hover': {
            transform: 'scale(1.02)',
          },
        },
        '.glass': {
          backgroundColor: 'hsl(var(--color-surface) / 0.8)',
          backdropFilter: 'blur(10px)',
          border: '1px solid hsl(var(--color-surface-variant) / 0.2)',
        },
        '.scrollbar-hide': {
          '-ms-overflow-style': 'none',
          'scrollbar-width': 'none',
          '&::-webkit-scrollbar': {
            display: 'none',
          },
        },
        '.scrollbar-thin': {
          '&::-webkit-scrollbar': {
            width: '8px',
            height: '8px',
          },
          '&::-webkit-scrollbar-track': {
            backgroundColor: 'hsl(var(--color-surface))',
          },
          '&::-webkit-scrollbar-thumb': {
            backgroundColor: 'hsl(var(--color-surface-variant))',
            borderRadius: theme('borderRadius.full'),
          },
          '&::-webkit-scrollbar-thumb:hover': {
            backgroundColor: 'hsl(var(--color-on-surface-variant))',
          },
        },
      })
    }
  ],
}