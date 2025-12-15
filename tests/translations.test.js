/**
 * Tests for translations.js
 * Ensures all English keys have Spanish equivalents and vice versa
 */

const fs = require("fs");
const path = require("path");

// Read translations.js and extract the translations object
const fileContent = fs.readFileSync(
  path.join(__dirname, "../www/translations.js"),
  "utf8"
);

// Find the translations object: starts with "const translations = {" and ends with "};"
// followed by blank lines before the next function
const match = fileContent.match(/const translations = (\{[\s\S]*?\n\});/);
if (!match) {
  throw new Error("Could not find translations object in translations.js");
}

// Evaluate the object literal to get the actual object
// This is safe because we control the source file
const translations = eval("(" + match[1] + ")");

describe("translations object", () => {
  test("translations object exists and has expected structure", () => {
    expect(translations).toBeDefined();
    expect(translations.ui).toBeDefined();
    expect(translations.categories).toBeDefined();
    expect(translations.checkboxes).toBeDefined();
  });

  test("has both English and Spanish for UI translations", () => {
    expect(translations.ui.en).toBeDefined();
    expect(translations.ui.es).toBeDefined();
  });

  test("has both English and Spanish for categories", () => {
    expect(translations.categories.en).toBeDefined();
    expect(translations.categories.es).toBeDefined();
  });

  test("has both English and Spanish for checkboxes", () => {
    expect(translations.checkboxes.en).toBeDefined();
    expect(translations.checkboxes.es).toBeDefined();
  });
});

describe("UI translations completeness", () => {
  const enKeys = Object.keys(translations.ui.en);
  const esKeys = Object.keys(translations.ui.es);

  test("English and Spanish have same number of UI keys", () => {
    expect(enKeys.length).toBe(esKeys.length);
  });

  test.each(enKeys)("Spanish has translation for UI key: %s", (key) => {
    expect(translations.ui.es[key]).toBeDefined();
    expect(translations.ui.es[key].length).toBeGreaterThan(0);
  });

  test.each(esKeys)("English has translation for UI key: %s", (key) => {
    expect(translations.ui.en[key]).toBeDefined();
    expect(translations.ui.en[key].length).toBeGreaterThan(0);
  });
});

describe("Category translations completeness", () => {
  const enKeys = Object.keys(translations.categories.en);
  const esKeys = Object.keys(translations.categories.es);

  test("English and Spanish have same number of category keys", () => {
    expect(enKeys.length).toBe(esKeys.length);
  });

  test.each(enKeys)("Spanish has translation for category: %s", (key) => {
    expect(translations.categories.es[key]).toBeDefined();
    expect(translations.categories.es[key].length).toBeGreaterThan(0);
  });
});

describe("Checkbox translations completeness", () => {
  const enKeys = Object.keys(translations.checkboxes.en);
  const esKeys = Object.keys(translations.checkboxes.es);

  test("English and Spanish have same number of checkbox keys", () => {
    expect(enKeys.length).toBe(esKeys.length);
  });

  test.each(enKeys)("Spanish has translation for checkbox: %s", (key) => {
    expect(translations.checkboxes.es[key]).toBeDefined();
    expect(translations.checkboxes.es[key].length).toBeGreaterThan(0);
  });

  // Check for orphaned Spanish keys (exist in ES but not EN)
  test.each(esKeys)("English has translation for checkbox: %s", (key) => {
    expect(translations.checkboxes.en[key]).toBeDefined();
  });
});

describe("No empty translations", () => {
  test("no empty English UI translations", () => {
    Object.entries(translations.ui.en).forEach(([key, value]) => {
      expect(value.trim().length).toBeGreaterThan(0);
    });
  });

  test("no empty Spanish UI translations", () => {
    Object.entries(translations.ui.es).forEach(([key, value]) => {
      expect(value.trim().length).toBeGreaterThan(0);
    });
  });
});
