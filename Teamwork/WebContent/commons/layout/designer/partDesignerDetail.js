function addDetailLine(href, tableId, detailName) {
  var table = $("#" + tableId);
  var id = new Number(table.attr('maxRow')) + 1;
  table.attr('maxRow', id);
  var newHref = href + '&detailName=' + detailName + '&rowLine=' + id;

  $.get(newHref, function (ret) {
    table.append(ret);
  });
}