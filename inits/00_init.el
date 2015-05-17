;;; 00_init.el --- common setting
;;; Commentary:
;;; Code:

; Color-theme
(load-theme 'manoj-dark t)

; Encoding
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8-unix)
;(prefer-coding-system 'shift_jis)
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
; For find-file etc
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
; For helm-find-files etc
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
; define key
(define-key global-map (kbd "M-x")     'helm-M-x)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key global-map (kbd "C-x C-r") 'helm-recentf)
(define-key global-map (kbd "M-y")     'helm-show-kill-ring)
(define-key global-map (kbd "C-c i")   'helm-imenu)
(define-key global-map (kbd "C-x b")   'helm-buffers-list)

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
