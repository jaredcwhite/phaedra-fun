import Swup from "swup"
import SwupBodyClassPlugin from "@swup/body-class-plugin"
import SwupScrollPlugin from '@swup/scroll-plugin'
import SwupFadeTheme from "@swup/fade-theme"
const swup = new Swup({
  plugins: [
    new SwupBodyClassPlugin(),
    new SwupScrollPlugin(),
    new SwupFadeTheme(),
  ]
})

import "../styles/index.scss"

console.info("Bridgetown is loaded!")
