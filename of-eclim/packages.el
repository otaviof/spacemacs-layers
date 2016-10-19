;;
;; Layer: of-eclim
;;  File: packages.el
;;

(defconst of-eclim-packages
  '(emacs-eclim
    feature-mode
    groovy-mode)
  )

(defun of-eclim/post-init-emacs-eclim ()
  "Tell Eclim the path for binaries."
  (setq
   ;; installation done via homebrew cask
   of-eclim/cask-base-dir "/usr/local/Caskroom/eclipse-ide/4.5.2"
   ;; merging brew with app directory strucuture
   eclim-eclipse-dirs (concat of-eclim/cask-base-dir
                              "/Eclipse.app/Contents/Eclipse")
   ;; merging app directory with final executable, not "eclimd"!
   eclim-executable (concat eclim-eclipse-dirs "/eclim"))
  )

(defun of-eclim/init-feature-mode ()
  "Initialize Cucumber feature mode."
  (use-package feature-mode
    :mode (("\\.feature\\'" . feature-mode)))
  )

(defun of-eclim/init-groovy-mode ()
  "Initializes Groovy mode."
  (use-package groovy-mode
    :config
    ;; Adding Gradle primary file into groovy-mode
    (add-to-list 'auto-mode-alist '("build.gradle$" . groovy-mode)))
  )

;; EOF
