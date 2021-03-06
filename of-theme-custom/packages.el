;;
;; Layer: of-theme-custom
;;  File: packages.el
;;

(defconst of-theme-custom-packages
  '(auto-dim-other-buffers
    beacon
    fill-column-indicator
    highlight-quoted
    highlight-symbol
    hl-line+
    spaceline
    ;; ivy-rich
    hc-zenburn-theme
    ample-theme
    doom-themes
    material-theme
    solarized-theme)
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
    :defer t
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
    :config
    (setq hl-line-overlay-priority -150
          hl-line-sticky-flag t
          global-hl-line-overlay-priority 150
          global-hl-line-sticky-flag t)
    (global-linum-mode)
    (global-hl-line-mode 1)
    )
  )

(defun of-theme-custom/post-init-spaceline ()
  (use-package all-the-icons
    :ensure t
    :demand
    :config
    (spaceline-define-segment projectile-root
      "Show the current projectile root."
      (when (and (fboundp 'projectile-project-p)
                 (stringp (projectile-project-p))
                 (not (string= (projectile-project-name) (buffer-name))))
        (propertize (projectile-project-name)
                    'face `(:slant italic :inherit))))

    (spaceline-define-segment
        ati-modified "An `all-the-icons' modified segment"
        (let* ((config-alist
                '(("*" all-the-icons-faicon-family all-the-icons-faicon "chain-broken"
                   :v-adjust -0.0)
                  ("-" all-the-icons-faicon-family all-the-icons-faicon "link"
                   :v-adjust -0.0)
                  ("%" all-the-icons-octicon-family all-the-icons-octicon "lock"
                   :v-adjust 0.1)))
               (result (cdr (assoc (format-mode-line "%*") config-alist))))
          (propertize (format "%s" (apply
                                    (cadr result)
                                    (cddr result)))
                      'face `(:family ,(funcall (car result)) :inherit))))

    (spaceline-define-segment
        ati-mode-icon "An `all-the-icons' segment for the current buffer mode"
        (let ((icon (all-the-icons-icon-for-buffer)))
          (unless (symbolp icon) ;; This implies it's the major mode
            (propertize icon
                        'help-echo (format "Major-mode: `%s`" major-mode)
                        'display '(raise 0.0)
                        'face `( :family ,(all-the-icons-icon-family-for-buffer) :inherit)))))

    (spaceline-define-segment
        ati-position "An `all-the-icons' segment for the Row and Column of the current point"
        (propertize (format-mode-line "%l:%c")
                    'face `(:underline t :inherit)))

    (defun spaceline---github-vc ()
      "Function to return the Spaceline formatted GIT Version Control text."
      (let ((branch (mapconcat 'concat (cdr (split-string vc-mode "[:-]")) "-")))
        (concat
         (propertize (format "%s " (all-the-icons-octicon "git-branch"))
                     'face `(:family ,(all-the-icons-octicon-family) :inherit)
                     'display '(raise 0.0))
         (propertize (format "%s" branch)
                     'face `(:slant italic :foreground "PaleGoldenrod" :inherit)
                     'display '(raise 0.0)))))

    (defun spaceline---svn-vc ()
      "Function to return the Spaceline formatted SVN Version Control text."
      (let ((revision (cadr (split-string vc-mode "-"))))
        (concat (propertize (format " %s" revision)))))

    (spaceline-define-segment
        ati-vc-branch-custom "An `all-the-icons' segment for the current Version Control icon"
        (when vc-mode
          (cond ((string-match "Git[:-]" vc-mode) (spaceline---github-vc))
                ((string-match "SVN-" vc-mode) (spaceline---svn-vc)))))

    (spaceline-define-segment
        ati-vc-icon-custom "An `all-the-icons' VCS representation"
        (when vc-mode
          (cond ((string-match "Git[:-]" vc-mode)
                 (propertize (all-the-icons-alltheicon "git")
                             'face '(:inherit) 'display '(raise 0.1)))
                ((string-match "SVN-" vc-mode)
                 (propertize (format " %s" (all-the-icons-faicon "cloud"))
                             'face `(:inherit) 'display '(raise -0.1))))))

    (defvar spaceline--upgrades nil)

    (spaceline-define-segment
        ati-buffer-size "Buffer Size"
        (propertize (format-mode-line "%I")
                    'face `(:foreground "DarkGray" :inherit)))

    (spaceline-define-segment
        ati-buffer-position "The current approximate buffer position, in percent."
        (propertize "%p" 'face `(:weight bold :inherit)))

    (setq powerline-default-separator 'roundstub)

    (add-hook 'spacemacs-post-user-config-hook
            (lambda ()
              (spaceline-install
              '(((persp-name workspace-number window-number)
                  :fallback evil-state
                  :separator " ) "
                  :face highlight-face)
                ((projectile-root buffer-id)
                  :separator " -> ")
                (process :when active)
                (ati-mode-icon ati-vc-icon-custom)
                remote-host
                (erc-track :when active)
                (org-pomodoro :when active)
                (org-clock :when active)
                ((anzu auto-compile)
                  :face highlight-face
                  :when active)
                )
              '((global-mode :when active)
                selection-info
                (flycheck-info flycheck-warning flycheck-error)
                ati-vc-branch-custom
                (ati-modified ati-buffer-size ati-position)
                (ati-buffer-position hud))
              )
              )
            t)
    )
  )

(defun of-theme-custom/post-init-fill-column-indicator ()
  (use-package fill-column-indicator
    :defer t
    :config
    (setq fci-rule-width 1)
    (setq fci-rule-color "DarkSlateGray"))
  )

(defun of-theme-custom/init-material-theme ()
  (use-package material-theme
    :defer t
    :disabled t)
  )

(defun of-theme-custom/init-ample-theme ()
  (use-package ample-theme
    :defer t
    :disabled t)
  )

(defun of-theme-custom/init-hc-zenburn-theme ()
  (use-package hc-zenburn-theme
    :defer t
    :disabled t)
  )

(defun of-theme-custom/init-solarized-theme ()
  (use-package solarized-theme
    :defer t
    :disabled t)
  )

(defun of-theme-custom/init-beacon ()
  (use-package beacon
    :ensure t
    :config
    (with-eval-after-load 'doom-themes
      (beacon-mode +1)
      (setq beacon-color (face-attribute 'highlight :background nil t)
            beacon-blink-delay 0.2
            beacon-blink-duration 0.4
            beacon-blink-when-buffer-changes t
            beacon-blink-when-point-moves-vertically 10
            )
      )
    )
)

(defun of-theme-custom/init-doom-themes ()
  (use-package doom-themes
    :ensure t
    :config
    (setq doom-one-brighter-modeline t
          doom-enable-brighter-comments t
          doom-enable-bold t
          doom-enable-italic t
          doom-neotree-file-icons t
          doom-neotree-line-spacing 0
          doom-neotree-enable-file-icons t
          doom-neotree-project-size 1.1
          )
    (advice-add 'switch-to-buffer :after 'doom*brighter-buffer-maybe)
    (advice-add 'display-buffer :after 'doom*brighter-buffer-maybe)
    (add-hook 'minibuffer-setup-hook 'doom-brighten-minibuffer)
    (load-theme 'doom-one t)
    (when window-system (require 'doom-neotree))
   )
  )

;; EOF
