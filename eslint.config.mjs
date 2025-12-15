import js from "@eslint/js";

export default [
  js.configs.recommended,
  {
    // Ignore node_modules
    ignores: ["node_modules/**"],
  },
  {
    // Base config for all JS files
    languageOptions: {
      ecmaVersion: 2022,
      sourceType: "script",
      globals: {
        // Browser globals
        window: "readonly",
        document: "readonly",
        console: "readonly",
        // jQuery
        $: "readonly",
        jQuery: "readonly",
        // Shiny framework
        Shiny: "readonly",
      },
    },
    rules: {
      "no-undef": "error",
      "semi": ["warn", "always"],
    },
  },
  {
    // checkbox_handlers.js - uses globals from translations.js
    files: ["www/checkbox_handlers.js"],
    languageOptions: {
      globals: {
        updateTranslations: "readonly",
      },
    },
    rules: {
      "no-unused-vars": [
        "error",
        {
          argsIgnorePattern: "^_",
          varsIgnorePattern: "^setLanguage$", // called from HTML onclick
        },
      ],
    },
  },
  {
    // translations.js - defines globals used by other files
    files: ["www/translations.js"],
    rules: {
      "no-unused-vars": [
        "error",
        {
          argsIgnorePattern: "^_",
          // These are intentionally global: called from other files or console
          varsIgnorePattern: "^(translations|updateTranslations|debugSelectors)$",
        },
      ],
    },
  },
];
