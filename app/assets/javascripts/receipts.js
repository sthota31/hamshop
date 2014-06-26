var rowNum = 0;
function addRow(frm) {
  rowNum ++;
  var row = '<p id="rowNum'+rowNum+'">ProductID: <input type="text" name="name[]" value="'+frm.add_id.value+'"> Qty: <input type="text" name="qty[]" size="2" value="'+frm.add_qty.value+'"> <input type="button" value="Remove" onclick="removeRow('+rowNum+');"></p>';
  jQuery('#itemRows').append(row);
  frm.add_qty.value = '';
  frm.add_id.value = '';
}

function removeRow(rnum) {
  jQuery('#rowNum'+rnum).remove();
}