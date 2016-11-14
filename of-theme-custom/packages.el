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
      (propertize (projectile-project-name)
                  'face `(:height 0.9 :slant italic :inherit))
      )
    :tight nil)

  (spaceline-define-segment
      ati-modified "An `all-the-icons' modified segment"
      (let* ((config-alist
              '(("*" all-the-icons-faicon-family all-the-icons-faicon "chain-broken" :height 1.2 :v-adjust -0.0)
                ("-" all-the-icons-faicon-family all-the-icons-faicon "link" :height 1.2 :v-adjust -0.0)
                ("%" all-the-icons-octicon-family all-the-icons-octicon "lock" :height 1.2 :v-adjust 0.1)))
             (result (cdr (assoc (format-mode-line "%*") config-alist))))

        (propertize (format "%s" (apply (cadr result) (cddr result))) 'face `(:family ,(funcall (car result)) :inherit )))
      :tight t)

  (spaceline-define-segment
      ati-mode-icon "An `all-the-icons' segment for the current buffer mode"
      (let ((icon (all-the-icons-icon-for-buffer)))
        (unless (symbolp icon) ;; This implies it's the major mode
          (propertize icon
                      'help-echo (format "Major-mode: `%s`" major-mode)
                      'display '(raise 0.0)
                      'face `(:height 1.0 :family
                                      ,(all-the-icons-icon-family-for-buffer) :inherit))))
      :tight nil
      )

  (spaceline-define-segment
      ati-position "An `all-the-icons' segment for the Row and Column of the current point"
      (propertize (format-mode-line "%l:%c")
                  'face `(:height 0.75 :underline t :inherit)
                  'display '(raise 0.2)))

  (defun spaceline---github-vc ()
    "Function to return the Spaceline formatted GIT Version Control text."
    (let ((branch (mapconcat 'concat (cdr (split-string vc-mode "[:-]")) "-")))
      (concat
       (propertize (format "%s " (all-the-icons-octicon "git-branch"))
                   'face `(:family ,(all-the-icons-octicon-family) :height 1.0 :inherit)
                   'display '(raise 0.0))
       (propertize (format "%s" branch)
                   'face `(:height 0.85 :slant italic :foreground "PaleGoldenrod")
                   'display '(raise 0.0))
       )))

  (defun spaceline---svn-vc ()
    "Function to return the Spaceline formatted SVN Version Control text."
    (let ((revision (cadr (split-string vc-mode "-"))))
      (concat
       (propertize (format " %s" revision)
                   'face `(:height 0.85))
       )))

  (spaceline-define-segment
      ati-vc-branch-custom "An `all-the-icons' segment for the current Version Control icon"
      (when vc-mode
        (cond ((string-match "Git[:-]" vc-mode) (spaceline---github-vc))
              ((string-match "SVN-" vc-mode) (spaceline---svn-vc))))
      :when active)

  (spaceline-define-segment
      ati-vc-icon-custom "An `all-the-icons' VCS representation"
      (when vc-mode
        (cond ((string-match "Git[:-]" vc-mode)
               (propertize (all-the-icons-alltheicon "git")
                           'face '(:height 1.1 :inherit) 'display '(raise 0.1)))
              ((string-match "SVN-" vc-mode)
               (propertize (format " %s" (all-the-icons-faicon "cloud"))
                           'face `(:height 1.2) 'display '(raise -0.1)))))
      :when active
      )

  (defvar spaceline--upgrades nil)
  (defun spaceline--count-upgrades ()
    "Function to count the number of package upgrades needed."
    (let ((buf (current-buffer)))
      (package-list-packages-no-fetch)
      (with-current-buffer "*Packages*"
        (setq spaceline--upgrades (length (package-menu--find-upgrades))))
      (switch-to-buffer buf)))
  (advice-add 'package-menu-execute :after 'spaceline--count-upgrades)

  (spaceline-define-segment
      ati-package-updates "An `all-the-icons' spaceline segment to indicate number of package updates needed"
      (let ((num (or spaceline--upgrades (spaceline--count-upgrades))))
        (propertize
         (concat
          (propertize (format "%s" (all-the-icons-octicon "package"))
                      'face `(:family ,(all-the-icons-octicon-family) :height 1.1 :inherit)
                      'display '(raise 0.1))
          (propertize (format " %d " num) 'face `(:height 0.9 :inherit) 'display '(raise 0.2)))
         'help-echo "Open Packages Menu"
         'mouse-face '(:box 1)
         'local-map (make-mode-line-mouse-map
                     'mouse-1 (lambda () (interactive) (package-list-packages)))))
      :when (and active (> (or spaceline--upgrades (spaceline--count-upgrades)) 0)))

  (spaceline-define-segment
      ati-buffer-size "Buffer Size"
      (propertize (format-mode-line "%I")
                  'face `(:height 0.8 :foreground "DarkGray" :inherit))
      :tight t)

  (spaceline-define-segment
      ati-buffer-position "The current approximate buffer position, in percent."
      (propertize "%p" 'face `(:height 0.9 :bold t :inherit))
      :tight nil
      )

  ;;
  ;; Define "left" and "right" for Spaceline major sections.
  ;;

  (setq custom-spaceline-left '(
                                ((persp-name workspace-number window-number)
                                 :fallback evil-state
                                 :separator " ) "
                                 :face highlight-face)
                                (anzu :when active)
                                (remote-host :when active)
                                (((projectile-root :when active) buffer-id)
                                 :separator " -> ")
                                (ati-buffer-size :when active)
                                (ati-mode-icon :when active)
                                (ati-modified :when active)
                                (ati-vc-icon-custom :when active)
                                (process :when active)
                                (erc-track :when active)
                                (org-pomodoro :when active)
                                (org-clock :when active)
                                ))

  (setq custom-spaceline-right '(
                                 selection-info
                                 (flycheck-info flycheck-warning flycheck-error)
                                 ;; purpose
                                 global-mode
                                 ati-vc-branch-custom
                                 ati-position
                                 ati-buffer-position
                                 hud
                                 ))

  (setq powerline-default-separator 'roundstub)

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
                                            (linum-relative-mode "" "")
                                            (doom-buffer-mode "" "")
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
          doom-enable-bold nil
          doom-enable-italic t
          doom-neotree-file-icons t
          doom-neotree-line-spacing 0
          doom-neotree-enable-file-icons t
          doom-neotree-project-size 1.2)
    :config
    (load-theme 'doom-one t)
    ;; (add-hook 'find-file-hook 'doom-buffer-mode)
    ;; brighter minibuffer when active
    (add-hook 'minibuffer-setup-hook 'doom-brighten-minibuffer)
    (require 'doom-neotree)
    )
  )

;; EOF
