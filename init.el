;; Package manager settings
(setq package-archives
      '(("gnu"   . "http://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

;; Visual environment preferences
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(display-battery-mode 1)

(setq display-time-day-and-date t)
(display-time-mode)

(setq visible-bell t)
(desktop-save-mode 1)

;; Set preferred font
(add-to-list 'default-frame-alist
             '(font . "DejaVu Sans Mono-8"))

;; easy navigate windows
(setq winum-keymap
    (let ((map (make-sparse-keymap)))
      (define-key map (kbd "C-`") 'winum-select-window-by-number)
      (define-key map (kbd "M-0") 'winum-select-window-0-or-10)
      (define-key map (kbd "M-1") 'winum-select-window-1)
      (define-key map (kbd "M-2") 'winum-select-window-2)
      (define-key map (kbd "M-3") 'winum-select-window-3)
      (define-key map (kbd "M-4") 'winum-select-window-4)
      (define-key map (kbd "M-5") 'winum-select-window-5)
      (define-key map (kbd "M-6") 'winum-select-window-6)
      (define-key map (kbd "M-7") 'winum-select-window-7)
      (define-key map (kbd "M-8") 'winum-select-window-8)
      map))
(winum-mode)

;; Set autosaves folder
(setq temporary-file-directory
      (file-name-as-directory
       (concat (getenv "HOME") "/tmp/emacs_autosaves")))

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))

;; extend load-path
(add-to-list 'load-path
	     (concat user-emacs-directory "lisp"))

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
(use-package transpose-frame)
(global-set-key (kbd "C-c t") 'transpose-frame)

(use-package winring)
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
 '(cperl-continued-statement-offset tab-width)
 '(cperl-electric-parens t)
 '(cperl-indent-level tab-width)
 '(cperl-indent-parens-as-block t)
 '(package-selected-packages
   (quote
    (lsp-mode rustic rust-mode winum 0xc flymake-diagnostic-at-point magit-filenotify perlbrew htmlize web-beautify column-enforce-mode tt-mode pde tea-time transpose-frame org-pomodoro winring racket-mode pacmacs nodejs-repl multiple-cursors mingus cask auto-complete-auctex auctex-lua auctex-latexmk))))
