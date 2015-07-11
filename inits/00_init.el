;;; 00_init.el --- common setting
;;; Commentary:
;;; Code:

; Color-theme
(load-theme 'manoj-dark t)

; Encoding
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8-unix)
(set-buffer-file-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)

; No backup file
(setq make-backup-files nil) ; *.~
(setq auto-save-default nil) ; .#*

; Key bind
(global-set-key (kbd "C-h") 'backward-delete-char)
(global-set-key (kbd "M-g") 'goto-line)
(define-key global-map (kbd "\C-cl") 'toggle-truncate-lines)

;; Show tab, zenkaku-space, white spaces at end of line
;; http://www.bookshelf.jp/soft/meadow_26.html#SEC317
(defface my-face-tab         '((t (:foreground "Yellow" :underline t))) nil :group 'my-faces)
(defface my-face-zenkaku-spc '((t (:background "LightBlue"))) nil :group 'my-faces)
(defface my-face-spc-at-eol  '((t (:foreground "Red" :underline t))) nil :group 'my-faces)
(defvar my-face-tab         'my-face-tab)
(defvar my-face-zenkaku-spc 'my-face-zenkaku-spc)
(defvar my-face-spc-at-eol  'my-face-spc-at-eol)
(defadvice font-lock-mode (before my-font-lock-mode ())
  (font-lock-add-keywords
   major-mode
   '(("\t" 0 my-face-tab append)
     ("　" 0 my-face-zenkaku-spc append)
     ("[ \t]+$" 0 my-face-spc-at-eol append)
     )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)

; Auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(setq ac-use-menu-map t)

; Elscreen
; https://github.com/knu/elscreen
(elscreen-start)

; Flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

; Helm
(require 'helm-config)
(helm-mode 1)
; define key
(define-key global-map (kbd "M-x")     'helm-M-x)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key global-map (kbd "C-x C-r") 'helm-recentf)
(define-key global-map (kbd "M-y")     'helm-show-kill-ring)
(define-key global-map (kbd "C-c i")   'helm-imenu)
(define-key global-map (kbd "C-x b")   'helm-buffers-list)
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)
; color
(custom-set-faces
 '(helm-selection ((t (:background "magenta" :distant-foreground "black")))))

; Linum
(require 'linum)
(global-linum-mode 1)
(setq linum-format "%4d ")

; Revive
(autoload 'save-current-configuration "revive" "Save status" t)
(autoload 'resume "revive" "Resume Emacs" t)
(autoload 'wipe "revive" "Wipe emacs" t)
(define-key global-map (kbd "C-x S") 'save-current-configuration)
(define-key global-map (kbd "C-x F") 'resume)
(add-hook 'kill-emacs-hook 'save-current-configuration)

; Tramp
; C-x C-f /ssh:user@host:path (for linux)
; C-x C-f /plink:user@host:path (for win)
(require 'tramp)
(setq tramp-shell-prompt-pattern "^.*[#$%>] *")

;;; 00_init.el ends here
