(setq org-html-validation-link nil)

;; Set template for new post that expands with <P
(add-to-list
 'org-structure-template-alist
 `("P" ,(concat
         "#+TITLE: You ain't gonna need it\n"
         "#+DATE:\n"
         "#+SUBTITLE: ...for sure\n"
         "#+DESCRIPTION:\n"
         "#+KEYWORDS:\n\n"
         "#+OPTIONS: toc:nil num:nil ^:nil pri:t date:nil creator:t timestamp:nil\n"
         "#+OPTIONS: html-link-use-abs-url:nil html-postamble:auto\n"
         "#+OPTIONS: html-preamble:t html-scripts:t html-style:nil\n"
         "#+OPTIONS: html5-fancy:t tex:t\n\n"
         "#+HTML_HEAD: <link rel=\"stylesheet\" type=\"text/css\" href=\"css/my.css\"/>\n"
         "#+HTML_HEAD: <script type=\"text/javascript\" src=\"js/my.js\"></script>"
         "#+HTML_DOCTYPE: xhtml-strict\n"
         "#+HTML_CONTAINER: div\n"
         "#+HTML_LINK_HOME:\n"
         "#+HTML_LINK_UP:\n"
         "#+HTML_MATHJAX:\n"
         "#+HTML_HEAD_EXTRA:\n"
         "#+INFOJS_OPT:\n"
         "#+CREATOR: <a href=\"https://www.gnu.org/software/emacs/\">"
         "<img src=\"./img/emacs.png\" style=\"width:42px;height:42px;border:0;\"></a>"
         "<a href=\"https://orgmode.org\">"
         "<img src=\"./img/org-mode.png\" style=\"width:42px;height:42px;border:0;\"</a>\n"
         "#+LATEX_HEADER:\n")))
