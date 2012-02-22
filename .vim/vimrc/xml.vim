function FormatXml()
    :%! export XMLLINT_INDENT='    '; xmllint --format -
    :set filetype=xml
endfunction
nmap<leader>x :exec FormatXml()<cr>
