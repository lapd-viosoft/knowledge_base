- organizzarli directory o con tags
- hydra
- assicurarsi che tutti i cheatsheet in `wished_cheatsheets` siano stati fatti
- cheat of common lists with paths
- give a look at rtfm and btfm and oscp cheatsheet + cph-sec guide

funzione per visualizzarli:
gch() {
    find  ~/Notes/cheatsheets/ -name $1 -exec vimcat {} \;
}
