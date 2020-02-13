;; Package manager settings
(require 'package)

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)

;; Visual environment preferences
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

(setq display-time-day-and-date t)
(display-time-mode)
(display-battery-mode 1)
(blink-cursor-mode -1)

(use-package doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (load-theme 'doom-one t))
  
(require 'doom-modeline)
(doom-modeline-mode 1)

(setq visible-bell t)

;; Set preferred font
(add-to-list 'default-frame-alist
             '(font . "DejaVu Sans Mono-8"))

;; state environment
(require 'winring)
(winring-initialize)
(desktop-save-mode 1)
(server-start)

;; Set autosaves folder
(setq temporary-file-directory
      (file-name-as-directory
       (concat (getenv "HOME") "/tmp/emacs_autosaves")))

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))

;; usage candy
(require 'helm-config)
(helm-mode 1)
(define-key global-map [remap find-file] 'helm-find-files)
(define-key global-map [remap occur] 'helm-occur)
(define-key global-map [remap list-buffers] 'helm-buffers-list)
(define-key global-map [remap dabbrev-expand] 'helm-dabbrev)
(define-key global-map [remap execute-extended-command] 'helm-M-x)
(define-key global-map [remap apropos-command] 'helm-apropos)

;; Some additional helpers
;; =======================
;; extend load-path
(add-to-list 'load-path
	     (concat user-emacs-directory "lisp"))
(load "gtd.el")
(load "publish.el")
(load "programming.el")
(load "web.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (fill-column-indicator winring doom-themes doom-modeline rust-mode rust-playground helm use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
