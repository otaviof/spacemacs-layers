;;
;; Layer: of-org
;;  File: packages.el
;;

(defconst of-org-packages '(org))

(defun of-org/post-init-org ()
  ;; using to find agenda files under org directory
  (load-library "find-lisp")

  (setq-default
   ;;; for better look on doom themes
   org-fontify-whole-heading-line t
   org-fontify-done-headline t
   org-fontify-quote-and-verse-blocks t
   ;;; org-mode settings
   org-agenda-restore-windows-after-quit t
   org-agenda-window-setup 'other-window
   org-footnote-auto-adjust t
   org-footnote-auto-label 'confirm
   org-hide-emphasis-markers t
   org-return-follows-link nil
   org-startup-align-all-tables t
   org-startup-indented t
   org-startup-with-inline-images t
   org-tags-column -80
   ;;; less noisy org mode (http://stackoverflow.com/questions/10969617)
   org-modules (quote (org-bbdb org-docview org-gnus org-info org-mhe ox-confluence))
   ;;; org files location and directories
   org-directory "~/org"
   org-default-notes-file "~/org/_notes.org"
   org-agenda-files (mapcar 'abbreviate-file-name
                            (split-string
                             (shell-command-to-string "find ~/org -name \"_*.org\"") "\n"))
   org-agenda-text-search-extra-files '(agenda-archives
                                        "~/org/_archives/agenda.org")
   ;;; org-capture, where to store each type of snippet
   org-capture-templates '(("t" "Tasks")
                           ("tg" "General"
                            entry (file+headline "~/org/_TODOs.org" "General")
                            "* TODO %?\n%i\n%U"
                            :empty-lines 1)
                           ("tl" "Location"
                            entry (file+headline "~/org/_TODOs.org" "Todos")
                            "* TODO %?\n%i\n%U\n%a"
                            :empty-lines 1)
                           ("n" "Notes")
                           ("ng" "General"
                            entry (file+headline "~/org/_notes.org" "Notes")
                            "* %?\n%i\n%U"
                            :empty-lines 1)
                           ("nl" "Location"
                            entry (file+headline "~/org/_notes.org" "Notes")
                             "* %?\n%i\n%U\n%a"
                             :empty-lines 1)))

  ;; letting it available for M-x, used to export documents
  (require 'ox-confluence)

  ;; mapping markdown files under default org directory as org-mode files
  (add-to-list 'auto-mode-alist
               (cons (concat (expand-file-name "~/org/") ".*\\.markdown\\'")
                     'org-mode))

  ;; letting auto-fill enabled for org-mode by default
  (add-hook 'org-mode-hook 'auto-fill-mode)
  ;; disabling line-numbers on org-mode files (performance)
  (add-hook 'org-mode-hook 'nolinum)
  )
