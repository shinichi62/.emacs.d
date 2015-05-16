; *.~ no backup file
(setq make-backup-files nil)
; .#* no backup file
(setq auto-save-default nil)

; change meta
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))

; key bind
(define-key global-map (kbd "\C-cl") 'toggle-truncate-lines)
(global-set-key (kbd "M-g") 'goto-line)

; synchronize the emacs and os
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))
(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))
(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

; cask
(require 'cask "~/.cask/cask.el")
(setq user_bundle (cask-initialize "~/.emacs.d"))
(cask-install user_bundle)
(cask-update  user_bundle)
(cask-initialize)

; helm
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

; auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(setq ac-use-menu-map t)

; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)
