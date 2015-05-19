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

; Path
(setenv "PATH" "C:\\cygwin64\\bin")
(setq grep-find-command "find . -type d -path '*CVS*' -prune -o -print0 |xargs -0 grep -niH ")

;;; windows-00_init.el ends here
