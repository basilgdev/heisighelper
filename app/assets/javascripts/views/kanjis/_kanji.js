function copyRowToClipboard(button) {
    var rowData = $(button).closest('tr').find('td:not(:last-child)').map(() => {
        return $(this).text().trim();
    }).get().join(' | ');

    var tempElement = $('<textarea>');
    $('body').append(tempElement);
    tempElement.val(rowData).select();
    document.execCommand('copy');
    tempElement.remove();

    const copyToast = $('#copyToast');
    bootstrap.Toast.getOrCreateInstance(copyToast).show()
}