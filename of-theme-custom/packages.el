;;
;; Layer: of-theme-custom
;;  File: packages.el
;;

(defconst of-theme-custom-packages
  '(auto-dim-other-buffers
    highlight-quoted
    highlight-symbol
    spaceline
    hl-line+
    fill-column-indicator
    ;;; themes
    doom-themes
    hc-zenburn-theme
    ample-theme
    material-theme
    solarized-theme
    )
  )

(defun of-theme-custom/init-auto-dim-other-buffers ()
  (use-package auto-dim-other-buffers
    :ensure t
    :init
    (auto-dim-other-buffers-mode)
    :config
    (with-eval-after-load 'diminish
      (diminish 'auto-dim-other-buffers-mode)))
  )

(defun of-theme-custom/init-highlight-quoted ()
  (use-package highlight-quoted
    :ensure t
    :init
    (add-hook 'prog-mode-hook 'highlight-quoted-mode))
  )

(defun of-theme-custom/init-highlight-symbol ()
  (use-package highlight-symbol
    :ensure t
    :diminish ""
    :init
    (add-hook 'prog-mode-hook 'highlight-symbol-mode)
    :config
    (setq highlight-symbol-idle-delay 0.3))
  )

(defun of-theme-custom/init-hl-line+ ()
  (use-package hl-line+
    :ensure t
    :diminish ""
    :init
    (setq hl-line-overlay-priority -150
          hl-line-sticky-flag t
          global-hl-line-overlay-priority 150
          global-hl-line-sticky-flag t)
    (require 'hl-line+)
    (global-linum-mode)
    (global-hl-line-mode 1)
    )
  )

(defun of-theme-custom/post-init-spaceline ()
  (spaceline-define-segment projectile-root
    "Show the current projectile root."
    (when (and (fboundp 'projectile-project-p)
               (stringp (projectile-project-p))
               (not (string= (projectile-project-name) (buffer-name))))
      (projectile-project-name)))

  (setq
   powerline-default-separator 'roundstub
   custom-spaceline-left '(((persp-name workspace-number window-number)
                            :fallback evil-state
                            :separator " ) "
                            :face highlight-face)
                           anzu
                           remote-host
                           (((projectile-root :when active)
                             buffer-id)
                            :separator " -> ")
                           buffer-modified
                           ((flycheck-error flycheck-warning flycheck-info)
                            :when active)
                           (process :when active)
                           ;; (minor-modes :separator "," :when active)
                           (erc-track :when active)
                           (version-control :when active)
                           (org-pomodoro :when active)
                           (org-clock :when active))
   custom-spaceline-right '((selection-info :when active)
                            (global-mode :when active)
                            (new-version :when active)
                            (line-column :when active)
                            (buffer-position hud)))

  ;; using defined variables to install a new spaceline configuration on the fly
  (spaceline-install custom-spaceline-left custom-spaceline-right)

  (setq spacemacs--diminished-minor-modes '((auto-fill-function " Ⓕ" " F")
                                            (color-identifiers-mode " Ⓒ" "")
                                            (company-mode "" "")
                                            (evil-org-mode "" "")
                                            (flycheck-mode " ⓢ" " s")
                                            (global-whitespace-mode "" "")
                                            (helm-gtags-mode "" "")
                                            (holy-mode "" "")
                                            (hybrid-mode "" "")
                                            (smartparens-mode "" "")
                                            (which-key-mode "" "")
                                            (whitespace-mode "" "")
                                            (editorconfig-mode "" "")
                                            (yas-minor-mode " ⓨ" " y")))
  )

(defun of-theme-custom/post-init-fill-column-indicator ()
  (setq fci-rule-width 1)
  (setq fci-rule-color "DarkSlateGray")
  )

(defun of-theme-custom/init-material-theme ())

(defun of-theme-custom/init-ample-theme ())

(defun of-theme-custom/init-hc-zenburn-theme ())

(defun of-theme-custom/init-solarized-theme ())

(defun of-theme-custom/init-doom-themes ()
  (use-package doom-themes
    :init
    (setq doom-enable-brighter-comments t
          doom-enable-bold nil)

    (require 'doom-themes)
    (load-theme 'doom-one t)

    (add-hook 'find-file-hook 'doom-buffer-mode)
    ;; brighter minibuffer when active
    (add-hook 'minibuffer-setup-hook 'doom-brighten-minibuffer)
    )
  )

;; EOF
