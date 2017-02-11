;;
;; Layer: of-theme-custom
;;  File: config.el
;;

;;
;; Per theme, describing which overwrites take place.
;;
(setq-default
 theming-modifications
 '(;;;
   ;;; Ample Theme
   ;;;   (https://github.com/jordonbiondo/ample-theme)
   ;;;
   (ample
    (default :foreground "LightGray" :background "gray13")
    (auto-dim-other-buffers-face :background "#2A2A2A")
    ;; setting color for ace-window letter, to select a frame
    (aw-leading-char-face :foreground "red"
                          :height 6.6
                          :weight ultra-bold
                          :width ultra-expanded)
    (button :underline t)
    (hl-line :background "#333333"
              :inverse-video nil)
    (mouse :background "LightGoldenrod"
            :foreground "white smoke")
    ;; "region" stands for selected region, like as in `ctrl-v' when using Evil
    (region :inverse-video t
            :foreground "DarkSeaGreen")
    (scroll-margin 0)
    (smooth-scroll-margin 0)
    (font-lock-keyword-face :foreground "#81b0e3" :weight bold)
    (enh-ruby-op-face :foreground "white smoke")
    ;; orgmode
    (org-level-1 :height 1.20 :foreground "Tomato")
    (org-level-2 :height 1.15 :foreground "Coral")
    (org-level-3 :height 1.10 :foreground "DarkSalmon")
    (org-level-4 :height 1.05 :foreground "RosyBrown")
    ;; surrounded by tilde
    (org-code :foreground "Burlywood")
    ;; equal sign
    (org-verbatim :foreground "DarkGoldenrod")
    ;; less margin when navigating
    (scroll-margin 0)
    (smooth-scroll-margin 0)
    (show-paren-match :background "#363636")
    (font-lock-comment-face	:foreground "#888888" :background "gray14")
    ;; helm and bufer prompts
    (minibuffer-prompt :foreground "orange1" :weight bold :background nil)
    ;; bread-crumb and helm/ido headers
    (header-line :background "gray26" :foreground "#81b9e3")
    )
   ;;;
   ;;; Doom Themes
   ;;;   (https://github.com/hlissner/emacs-doom-theme)
   ;;;
   (doom-one
    (auto-dim-other-buffers-face :background "#22252c")
    (aw-leading-char-face :foreground "red"
                         :height 6.6
                          :weight ultra-bold
                          :width ultra-expanded)
    (mode-line :background "#353a42")
    (mode-line-inactive :background "#1e2022" :foreground "#464D59")
    (mode-line-buffer-id-inactive :background "#464D59" :foreground "#0F1726")
    (mode-line-highlight :foreground "MediumPurple" :weight bold)
    (mode-line-buffer-id :foreground "#afafd7" :weight semi-bold)
    (spaceline-evil-normal :inherit mode-line
                           :foreground "Black"
                           :background "Orange1"
                           :overline "Orange1"
                           :underline "Orange1"
                           :weight semi-bold)
    (spaceline-evil-insert :inherit mode-line
                           :foreground "Black"
                           :background "#2d9574"
                           :overline "#2d9574"
                           :underline "#2d9574"
                           :weight semi-bold)
    (spacemacs-replace-face :inherit mode-line
                            :foreground "Black"
                            :background "Tomato"
                            :overline "Tomato"
                            :underline "Tomato"
                            :weight semi-bold)
    (spaceline-evil-visual :inherit mode-line
                           :foreground "Black"
                           :background "DimGray"
                           :overline "DimGray"
                           :underline "DimGray"
                           :weight semi-bold)
    (spacemacs-emacs-face :inherit mode-line
                          :foreground "Black"
                          :background "MediumOrchid"
                          :overline "MediumOrchid"
                          :underline "MediumOrchid"
                          :weight semi-bold)
    (neo-root-dir-face :height 1.1)
    (neo-dir-link-face :height 1.0)
    (neo-file-link-face :height 0.9)
    (speedbar-directory-face :foreground "light blue" :height 1.0)
    (speedbar-file-face :foreground "cyan" :height 0.9 )
    (speedbar-tag-face :foreground "yellow" :height 0.85)
    )
   ;;;
   ;;; Idea Darkula Theme
   ;;;   (https://github.com/fommil/darcula-theme-emacs)
   ;;;
   (idea-darkula
    (default :foreground "LightGray")
    (auto-dim-other-buffers-face :background "#222222")
    (aw-leading-char-face :foreground "red"
                          :height 6.6
                          :weight ultra-bold
                          :width ultra-expanded)
    (font-lock-comment-face :foreground "#808080" :background "#2F2F2F")
    (org-level-1 :height 1.20 :foreground "Tomato")
    (org-level-2 :height 1.15 :foreground "Coral")
    (org-level-3 :height 1.10 :foreground "DarkSalmon")
    (org-level-4 :height 1.05 :foreground "RosyBrown")
    (mode-line :foreground "#A9B7C6"
               :box (:line-width -1 :color "#464646")
               :weight medium
               :height 1.02)
    (mode-line-buffer-id :foreground "#d17ad6"
                         :background nil
                         :weight bold)
    (mode-line-inactive :height 1
                        :weight normal
                        :box nil)
    (mode-line-emphasis :foreground "white" :slant italic)
    (mode-line-highlight :foreground "purple" :box nil)
    )
   ;;;
   ;;; High Contrast Zenburn
   ;;;   (https://github.com/edran/hc-zenburn-emacs)
   ;;;
   (hc-zenburn
    (auto-dim-other-buffers-face :background "#222222")
    (region :background "DimGray" (t :inverse-video t))
    (hl-line :inherit nil :background "DarkSlateGray" (t :inverse-video t))
    (company-tooltip-common :inherit company-tooltip :weight bold :underline nil)
    (company-tooltip-common-selection :inherit company-tooltip-selection :weight bold :underline nil)
    (mode-line :foreground "#9CBF9C"
               :background "#202020"
               :box (:line-width 1 :style released-button)
               (t :inverse-video t))
    (mode-line-highlight :inherit mode-line
                         :foreground "MediumPurple"
                         :weight bold)
    (mode-line-buffer-id :inherit mode-line
                         :foreground "#afafd7"
                         :weight bold)
    (spaceline-evil-normal :inherit mode-line
                           :foreground "Black"
                           :background "Orange1"
                           :overline "Orange1"
                           :underline "Orange1"
                           :weight bold)
    (spaceline-evil-insert :inherit mode-line
                           :foreground "Black"
                           :background "#2d9574"
                           :overline "#2d9574"
                           :underline "#2d9574"
                           :weight bold)
    (spacemacs-replace-face :inherit mode-line
                            :foreground "Black"
                            :background "Tomato"
                            :overline "Tomato"
                            :underline "Tomato"
                            :weight bold)
    (spaceline-evil-visual :inherit mode-line
                           :foreground "Black"
                           :background "DimGray"
                           :overline "DimGray"
                           :underline "DimGray"
                           :weight bold)
    (spacemacs-emacs-face :inherit mode-line
                          :foreground "Black"
                          :background "MediumOrchid"
                          :overline "MediumOrchid"
                          :underline "MediumOrchid"
                          :weight bold)
    (spacemacs-motion-face :inherit spacemacs-emacs-face)
    (org-code :foreground "Burlywood")
    (org-done :weight bold :foreground "ForestGreen")
    (org-headline-done :foreground "ForestGreen")
    )
   ;;;
   ;;; Google's Material
   ;;;   (https://github.com/cpaulik/emacs-material-theme)
   ;;;
   (material
    (auto-dim-other-buffers-face :background "#1c1f26")
    (hl-line :background "#182A33" :inverse-video nil)
    ;; (org-level-1 :foreground "Wheat")
    ;; (org-level-2 :foreground "NavajoWhite")
    ;; (org-level-3 :foreground "Tan")
    ;; (org-level-4 :foreground "BurlyWood")
    (mode-line-highlight :inherit mode-line
                         :foreground "MediumPurple"
                         :weight bold)
    (mode-line-buffer-id :inherit mode-line
                         :foreground "#afafd7"
                         :weight bold)
    (spaceline-evil-normal :inherit mode-line
                           :foreground "Black"
                           :background "Orange1"
                           :overline "Orange1"
                           :underline "Orange1"
                           :weight bold)
    (spaceline-evil-insert :inherit mode-line
                           :foreground "Black"
                           :background "#2d9574"
                           :overline "#2d9574"
                           :underline "#2d9574"
                           :weight bold)
    (spacemacs-replace-face :inherit mode-line
                            :foreground "Black"
                            :background "Tomato"
                            :overline "Tomato"
                            :underline "Tomato"
                            :weight bold)
    (spaceline-evil-visual :inherit mode-line
                           :foreground "Black"
                           :background "DimGray"
                           :overline "DimGray"
                           :underline "DimGray"
                           :weight bold)
    (spacemacs-emacs-face :inherit mode-line
                          :foreground "Black"
                          :background "MediumOrchid"
                          :overline "MediumOrchid"
                          :underline "MediumOrchid"
                          :weight bold)
    (spacemacs-motion-face :inherit spacemacs-emacs-face)
    (font-lock-preprocessor-face :foreground "#0097A7")
    )
   ;;;
   ;;; Solarized for Emacs (Dark)
   ;;;   (https://github.com/bbatsov/solarized-emacs)
   ;;;
   (solarized-dark
    (auto-dim-other-buffers-face :background "#002636")
    (aw-leading-char-face :foreground "red"
                          :height 6.6
                          :weight ultra-bold
                          :width ultra-expanded)
    (border :foreground "#586e75")
    (default :foreground "LightGray")
    (font-lock-comment-delimiter-face :slant italic :background "#002636")
    (font-lock-comment-face :slant italic :foreground "Lightskyblue4")
    (region :inverse-video t :foreground "DarkSeaGreen" :background "black")
    (solarized-distinct-doc-face t)
    (solarized-distinct-fringe-background t)
    (solarized-emphasize-indicators t)
    (solarized-high-contrast-mode-line t)
    (solarized-use-variable-pitch t)
    (x-underline-at-descent-line t)
    )
   ;;;
   ;;; Solarized for Emacs (Light)
   ;;;   (https://github.com/bbatsov/solarized-emacs)
   ;;;
   (solarized-light
    (auto-dim-other-buffers-face :background "#eee8d5")
    (aw-leading-char-face :foreground "red"
                          :height 6.6
                          :weight ultra-bold
                          :width ultra-expanded)
    (border :foreground "#586e75")
    (comment :slant italic)
    (default :foreground "#586e75")
    (font-lock-comment-delimiter-face :slant italic :background "#eee8d5")
    (font-lock-comment-face :slant italic :foreground "Lightskyblue4")
    (hl-line :background "#eee8d5" :inverse-video nil)
    (linum :inherit (shadow default) :background "#eee8d5" :foreground "#586e75")
    (region :inverse-video t :foreground "DarkSeaGreen" :background "black")

    (solarized-distinct-doc-face t)
    (solarized-distinct-fringe-background t)
    (solarized-emphasize-indicators t)
    (solarized-high-contrast-mode-line t)
    (solarized-use-variable-pitch t)
    (solarized-m)
    (x-underline-at-descent-line t)
    )
   )
 )

;; EOF
