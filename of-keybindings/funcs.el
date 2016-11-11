;;
;; Layer: of-keybindings
;;  File: funcs.el
;;

(defun of-keybindings/pbcopy ()
  (interactive)
  (call-process-region (point) (mark) "pbcopy")
  (setq deactivate-mark t)
  )

(defun of-keybindings/minibuffer-keyboard-quit ()
   "Abort recursive edit.
 In Delete Selection mode, if the mark is active, just deactivate it;
 then it takes a second \\[keyboard-quit] to abort the minibuffer."
   (interactive)
   (if (and delete-selection-mode transient-mark-mode mark-active)
       (setq deactivate-mark  t)
     (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
     (abort-recursive-edit)))

(defun iterm-here ()
  (interactive)
  (dired-smart-shell-command "open -a ~/Applications/iTerm.app $PWD" nil nil))

;; EOF
