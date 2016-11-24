;;
;; Layer: of-org
;;  File: funcs.el
;;

(defun of-org/org-projectile-capture-for-current-project ()
  (interactive)
  (org-projectile:capture-for-current-project)
  )

(defun nolinum ()
  (global-linum-mode 0)
)

;; EOF
