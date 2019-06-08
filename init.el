;; Package manager settings
(setq package-archives
      '(("gnu"   . "http://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

;; Set preferred theme
(add-to-list 'default-frame-alist
             '(font . "DejaVu Sans Mono-8"))
(winum-mode)
(setq custom-safe-themes t)
(load-theme 'spacemacs-dark) ; 'atom-dark
(spaceline-spacemacs-theme)

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
(setq display-time-day-and-date t)
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
(load "programming.el")
(load "web.el")

;; Automatic stuff
;; ===============
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cperl-electric-parens t)
 '(cperl-indent-level tab-width)
 '(cperl-indent-parens-as-block t)
 '(package-selected-packages
   (quote
    (htmlize spacemacs-theme web-beautify column-enforce-mode magit tt-mode pde tea-time transpose-frame org-pomodoro winring use-package racket-mode pacmacs nodejs-repl multiple-cursors mingus evil cask auto-complete-auctex auctex-lua auctex-latexmk atom-dark-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
