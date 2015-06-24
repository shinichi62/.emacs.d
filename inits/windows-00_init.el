;;; windows-00_init.el --- for windows
;;; Commentary:
;;; Code:

; Window
(if window-system
  (progn
    (setq initial-frame-alist '((width . 130) (height . 45) (top . 20) (left . 60)))
    ))

; Menu
(tool-bar-mode -1)
(menu-bar-mode -1)


; Font
(set-face-attribute 'default nil :family "Consolas" :height 130)
(set-fontset-font nil 'japanese-jisx0208 (font-spec :family "MeiryoKe_Console"))
(setq face-font-rescale-alist '(("MeiryoKe_Console" . 1.08)))

; Path
(setenv "PATH" "C:\\cygwin64\\bin")
(setq grep-find-command "find . -type f -print0 |xargs -0 grep -niH ")

;;; windows-00_init.el ends here
