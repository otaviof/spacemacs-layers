;;
;; Layer: of-keybindings
;;  File: keybindings.el
;;

(spacemacs/set-leader-keys "wc" 'spacemacs/delete-window)
(spacemacs/set-leader-keys "wF" 'make-frame)

;; Evil: Using surround just like Vim (Shift-S)
(evil-define-key 'visual evil-surround-mode-map "s" 'evil-substitute)
(evil-define-key 'visual evil-surround-mode-map "S" 'evil-surround-region)

(global-set-key (kbd "s-x") 'helm-M-x)
;; (global-set-key (kbd "s-x") 'counsel-M-x)
(define-key evil-normal-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)

(define-key global-map (kbd "s-c") 'of-keybindings/pbcopy)
(define-key global-map (kbd "s-v") 'simpleclip-paste)

(define-key global-map (kbd "s-0") 'select-window-0)
(define-key global-map (kbd "s-1") 'select-window-1)
(define-key global-map (kbd "s-2") 'select-window-2)
(define-key global-map (kbd "s-3") 'select-window-3)
(define-key global-map (kbd "s-4") 'select-window-4)
(define-key global-map (kbd "s-5") 'select-window-5)
(define-key global-map (kbd "s-6") 'select-window-6)
(define-key global-map (kbd "s-7") 'select-window-7)
(define-key global-map (kbd "s-8") 'select-window-8)
(define-key global-map (kbd "s-9") 'select-window-9)

(define-key evil-visual-state-map [escape]
  'keyboard-quit)
(define-key minibuffer-local-map [escape]
  'of-keybindings/minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape]
  'of-keybindings/minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape]
  'of-keybindings/minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape]
  'of-keybindings/minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape]
  'of-keybindings/minibuffer-keyboard-quit)

;; EOF
