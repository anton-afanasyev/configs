
;; ;; GTAGS settings (ggtags binds)
;; (setq load-path (cons "~/.emacs.d/ggtags.el" load-path))
;; (autoload 'ggtags-mode "ggtags" "" t)
;; (add-hook 'c++-mode-hook 
;;    '(lambda () 
;;       (ggtags-mode t)
;; ))
;; (add-hook 'c-mode-hook 
;;    '(lambda () 
;;       (ggtags-mode t)
;; ))



;; my favourite scrolling

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq scroll-conservatively 50)
(setq scroll-preserve-screen-position 't)

;; Default is no tabs, indent by two spaces
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 2)

;; Detect source indentation. To install dtrt-indent package run
;; "M-x package-list-packages" and "M-x package-install", "dtrt-indent"
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(autoload 'dtrt-indent-mode "dtrt-indent" "Adapt to foreign indentation offsets" t)
(add-hook 'c-mode-common-hook 'dtrt-indent-mode)

;; Ctrl-h for delete-backward-char
(global-set-key (kbd "C-x h") 'help-command)
(global-set-key (kbd "M-?") 'mark-paragraph)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)

;; Query replace
(global-set-key (kbd "C-q") 'query-replace)

;; Google style
(add-to-list 'load-path "~/configs/emacs/third-party/coding-style/")
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; Julia support
(add-to-list 'load-path "~/configs/emacs/third-party")
(require 'julia-mode)

;; go-mode support
;; (run "M-x package-list-packages" and "M-x package-install", "go-mode")
;; (taken from here: http://tleyden.github.io/blog/2014/05/22/configure-emacs-as-a-go-editor-from-scratch/)

;; go get -u golang.org/x/tools/cmd/goimports
;(setq gofmt-command "goimports")
;(add-hook 'before-save-hook #'gofmt-before-save)
;;(remove-hook 'before-save-hook #'gofmt-before-save)

;; go get -u github.com/golang/lint
;(add-to-list 'load-path (concat (getenv "GOPATH")  "/src/github.com/golang/lint/misc/emacs"))
;(require 'golint)

;; jade mode support
;;(add-to-list 'load-path "~/configs/emacs/third-party/jade-mode")
;;(require 'sws-mode)
;;(require 'jade-mode)
;;(add-to-list 'auto-mode-alist '("\\.styl\\'" . sws-mode))

;; Emacs.menuBar:off
;; Emacs.toolBar:off
;; Emacs.verticalScrollBars:off
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;;(set-language-environment 'Cyrillic-KOI8)
(set-language-environment 'UTF-8)


;(prefer-coding-system 'koi8-r)
(prefer-coding-system 'utf-8)
;(prefer-coding-system 'cp1251-dos)

; (setq process-coding-system-alist '((shell . utf-8))
; find-operation-coding-system
(setq default-process-coding-system '(utf-8 . utf-8))

;(set-terminal-coding-system 'utf-8)


;(set-language-environment "Russian")
;(define-coding-system-alias 'windows-1251 'cp1251)
;(set-buffer-file-coding-system 'cp1251-dos)
;(set-default-coding-systems 'cp1251-dos)
;(set-terminal-coding-system 'cp1251-dos)
;(set-selection-coding-system 'cp1251-dos)
;(prefer-coding-system 'cp1251-dos)

(set-register ?e '(file . "~/.emacs"))
(set-register ?a '(file . "~"))
(set-register ?t '(file . "~/todo"))


;; Mode for buffers switching
(ido-mode t)
(icomplete-mode t)

;; My keybindings
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "C-S-<tab>") 'other-frame)


(column-number-mode)


(defun move-to-window-line-begin ()
  (interactive)
  (move-to-window-line 0))

(defun move-to-window-line-end ()
  (interactive)
  (move-to-window-line -1))


;; Temporary bindings
;; (global-set-key (kbd "C-S-l") 'forward-char)
;; (global-set-key (kbd "C-S-j") 'backward-char)
;; (global-set-key (kbd "C-S-k") 'next-line)
;; (global-set-key (kbd "C-S-i") 'previous-line)
(global-set-key (kbd "C-S-p") 'move-to-window-line-begin)
(global-set-key (kbd "C-S-n") 'move-to-window-line-end)
(global-set-key (kbd "C-<") 'beginning-of-buffer)
(global-set-key (kbd "C->") 'end-of-buffer)
(global-set-key (kbd "C-S-v") 'scroll-down)
(global-set-key (kbd "C-;") 'kill-buffer)
(global-set-key (kbd "C-,") 'next-buffer)
(global-set-key (kbd "C-.") 'previous-buffer)

;; (keyboard-translate ?\M-a ?b)

;; 'm' in Custom work as 'ctrl-m'
(add-hook 'custom-mode-hook
	  '(lambda ()
	     (define-key custom-mode-map "m" ;; <self-inserting>
	       'Custom-newline)))

;; Кольцо для C-z -- циклический перебор shell-ов.
;; (Это взято здесь: http://www.emacswiki.org/emacs-en/ShellMode#toc3 )
(defun alt-shell-dwim (arg)
  "Run an inferior shell like `shell'. If an inferior shell as its I/O
through the current buffer, then pop the next buffer in `buffer-list'
whose name is generated from the string \"*shell*\". When called with
an argument, start a new inferior shell whose I/O will go to a buffer
named after the string \"*shell*\" using `generate-new-buffer-name'."
  (interactive "P")
  (let* ((shell-buffer-list
	  (let (blist)
	    (dolist (buff (buffer-list) blist)
	      (when (string-match "^\\*shell\\*" (buffer-name buff))
		(setq blist (cons buff blist))))))
	 (name (if arg
		   (generate-new-buffer-name "*shell*")
		 (car shell-buffer-list))))
    (shell name)))


(defun my-filter (condp lst)
  (delq nil (mapcar (lambda (x) (and (funcall condp x) x)) lst)))
(defun shell-dwim (&optional create)
  "Start or switch to an inferior shell process, in a smart way.  If a
 buffer with a running shell process exists, simply switch to that buffer.
 If a shell buffer exists, but the shell process is not running, restart the
 shell.  If already in an active shell buffer, switch to the next one, if
 any.  With prefix argument CREATE always start a new shell."
  (interactive "P")
  (let ((next-shell-buffer) (buffer)
	(shell-buf-list (identity ;;used to be reverse
			 (sort
			  (my-filter (lambda (x) (string-match "^\\*shell\\*" (buffer-name x))) (buffer-list))
			  '(lambda (a b) (string< (buffer-name a) (buffer-name b)))))))
    (setq next-shell-buffer
	  (if (string-match "^\\*shell\\*" (buffer-name buffer))
	      (get-buffer (cadr (member (buffer-name) (mapcar (function buffer-name) (append shell-buf-list shell-buf-list)))))
	    nil))
    (setq buffer
	  (if create
	      (generate-new-buffer-name "*shell*")
	    next-shell-buffer))
    (shell buffer)))

(global-set-key (kbd "C-z") 'shell-dwim)


(put 'dired-find-alternate-file 'disabled nil)





;; Show the current directory in the mode-line
;;(defun add-mode-line-dirtrack ()
;;  (add-to-list 'mode-line-buffer-identification
;;               '(:propertize (" " default-directory " ") face dired-directory)))
;;(add-hook 'shell-mode-hook 'add-mode-line-dirtrack)

;; Show file path in the mode-line -- don't work ??
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)


;; But this work: show file path in the mode-line and dired
(setq-default mode-line-buffer-identification
	      (list 'buffer-file-name
		    (propertized-buffer-identification "%12f")
		    (propertized-buffer-identification "%12b")))
(add-hook 'dired-mode-hook
	  (lambda ()
	    ;; TODO: handle (DIRECTORY FILE ...) list value for dired-directory
	    (setq mode-line-buffer-identification
		  ;; emulate "%17b" (see dired-mode):
		  '(:eval
		    (propertized-buffer-identification
		     (if (< (length default-directory) 17)
			 (concat default-directory
				 (make-string (- 17 (length default-directory))
					      ?\s))
		       default-directory))))))


;; Show file path in the title
(setq frame-title-format
      '((buffer-file-name "%f" (dired-directory dired-directory "%b")) " - "
	invocation-name "@" system-name))



(defun yes-or-no-p (prompt)
  "Заменил на y-or-n-p (fun)"
  (y-or-n-p prompt))


;----------------------------------------------------------------------------------------
; dired stuff
(defun dired-do-shell-command-in-background (command)
  "In dired, do shell command in background on the file or directory named on this line."
  (interactive
   (list (dired-read-shell-command
	  (concat "& on " "%s: ") nil (list (dired-get-filename)))))
  (call-process command nil 0 nil (dired-get-filename)))

(add-hook 'dired-load-hook
	  (function (lambda ()
		      (load "dired-x")
		      ;; Set global variables here.  For example:
		      ;; (setq dired-guess-shell-gnutar "gtar")
		      (define-key dired-mode-map "&"
			'dired-do-shell-command-in-background))))


(add-hook 'dired-mode-hook
	  (function (lambda ()
		      ;; Set buffer-local variables here.  For example:
		      ;; (dired-omit-mode 1)
		      )))

(eval-after-load "dired-aux"
  '(add-to-list 'dired-compress-file-suffixes
		'("\\.zip\\'" ".zip" "unzip")))

;; key bindings for find-file-at-point family
;; instead of standard ones
(ffap-bindings)

;; "M-x package-install", "clang-format"
;;(add-hook 'c-mode-common-hook
;;          (function (lambda ()
;;                    (add-hook 'before-save-hook
;;                              'clang-format-buffer))))


;; LLVM stuff
(setq load-path
      (cons (expand-file-name "/home/aaa-sc/llvm/llvm-project/llvm/utils/emacs") load-path))
(require 'llvm-mode)
(require 'tablegen-mode)
