function validateForm() {
    var sentenceInput = document.getElementById("sentence_input").value.trim();
    if (sentenceInput === "") {
      alert("Please enter a Japanese sentence or kanji");
      return false;
    }
    return true; 
  }