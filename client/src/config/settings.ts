/* This file contains the default settings. */

const isBrowserDefaultDark = () => window.matchMedia('(prefers-color-scheme: dark)').matches

const settings = {
  'saveInLocalStore': false,
  'inputModeEnabled': true,
  'abbreviationCharacter': '\\',
  'languages': ['lean4', 'lean'],
  'inputModeCustomTranslations': {},
  'eagerReplacementEnabled': true,
  'mobile': false, // value here irrelevant, will be overwritten with `width < 800` in Settings.tsx
  'wordWrap': true,
  'acceptSuggestionOnEnter': false,
  'theme': isBrowserDefaultDark() ? 'Default Dark+' : 'Default Light+',
}

export default settings
