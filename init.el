;; Package manager settings
(setq package-archives
      '(("gnu"       . "http://elpa.gnu.org/packages/")
	("marmalade" . "http://marmalade-repo.org/packages/")
	("melpa"     . "https://melpa.org/packages/")))

(package-initialize)
(require 'use-package)

;; Set preferred theme
(setq custom-safe-themes t)
(load-theme 'atom-dark)
(add-to-list 'default-frame-alist
             '(font . "DejaVu Sans Mono-8"))

;; Set autosaves folder
(setq temporary-file-directory 
      (file-name-as-directory 
       (concat (getenv "HOME") "/tmp/emacs_autosaves")))
      
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))

;; extend load-path
(add-to-list 'load-path
	     (concat user-emacs-directory "lisp"))

;; Visual environment preferences
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(display-battery-mode 1)
(setq display-time-24hr-format t)
(display-time-mode)
(setq visible-bell t)
(desktop-save-mode 1)

(defalias 'list-buffers 'ibuffer)
(ido-mode 1)
(setq ido-separator "\n")
(setq ido-enable-flex-matching t)

;; use the default windmove bindings [ S-<arrow> ]
(windmove-default-keybindings)

;; base mode hooks
(add-hook 'text-mode-hook
	  (lambda ()
	    (flyspell-mode)))

;; Programming modes
(add-hook 'prog-mode-hook
	  (lambda ()
	    (progn (flyspell-prog-mode)
		   (linum-mode)
		   (column-number-mode))))

;; programming language mode setup
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
		    '(cperl-electric-parens t)))))

;;set default browser
(setq browse-url-browser-function 'browse-url-firefox)
(server-start)

;; Required packages
;; =================
(require 'transpose-frame)
(global-set-key (kbd "C-c t") 'transpose-frame)

(require 'winring)
(winring-initialize)

;; Some additional helpers
;; =======================
(load "gtd.el")
(load "publish.el")

;; Automatic stuff
;; ===============
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (tt-mode pde tea-time transpose-frame org-pomodoro winring
    use-package racket-mode pacmacs nodejs-repl multiple-cursors
    mingus evil cask auto-complete-auctex auctex-lua
    auctex-latexmk atom-dark-theme))))
(custom-set-faces)
