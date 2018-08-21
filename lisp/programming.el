;; 2018-08-21 -  Miscellaneous setting for programming
;;
(defun find-tag-no-prompt ()
  "Jump to the tag at point without prompting"
  (interactive)
  (find-tag (find-tag-default)))
(global-set-key (kbd "M-.") 'find-tag-no-prompt)
