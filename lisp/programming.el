;; 2018-08-21 -  Miscellaneous setting for programming
;;

;; General
;; =======
(add-hook 'prog-mode-hook
	  (lambda ()
	    (progn (flyspell-prog-mode)
               (setq-default indent-tabs-mode nil)
               (setq-default tab-width 4)
               (linum-mode)
               (column-number-mode)
               (hl-line-mode)
               (column-enforce-mode))))

;; Perl
;; ====
(defalias 'perl-mode 'cperl-mode)
(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.t\\'" . cperl-mode))
(add-hook 'cperl-mode-hook
	  (lambda ()
	    (progn (flymake-mode)
               (local-set-key
                (kbd "C-c C-h ?") 'flymake-popup-current-error-menu)
               (custom-set-variables
                '(cperl-indent-parens-as-block t)
                '(cperl-electric-parens t)
                '(cperl-continued-statement-offset tab-width)
                '(cperl-indent-level tab-width)))))

;; Racket
;; ======
(defun racket-send-buffer ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (set-mark-command nil)
    (goto-char (point-max))
    (racket-send-region (region-beginning) (region-end))))

(add-hook 'racket-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c C-b") 'racket-send-buffer)))
