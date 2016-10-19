;;
;; Layer: of-keybindings
;;  File: packages.el
;;

(defconst of-keybindings-packages
  '(evil
    simpleclip)
  )

(defun of-keybindings/pre-init-evil ()
  (setq avy-all-windows 'all-frames)
  )

(defun of-keybindings/post-init-evil ()
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

(defun of-keybindings/init-simpleclip ()
  (setq simpleclip-copy-keystrokes nil
        simpleclip-cut-keystrokes nil
        simpleclip-paste-keystrokes nil)
  ;; avoids populating the kill ring after replace an selection
  (fset 'evil-visual-update-x-selection 'ignore)
  )

(defun of-keybindings/post-init-simpleclip ()
  (delete-selection-mode 1)
  (pending-delete-mode 1)
  (transient-mark-mode 1)

  (require 'simpleclip)
  (simpleclip-mode 1)
  )

;; EOF
