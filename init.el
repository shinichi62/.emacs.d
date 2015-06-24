;;; init.el --- initial setting
;;; Commentary:
;;; Code:

; Proxy
(setq url-proxy-services '("http" . ""))

; Cask
(require 'cask "~/.cask/cask.el")
(setq user_bundle (cask-initialize "~/.emacs.d"))
(cask-install user_bundle)
(cask-update  user_bundle)
(cask-initialize)

(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")

;;; init.el ends here
