;;
;; Layer: of-speedbar
;;  File: packages.el
;;

(defconst of-speedbar-packages
  '(sr-speedbar)
  )

(defun of-speedbar/post-init-sr-speedbar ()
  (defun spacemacs/sr-speedbar-show-or-hide ()
    (interactive)
    (cond ((sr-speedbar-exist-p) (kill-buffer speedbar-buffer))
          (t (sr-speedbar-open) (linum-mode -1) (speedbar-refresh))))
  )

(defun of-speedbar/init-sr-speedbar ()
  (use-package sr-speedbar
    :init
    (setq sr-speedbar-width 30
          sr-speedbar-right-side nil
          sr-speedbar-max-width 66
          sr-speedbar-use-images t
          sr-speedbar-verbosity-level 1
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
            "[Mm]akefile\\(\\.in\\)?"))
    :config
    (evil-leader/set-key
      "fT" 'spacemacs/sr-speedbar-show-or-hide)
    (define-key speedbar-mode-map
      (kbd "q") 'spacemacs/sr-speedbar-show-or-hide))
  )

;; EOF
