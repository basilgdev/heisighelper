$(document).ready(function() {
    $('#kanji_form').submit(function() {
      var sentence = $('#sentence_input').val().trim();
      $('#sentence_input').val(sentence);
    });
  });

    $('#copy-all-link').click(function() {
      var allRowsContent = '';
      $('#kanjis tr').each(function(index) {
        var rowData = $(this).find('td:not(:last-child)').map(function() {
          return $(this).text().trim();
        }).get().join(' | '); // Joining each column content with '|'
        
        allRowsContent += rowData + '\n'; // Adding newline after each row content
      });

      var tempElement = $('<textarea>'); // Create a temporary textarea to copy content to clipboard
      $('body').append(tempElement);
      tempElement.val(allRowsContent).select();
      document.execCommand('copy');
      tempElement.remove();

      alert('All rows copied to clipboard!');
    });