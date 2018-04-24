;;;
;;; NO SPLASH

(setq inhibit-startup-message t)

;;;
;;; SCROLL

(defun up-slightly () (interactive) (scroll-up 5))
(defun down-slightly () (interactive) (scroll-down 5))
(global-set-key [mouse-4] 'down-slightly)
(global-set-key [mouse-5] 'up-slightly)

(defun up-one () (interactive) (scroll-up 1))
(defun down-one () (interactive) (scroll-down 1))
(global-set-key [S-mouse-4] 'down-one)
(global-set-key [S-mouse-5] 'up-one)


(defun up-a-lot () (interactive) (scroll-up))
(defun down-a-lot () (interactive) (scroll-down))
(global-set-key [C-mouse-4] 'down-a-lot)
(global-set-key [C-mouse-5] 'up-a-lot)

;;;
;;; COLOR & POSITION

;; font
;(create-fontset-from-fontset-spec "-*-lucidatypewriter-*-*-*-*-14-*-*-*-*-*-fontset-lucida14,
;                                  ascii:-*-lucidatypewriter-medium-*-*-*-14-*-*-*-*-*-*-*,
;                                  korean-ksc5601:-*-gothic-medium-*-*-*-14-*-*-*-*-*-ksc5601.1987-*")
;
;(set-face-font 'default "fontset-lucida14")

;; frame
(setq initial-frame-alist '(;(top . 150) (left . 300)
                           (width . 80) (height . 75)))

(setq default-frame-alist
      '(;(top . 70)
        ;(left . 400)
        (width . 110)
        (height . 75)
        (cursor-color . "yellow")
        (cursor-type . box)
;        (font . "fixed")
;        (font . "lucidasanstypewriter-10")
        (foreground-color . "white")
        (background-color . "black")))

;(set-foreground-color "white")
;(set-background-color "black")
(set-face-foreground 'region "black")
(set-face-background 'region "lightsteelblue")
(set-face-foreground 'modeline "black")
(set-face-background 'modeline "lightsteelblue")
(set-cursor-color "wheat")
;(set-face-foreground 'font-lock-comment-face "dark gray")

(setq blink-matching-delay 0.1)
(setq standard-indent 4)
(setq scroll-step 1)

;;;
;;; TAB

;;(setq default-tab-width 4)
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100))
(setq-default indent-tabs-mode nil) ; use space instead of tab

;;;
;;; EDITING

(setq kill-whole-line t)
(delete-selection-mode t)

;;;
;;; LINE WRAP

; will trucate lines if they are too long.
;(setq-default truncate-lines t)

; will trucate even when screen is split into multiple windows.
;(setq-default truncate-partial-width-windows t)

;;;
;;; MAC

(when (string-equal "mac" window-system)
  (setq mac-command-key-is-meta nil)
  (setq mac-option-modifier 'meta)
  (setq mac-command-modifier nil)
  (setq mac-allow-anti-aliasing nil)
  )

;;;
;;; DISPLAY

(setq font-lock-maximum-decoration t)
;(setq-default show-trailing-whitespace t)

(global-font-lock-mode t)
(transient-mark-mode t)
(show-paren-mode t)

(column-number-mode t)

(when (> emacs-major-version 20)
  (tool-bar-mode nil)
  )

(unless (string-equal "mac" window-system)
  (menu-bar-mode nil)
  )

(set-specifier menubar-visible-p nil)
(set-menubar)
(set-menu-bar)
(set-toolbar)
(set-tool-bar)
(menubar-mode)
(menu-bar-mode nil)
(toolbar-mode)
(tool-bar-mode)
(display-graphic-p)

;; disable the display of scroll bars
; (scroll-bar-mode -1)

;; replace 'right with 'left to place it to the left
(set-scroll-bar-mode 'right)

;;;
;;; Selection Mode

(pc-selection-mode)
(pc-bindings-mode)

;;;
;;; ISEARCH MODE HOOK

(defun my-isearch-toggle-word ()
  "Toggle word searching on or off."
  (interactive)
  (setq isearch-word (not isearch-word))
  (setq isearch-success t isearch-adjusted t)
  ;; Work-around for isearch lazy highlight routine does not check word mode change
  ;(setq isearch-lazy-highlight-last-string "")
  (isearch-update)
  )

(defun my-isearch-mode-hook ()
  (define-key isearch-mode-map "\M-w" 'my-isearch-toggle-word)
  )
(add-hook 'isearch-mode-hook 'my-isearch-mode-hook)

;;;
;;; SHELL MODE HOOK

(defun my-shell-mode-hook ()
  (ansi-color-for-comint-mode-on)
  (setq show-trailing-whitespace nil)
  (setq comint-scroll-to-bottom-on-input t)
  (setq comint-input-ignoredups t)
  )

(add-hook 'shell-mode-hook 'my-shell-mode-hook)

(add-hook 'shell-mode-hook
          '(lambda ()
             (local-set-key [home]        ; move to beginning of line, after prompt
                            'comint-bol)
             (local-set-key [up]          ; cycle backward through command history
                            '(lambda () (interactive)
                               (if (comint-after-pmark-p)
                                 (comint-previous-input 1)
                                 (previous-line 1))))
             (local-set-key [down]        ; cycle forward through command history
                            '(lambda () (interactive)
                               (if (comint-after-pmark-p)
                                 (comint-next-input 1)
                                 (forward-line 1))))
             ))

;; alias로 cd 이동하더라도 디렉토리가 변경되도록 함
(defun track-shell-directory/procfs ()
  (shell-dirtrack-mode 0)
  (add-hook 'comint-preoutput-filter-functions
                        (lambda (str)
                          (prog1 str
                                (when (string-match comint-prompt-regexp str)
                                  (cd (file-symlink-p
                                                (format "/proc/%s/cwd" (process-id
                                                                                                 (get-buffer-process
                                                                                                   (current-buffer)))))))))
                        nil t))

(add-hook 'shell-mode-hook 'track-shell-directory/procfs)

;; to turn off word wrap and to make the prompt read-only
;(add-hook 'shell-mode-hook '(lambda () (toggle-truncate-lines 1)))
(setq comint-prompt-read-only t)

;; ls 색을 바꾸고 싶으면 ~/.emacs 파일에 아래 내용을 추가한다.
;; 맨 처음부터 [ 일반, 압축, 실행, ?, 디렉토리, ?, 링크, ? ] 순서다.
(setq-default ansi-color-names-vector ["black" "red" "green" "yellow" "CornflowerBlue" "magenta" "cyan" "white" ] )

;; set maximum-buffer size for shell-mode
;; (useful if some program that you're debugging spews out large amounts of output).
;(setq comint-buffer-maximum-size 10240)

;; unicode shell
(defun unicode-shell ()
  "Execute the shell buffer in UTF-8 encoding.
  Note that you'll need to set the environment variable LANG and others
  appropriately."
  (interactive)
  (let ((coding-system-for-read 'utf-8)
        (coding-system-for-write 'utf-8)
        (coding-system-require-warning t))
    (call-interactively 'shell)))

;;;
;;; TEXT MODE HOOK

(defun my-text-mode-hook ()
  (define-key text-mode-map "\t" 'tab-to-tab-stop)
  )
(add-hook 'text-mode-hook 'my-text-mode-hook)

;;;
;;; C MODE HOOK

(defun my-c-mode-common-hook ()
  (c-set-style "stroustrup")
  (c-set-offset 'case-label '+)
  (c-set-offset 'statement-case-open '+)
  (c-set-offset 'inline-open 0)
  (set-variable 'c-backslash-max-column 100)
  (define-key c-mode-base-map "\C-m" 'c-context-line-break)
  (define-key c-mode-base-map "\C-c\C-c" 'comment-or-uncomment-region)
  )
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;;;
;;; AUTO MODE

(setq auto-mode-alist (append '(("\.outline$" . outline-mode)) auto-mode-alist))

(cond
 ((string-match "darwin" system-configuration)
  (progn
    (setq auto-mode-alist (append '(("\.h$" . objc-mode)) auto-mode-alist))
    ))
 (t
  (progn
    (setq auto-mode-alist (append '(("\.h$" . c++-mode)) auto-mode-alist))
    (setq auto-mode-alist (append '(("\.lst$" . sql-mode)) auto-mode-alist))
    (setq auto-mode-alist (append '(("\.out$" . sql-mode)) auto-mode-alist))
    (setq auto-mode-alist (append '(("\.i$" . c++-mode)) auto-mode-alist))
    (setq auto-mode-alist (append '(("\.l$" . c++-mode)) auto-mode-alist))
    (setq auto-mode-alist (append '(("\.y$" . c++-mode)) auto-mode-alist))
    (setq auto-mode-alist (append '(("\.sc$" . c++-mode)) auto-mode-alist))
    (setq auto-mode-alist (append '(("\.sql$" . sql-mode)) auto-mode-alist))
    (setq auto-mode-alist (append '(("\.sh$" . shell-script-mode)) auto-mode-alist))
    ))
 )

;;;
;;; DISABLE RING BELL

(defun my-dummy-ring-bell-function () nil)
(setq ring-bell-function 'my-dummy-ring-bell-function)

;;;
;;; HANGUL

;;(setq default-korean-keyboard "2")
(set-language-environment 'korean)

;; 나중에 쓴 것이 우선 순위 높음
(prefer-coding-system 'cp949)
(prefer-coding-system 'utf-8)

;;;
;;; CODING SYSTEM

(set-default-coding-systems 'euc-kr-unix)
(set-buffer-file-coding-system 'euc-kr-unix)
(set-clipboard-coding-system 'x-ctext)
;;(set-selection-coding-system 'euc-kr-unix)

(set-keyboard-coding-system 'euc-kr-unix)

(when (string-match "darwin" system-configuration)
  (set-file-name-coding-system 'euc-kr-unix)
  (set-terminal-coding-system 'euc-kr-unix)
  ;;(require 'mac-utf)
  )

;;;
;;; GREP

(setq-default grep-command "grep -rn ")
(setq grep-highlight-matches t)

;;;
;;; COMPILE

(setq-default compile-command "make -k ")
(setq compile-highlight-matches t)

;;;
;;; GUD

;; emacs21에서는 지원되지 않는다.
;(setq gdb-many-windows t)

;; toggle gdb-many-windows
(defun gdb-many-windows-toggle-switch ()
  (interactive)
  (if gdb-many-windows
    (setq gdb-many-windows nil)
    (setq gdb-many-windows t))
  (gdb-restore-windows) )

(global-set-key [(control x)(control a)(*)] 'gdb-many-windows-toggle-switch)

(add-hook 'gud-mode-hook
          '(lambda ()
             (local-set-key [home]        ; move to beginning of line, after prompt
                            'comint-bol)
             (local-set-key [up]          ; cycle backward through command history
                            '(lambda () (interactive)
                               (if (comint-after-pmark-p)
                                 (comint-previous-input 1)
                                 (previous-line 1))))
             (local-set-key [down]        ; cycle forward through command history
                            '(lambda () (interactive)
                               (if (comint-after-pmark-p)
                                 (comint-next-input 1)
                                 (forward-line 1))))
             ))

;;;
;;; GLOBAL KEY MAP

(define-key global-map [C-f1] 'man)
(define-key global-map [f2] 'grep)
(define-key global-map [f4] 'query-replace)
(define-key global-map [f4] 'make-frame-command)
(define-key global-map [f5] 'goto-line)
(define-key global-map [f6] 'other-window)
(define-key global-map [f7] 'previous-error)    ; (C-x `)
(define-key global-map [f8] 'next-error)                ; (C-x `)

;(define-key global-map [f9] 'call-last-kbd-macro)      ; macro
;(define-key global-map [C-f10] 'compile)
;(define-key global-map [f10] 'shell)
(define-key global-map [f9] 'split-window-vertically)
(define-key global-map [f10] 'split-window-horizontally)
(define-key global-map [f11] 'make-frame-command)

(define-key global-map [f12] 'delete-other-windows)
;(define-key global-map [C-f12] 'indent-region)

(when (< emacs-major-version 22)
  (define-key global-map "\M-g\M-g" 'goto-line)
  )

; Make Emacs use "newline-and-indent" when you hit the Enter key so
; that you don't need to keep using TAB to align yourself when coding.
;(global-set-key "\C-m"        'newline-and-indent)

(global-set-key "\C-x\C-b" 'electric-buffer-list)

(global-set-key "\C-cc" 'compile)               ; M-x compile
(global-set-key "\C-cd" 'shell)                 ; M-x shell
(global-set-key "\C-cl" 'goto-line)
(global-set-key [C-tab] 'other-window)          ; C-x o
(global-set-key [24 C-tab] 'other-frame)        ; C-x C-tab is now the
                                                ; same as `C-x 5 o'
(global-set-key [?\C-.] 'find-tag-other-window) ; C-x o
(global-set-key "\C-cl" 'goto-line)

(fset 'find-next-tag "\C-u\256")        ; macro for C-u M-.  (fset 'find-prev-tag "\C-u-\256")
(global-set-key "\M-]" 'find-next-tag)
(global-set-key "\M-[" 'find-prev-tag)


;;; =============================================================
;;; Private Settting and Customization
;;; =============================================================
;; To see available colors, run `M-x list-colors-dislay'

;;;
;;; linum
;;;
;;; you need to install linum.el
;;;
;(require 'linum)
;(global-linum-mode)

;;;
;;; ido
;;;
;;; you need to install ido.el
;;;
(when (require 'ido "ido" t)
  (ido-mode 'buffer)
  (setq ido-enable-flex-matching t)
;  (ido-mode t))
)

(global-set-key "\C-xb" 'ido-switch-buffer)



(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
)

;(define-key ecb-mode-map (kbd "M-1") 'ecb-goto-window-directories)
;(define-key ecb-mode-map (kbd "M-2") 'ecb-goto-window-sources)
;(define-key ecb-mode-map (kbd "M-3") 'ecb-goto-window-methods)
;(define-key ecb-mode-map (kbd "M-4") 'ecb-goto-window-history)
;(define-key ecb-mode-map (kbd "M-5") 'ecb-goto-window-compilation)
;(define-key ecb-mode-map (kbd "M-0") 'ecb-goto-window-edit1)

;; 윈도스럽게, 왼쪽버튼과 오른쪽 버튼을 쓰는게 편하다.
;(setq ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))

;; auto ecb mode
;(setq ecb-auto-activate 'true)


;;;
;;; cscope
;;;
;;; You need to install cscope(1) and xcscope.el to use below bindings
;;; Read xcscope.el packaged in cscope source tarball. It can be obtained
;;; from http://cscope.sourceforge.net/
;;;
(require 'xcscope)

(define-key global-map [(control f3)]  'cscope-set-initial-directory)
(define-key global-map [(control f4)]  'cscope-unset-initial-directory)
(define-key global-map [(control f5)]  'cscope-find-this-symbol)
(define-key global-map [(control f6)]  'cscope-find-global-definition)
(define-key global-map [(control f7)]  'cscope-find-global-definition-no-prompting)
(define-key global-map [(control f8)]  'cscope-pop-mark)
(define-key global-map [(control f9)]  'cscope-next-symbol)
(define-key global-map [(control f10)] 'cscope-next-file)
(define-key global-map [(control f11)] 'cscope-prev-symbol)
(define-key global-map [(control f12)] 'cscope-prev-file)
(define-key global-map [(meta f11)]    'cscope-display-buffer)
(define-key global-map [(meta f12)]    'cscope-display-buffer-toggle)

;; 매번 업데이트해서 느린 문제 해결, 처음에만 파일 업데이트
(setq cscope-do-not-update-database t)

;;;
;;; etc
;;;

;; copy text to another program
(setq x-select-enable-clipboard t)

(iswitchb-mode)
(icomplete-mode)
;(speedbar)

;; display function name in mode line
(which-function-mode)

;; will allow you to type just "y" instead of "yes" when you exit
(fset 'yes-or-no-p 'y-or-n-p)

;; Easier Transition between Windows
;; M-up, M-down, M-left, and M-right keys.
(windmove-default-keybindings 'meta)

;; will delete "hungrily" in C mode! Use it to see what it does -- very useful.
;(setq c-hungry-delete-key t)

(put 'upcase-region 'disabled nil)

;; CWarn mode
(global-cwarn-mode 1)

;; line number at infor bar
(setq line-number-mode t)

;; 파일 변경되면 다시 읽게 하는 옵션
(global-auto-revert-mode t)

