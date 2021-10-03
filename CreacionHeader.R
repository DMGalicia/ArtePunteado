codejs <- readr::read_lines("js/codefolding.js")
collapsejs <- readr::read_lines("js/collapse.js")
transitionjs <- readr::read_lines("js/transition.js")

htmlhead <- 
  paste('
<script>',
        paste(transitionjs, collapse = "\n"),
        '</script>
<script>',
        paste(collapsejs, collapse = "\n"),
        '</script>
<script>',
        paste(codejs, collapse = "\n"),
        '</script>
<style type="text/css">
.code-folding-btn { margin-bottom: 4px; }
.row { display: flex; }
.collapse { display: none; }
.in { display:block }
</style>
<script>
$(document).ready(function () {
  window.initializeCodeFolding("show" === "show");
});
</script>
', sep = "\n")

readr::write_lines(htmlhead, path = "header.html")