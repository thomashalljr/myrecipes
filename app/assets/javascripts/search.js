"use strict";

document.addEventListener("turbolinks:load", function() {
  var options = {}, url;
  var input = $("[data-behavior='autocomplete']");

  Object.defineProperty(options, "maxNumberOfCategoryElements", {
    value: 5,
    enumerable: true
  });

  options = {
    getValue: "name",
    url: function(phrase) {
      return "/search.json?q=" + phrase;
    },
    categories: [
      {
        listLocation: "recipes",
        header: "<strong>Recipes</strong>",
        maxNumberOfElements: options.maxNumberOfCategoryElements
      },
      {
        listLocation: "ingredients",
        header: "<strong>Ingredients</strong>",
        maxNumberOfElements: options.maxNumberOfCategoryElements
      }
    ],
    list: {
      onChooseEvent: function() {
        url = input.getSelectedItemData().url;
        input.val("");
        Turbolinks.visit(url);
      }
    }
  }

  input.easyAutocomplete(options);
});
