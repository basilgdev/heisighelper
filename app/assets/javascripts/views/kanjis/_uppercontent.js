function validateForm() {
  var sentenceInput = $("#sentence_input");
  var sentenceValue = sentenceInput.val().trim();
  var kanjiRegex = /[\u4e00-\u9faf]/; // Match Kanji characters

  if (sentenceValue === "" || !kanjiRegex.test(sentenceValue)) {
    sentenceInput.addClass("is-invalid");
    setTimeout(() => {
      sentenceInput.removeClass("is-invalid");
    }, 1500);
    return false;
  }

  return true; 
}

