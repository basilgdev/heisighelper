function copyRowToClipboard(button) {
    var rowData = $(button).closest('tr').find('td:not(:last-child)').map(function () {
        return $(this).text().trim();
    }).get().join(' | ');

    var tempElement = $('<textarea>');
    $('body').append(tempElement);
    tempElement.val(rowData).select();
    document.execCommand('copy');
    tempElement.remove();

    alert('Row copied to clipboard!');
}