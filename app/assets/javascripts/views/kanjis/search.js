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
    }).get().join(' | '); 
    
    allRowsContent += rowData + '\n'; 
  });

  var tempElement = $('<textarea>');
  $('body').append(tempElement);
  tempElement.val(allRowsContent).select();
  document.execCommand('copy');
  tempElement.remove();

  const copyToast = $('#copyToast');
  bootstrap.Toast.getOrCreateInstance(copyToast).show();
});