;;
;; Layer: of-theme-custom
;;  File: funcs.el
;;

(defun doom*brighter-buffer-maybe (buffer &rest _)
  (when (and (not doom-buffer-mode)
             buffer-file-name)
    (doom-buffer-mode +1))
  )
