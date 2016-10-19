;;
;; Layer: of-org
;;  File: packages.el
;;

(defconst of-org-packages '(org org-journal toc-org))

(defun of-org/post-init-org ()
  (setq-default
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
   org-agenda-files '("~/org/_notes.org"
                      "~/org/_TODOs.org"
                      "~/org/_projects.org")
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
                             :empty-lines 1))
   )

  ;; letting it available for M-x, used to export documents
  (require 'ox-confluence)

  ;; mapping markdown files under default org directory as org-mode files
  (add-to-list 'auto-mode-alist
               (cons (concat (expand-file-name "~/org/") ".*\\.markdown\\'")
                     'org-mode))

  ;; letting auto-fill enabled for org-mode by default
  (add-hook 'org-mode-hook 'auto-fill-mode)

  ;; adding a more extensive support on programming languages
  (org-babel-do-load-languages 'org-babel-load-languages
                               '((perl . t)
                                 (ruby . t)
                                 (sh . t)))
  )

(defun of-org/init-toc-org ()
  (use-package toc-org
    :config
    (if (require 'toc-org nil t)
        (add-hook 'org-mode-hook 'toc-org-enable)
      (warn "toc-org package not found!"))
    )
  )

(defun of-org/init-org-journal ()
 (use-package org-journal
   :init
   (setq org-journal-dir "~/org/me/_journal"
         org-journal-file-format "%Y-%m-%d.org")
   )
 )

;; EOF
