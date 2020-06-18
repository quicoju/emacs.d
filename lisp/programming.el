;; 2018-08-21 -  Miscellaneous setting for programming
;;
(use-package flymake-diagnostic-at-point
  :after flymake
  :config
  (add-hook 'flymake-mode-hook #'flymake-diagnostic-at-point-mode))

(use-package prog-mode
  :requires (flymake)
  :init (setq-default indent-tabs-mode nil)
        (setq-default tab-width 4)
        (setq-default fill-column 80)
        (linum-mode)
        (flymake-mode)
        (hl-line-mode)
        (column-number-mode))

;; Perl
;; ====
(use-package cperl-mode
  :ensure t
  :interpreter "perl"
  :mode (("\\.t\\'"  . 'cperl-mode)
         ("\\.pm\\'" . 'cperl-mode)
         ("\\.pl\\'" . 'cperl-mode))
  :bind (("C-c C-c" . 'compile))
  :init (defalias 'perl-mode 'cperl-mode)
        (setq cperl-indent-parens-as-block t)
        (setq cperl-electric-parens t)
        (setq cperl-continued-statement-offset tab-width)
        (setq cperl-indent-level tab-width))     
