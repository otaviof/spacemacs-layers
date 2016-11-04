;;
;; Layer: of-speedbar
;;  File: packages.el
;;

(defconst of-speedbar-packages '(sr-speedbar
                                 projectile-speedbar
                                 ppd-sr-speedbar))

(defun of-speedbar/post-init-ppd-sr-speedbar ()
  (use-package ppd-sr-speedbar
    :ensure t
    )
  )

(defun of-speedbar/post-init-projectile-speedbar ()
  (use-package projectile-speedbar
    :ensure t
    )
  )

(defun of-speedbar/init-sr-speedbar ()
  (use-package sr-speedbar
    :ensure t
    :init
    (evil-leader/set-key
      "fT" 'spacemacs/sr-speedbar-show-or-hide)
    :config
    (setq
     sr-speedbar-width 30
     sr-speedbar-window 0
     sr-speedbar-right-side nil
     sr-speedbar-max-width 66
     speedbar-use-images nil
     sr-speedbar-use-images nil
     sr-speedbar-verbosity-level 0
     sr-speedbar-width-console 21
     sr-speedbar-width-x 21
     ;; adding tags to support more extensions on sr-speedbar
     speedbar-supported-extension-expressions
     '(".[ch]\\(\\+\\+\\|pp\\|c\\|h\\|xx\\)?"
       ".tex\\(i\\(nfo\\)?\\)?"
       ".todo"
       ".done"
       ".md"
       ".el"
       ".emacs"
       ".l"
       ".lsp"
       ".p"
       ".java"
       ".js"
       ".f\\(90\\|77\\|or\\)?"
       ".ad[abs]"
       ".p[lm]"
       ".tcl"
       ".m"
       ".scm"
       ".pm"
       ".py"
       ".g"
       ".go"
       ".rb"
       ".jpg"
       ".png"
       "\\.\\(inc\\|php[s345]?\\|phtml\\)"
       ".s?html"
       ".ma?k"
       "[Mm]akefile\\(\\.in\\)?")
      )
    (define-key speedbar-mode-map
      (kbd "q") 'spacemacs/sr-speedbar-show-or-hide)
    )
  )

(defun of-speedbar/post-init-sr-speedbar ()
  (defun spacemacs/sr-speedbar-show-or-hide ()
    (interactive)
    (cond ((sr-speedbar-exist-p)
           (kill-buffer speedbar-buffer))
          (t
           (sr-speedbar-open)
           (linum-mode -1)
           (speedbar-refresh)
           )
          )
    )

  (add-hook 'speedbar-mode-hook (lambda()
                                  (set-window-fringes nil 0)))
  )

;; EOF
