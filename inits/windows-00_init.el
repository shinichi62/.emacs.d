;;; windows-00_init.el --- for windows
;;; Commentary:
;;; Code:

; Path
;(setq exec-path (append exec-path '("C:\\cygwin64\\bin")))
;(setenv "PATH" "C:\\Program Files (x86)\\Git\\bin")
;(setq exec-path (append exec-path '("C:\\Program Files (x86)\\Git\\bin")))
;(setenv "PATH"
;  (concat
;  "C:\\cygwin64\\bin" ";"
;  (getenv "PATH")
;  ))
(setenv "PATH" "C:\\cygwin64\\bin")
(setq grep-find-command "find . -type d -path '*CVS*' -prune -o -print0 |xargs -0 grep -niH ")

;;; windows-00_init.el ends here
