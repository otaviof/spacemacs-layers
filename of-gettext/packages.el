;;
;; Layer: of-gettext
;;  File: packages.el
;;

(defconst of-gettext-packages '(po-mode+))

(defun of-gettext/init-po-mode+ ()
  "Initialize `po-mode+`.
The package is located in a custom folder locally, pointing to that location and
linking file-types with this mode."
  (use-package po-mode+
    :defer t
    :load-path "~/.spacemacs.d/ew/po-mode+"
    :config
    (setq
     ;; po-mode, supporting gettext files
     auto-mode-alist (cons
                      '("\\.po\\'\\|\\.po\\." . po-mode)
                      auto-mode-alist))
    (autoload 'po-mode "po-mode"
      "Major mode for translators to edit PO files" t)
    (autoload 'po-find-file-coding-system "po-compat")
    (modify-coding-system-alist 'file "\\.po\\'\\|\\.po\\."
                                'po-find-file-coding-system))
  )

;; EOF
