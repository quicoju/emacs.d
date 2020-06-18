;; Package manager settings
(require 'package)
(add-to-list
 'package-archives
 '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; visual preferences
(menu-bar-mode -1)
(display-time-mode)
(display-battery-mode 1)
(blink-cursor-mode -1)
(setq visible-bell t)

(when (display-graphic-p)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

(unless (display-graphic-p)
  (setq display-time-day-and-date t))

;; font
(add-to-list
 'default-frame-alist
 '(font . "DejaVu Sans Mono-8"))

;; Set autosaves folder
(setq temporary-file-directory
      (file-name-as-directory
       (concat (getenv "HOME") "/tmp/emacs_autosaves")))
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))

(desktop-save-mode 1)
(server-start)

;; core packages
;; =============
(add-hook 'org-mode-hook
      (lambda ()
        (progn (org-bullets-mode 't))))

(setq ediff-window-setup-function 'ediff-setup-windows-plain) ; for i3
(setq ediff-split-window-function 'split-window-horizontally)

;; non-core packages
;; =================
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package winring
  :ensure t
  :config (winring-initialize))

(use-package doom-themes
  :if window-system
  :ensure t
  :config (setq doom-themes-enable-bold t
                doom-themes-enable-italic t)
          (load-theme 'doom-one t))

(use-package doom-modeline
  :requires (doom-themes)
  :config (doom-modeline-mode 1)
  :ensure t)

;; helm utilities
;; ==============
(use-package helm
  :ensure t
  :config (helm-mode 1)
  :bind (([remap execute-extended-command] . 'helm-M-x)
         ([remap apropos-command] . 'helm-apropos)
         ([remap dabbrev-expand]  . 'helm-dabbrev)
         ([remap list-buffers]    . 'helm-buffers-list)
         ([remap find-file]       . 'helm-find-files)
         ([remap yank-pop]        . 'helm-show-kill-ring)
         ([remap occur]           . 'helm-occur)))

;; local definition files
;; ======================
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
    (win-switch fill-column-indicator winring doom-themes doom-modeline rust-mode rust-playground helm use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
