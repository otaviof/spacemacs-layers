;;
;; Layer: of-keybindings
;;  File: packages.el
;;

(defconst of-keybindings-packages '(evil simpleclip evil-embrace))

(defun of-keybindings/post-init-evil ()
  (with-eval-after-load 'evil
    ;; Making underscore as part of a single word in Evil
    ;;   https://github.com/syl20bnr/spacemacs/blob/develop/doc/FAQ.org#include-underscores-in-word-motions
    (add-hook 'python-mode-hook
              (function
              (lambda () (modify-syntax-entry ?_ "w" python-mode-syntax-table))))
    (add-hook 'ruby-mode-hook
              (function
              (lambda () (modify-syntax-entry ?_ "w" ruby-mode-syntax-table))))
    (add-hook 'enh-ruby-mode-hook
              (function
              (lambda () (modify-syntax-entry ?_ "w" enh-ruby-mode-syntax-table))))
    (add-hook 'go-mode-hook
              (function
              (lambda () (modify-syntax-entry ?_ "w" go-mode-syntax-table)
                (setq tab-width 4))))
    )
  )

(defun of-keybindings/init-simpleclip ()
  (use-package simpleclip
    :defer t
    :config
    (setq simpleclip-copy-keystrokes nil
          simpleclip-cut-keystrokes nil
          simpleclip-paste-keystrokes nil)

    ;; avoids populating the kill ring after replace an selection
    (fset 'evil-visual-update-x-selection 'ignore)

    (delete-selection-mode 1)
    (pending-delete-mode 1)
    (transient-mark-mode 1)
    (simpleclip-mode 1))
  )

(defun of-keybindings/post-init-evil-embrace ()
  (use-package evil-embrace
    :defer t
    :config
    (evil-embrace-enable-evil-surround-integration))
  )

;; EOF
