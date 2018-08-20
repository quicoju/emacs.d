;; References
;; ==========
;; Main -> https://emacs.cafe/emacs/orgmode/gtd/2017/06/30/orgmode-gtd.html
;; Capture Dates -> http://orgmode.org/manual/The-date_002ftime-prompt.html
;;
;; files
;; =====
;; inbox.org   -> collect all the input
;; gtd.org     -> projects file
;; tickler.org -> entries that need a timestamp to get reminded
;; someday.org -> inactive tasks needed to do at some time
;;
;; shortcuts
;; =========
;; C-c c  -> org-capture
;; C-c w  -> org-refile
;; C-c s  -> org-schedule
;; C-c d  -> org-deadline
;;
;; Contexts
;; =========
;; Used to filter next actions based on current location, 
;; recommended contexts:
;; @home, @office, @traveling, @phone, @email, @errands
;;
;; Key bindings
;; ============
(add-hook 'org-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c a") 'org-agenda)
	    (local-set-key (kbd "C-c c") 'org-capture)))

;; Configuration
;; ============
(setq org-agenda-files 
      '("~/.gtd/inbox.org"
	"~/.gtd/gtd.org"
	"~/.gtd/tickler.org"))

(setq org-capture-templates
      '(("t" "Todo [inbox]" entry
	 (file+headline "~/.gtd/inbox.org" "Tasks")
	 "* TODO %i%?")
	("T" "Tickler" entry
	 (file+headline "~/.gtd/tickler.org" "Tickler")
	 "* %i%? \n %U")))

(setq org-refile-targets 
      '(("~/.gtd/gtd.org" :maxlevel . 3)
	("~/.gtd/someday.org" :level . 1)
	("~/.gtd/tickler.org" :maxlevel . 2)))

(setq org-todo-keywords
      '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))
