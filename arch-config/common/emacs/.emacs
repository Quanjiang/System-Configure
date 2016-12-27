
;;定义变量  
;(defconst my-projects-path "C:\WINCE600\PLATFORM\BSP_DP\SRC" "My projects dir") 
;;定义函数  
;(defun goto-my-projects-dir ()  
;  (interactive)  
;  (dired my-projects-path))  
;;定义快捷键  
;(define-key-list  
;  global-map  
;  `(("C-x G p" goto-my-projects-dir))))   

(set-language-environment 'Chinese-GB)
(setq-default pathname-coding-system 'euc-cn)
(setq file-name-coding-system 'euc-cn)




;(setq default-directory "C:/WINCE600/PLATFORM/BSP_DP/SRC") 
(setq default-directory "~/mywork")
;; C-SPACE 被输入法占用，C-@ 又太难按，于是把 set mark 绑定到 C-return
(define-key global-map [C-return] 'set-mark-command)
(global-set-key (kbd "C-M-x") 'kill-buffer-and-window);;关闭buffer快捷建
(delete-selection-mode 1);;选择后 可以直接删除



;;=============================================================================
;;; Emacs is not a package manager, and here we load its package manager!
(add-to-list 'load-path "~/.emacs.d/packages/")
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(require 'package)
(dolist (source '(("marmalade" . "http://marmalade-repo.org/packages/")
                  ("elpa" . "http://tromey.com/elpa/")
                  ;; TODO: Maybe, use this after emacs24 is released
                  ;; (development versions of packages)
                  ("melpa" . "http://melpa.milkbox.net/packages/")
                  ))
  (add-to-list 'package-archives source t))
(package-initialize)
;;; Required packages
;;; everytime emacs starts, it will automatically check if those packages are
;;; missing, it will install them automatically
(when (not package-archive-contents)
  (package-refresh-contents))
(defvar tmtxt/packages
  '(php-mode geben xcscope psvn lineno maxframe color-theme ecb autopair auto-complete auto-complete-clang member-function yasnippet))
(dolist (p tmtxt/packages)
  (when (not (package-installed-p p))
    (package-install p)))
;;=============================================================================
(setq column-number-mode t) ;;; 显示列号
(setq frame-title-format "%f")

;;=============================================================================
;;;svn support
;; (require 'psvn)
;;;emacs color theme
(require 'color-theme)
(color-theme-initialize)
(color-theme-calm-forest)
;;=============================================================================

;;=============================================================================
; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
(display-time-mode t);显示当前时间
(setq inhibit-startup-message t);;禁用启动信息
(show-paren-mode t);显示与当前光标所在位置的括号匹配的另一个括号
(setq visible-bell t);关闭出错时的蜂鸣提示声
;(mouse-avoidance-mode'animate);当鼠标箭头与光标相近时，使鼠标箭头自动移开
(blink-cursor-mode nil);光标不闪烁
;(setq-default cursor-type 'bar);光标显示为一竖线
(tool-bar-mode -1);; 不显示emcas的工具栏
(menu-bar-mode -1);; 不显示emcas的菜单栏,按ctrl+鼠标右键仍能调出该菜单
(setq x-select-enable-clipboard t);; 支持emacs和外部程序之间进行粘贴
(fset 'yes-or-no-p 'y-or-n-p);以 'y/n'字样代替原默认的'yes/no'字样
(setq frame-title-format "%b@Studentol's emacs");在最上方的标题栏显示当前buffer的名字
(setq make-backup-files nil);关闭自动备份功能
(setq auto-save-mode nil);关闭自动保存模式
(setq auto-save-default nil);不生成名为#filename# 的临时文件
;(setq require-final-newline t);; 自动的在当前的buffer文件的最后加一个空行
0;(global-set-key "\r" 'align-newline-and-indent);;自动缩进变为
(setq default-fill-column 110);设置默认的列数是110
(setq kill-ring-max 200);;设置kill-ring-max(我不知道怎么翻译这个词：)为200，以防不测：）
(setq default-major-mode 'text-mode);;设置缺省模式是text，而不是基本模式
;;设置tab为4个空格的宽度，而不是原来的2
;(setq default-tab-width 4)
;;;;;;;;;;;;;;;;;启动时最大化;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)
;下载maxframe.el并放置在中
;http://emacsblog.org/2007/02/22/maximize-on-startup-part-2/
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;web方式显示行号;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(set-scroll-bar-mode 'right);滚动条在右侧
(set-scroll-bar-mode nil)   ; 不显示滚动条, even in x-window system (recommended)
(require 'linum)
(global-linum-mode 1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (defun remove-dos-eol ()
;;   "Do not show ^M in files containing mixed UNIX and DOS line endings."
;;   (interactive)
;;   (setq buffer-display-table (make-display-table))
;;   (aset buffer-display-table ?\^M []))
(defun dos2unix ()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
    (goto-char (point-min))
      (while (search-forward "\r" nil t) (replace-match "")))
(global-set-key (kbd "C-M-m") 'dos2unix)

;;=============================================================================

;;============================================================================




;;=============================================================================
;;;c/c++ mode open

(require 'cc-mode)
(setq-default c-basic-offset 4 c-default-style "linux")
;(c-set-style "K&R")
(setq c-basic-offset 8)
(setq-default tab-width 8 indent-tabs-mode t)
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)
;;; autopair for add the closing bracket
(require 'autopair)
(autopair-global-mode 1)
(setq autopair-autowrap t)
;;; ECB
;;; activate ecb
(require 'ecb)
(require 'ecb-autoloads)
(setq ecb-layout-name "leftright2")
(setq ecb-show-sources-in-directories-buffer 'always)
(setq ecb-compile-window-height 12)
;;; activate and deactivate ecb
(global-set-key (kbd "C-x C-;") 'ecb-activate)
(global-set-key (kbd "C-x C-'") 'ecb-deactivate)
;;; show/hide ecb window
(global-set-key (kbd "C-;") 'ecb-show-ecb-windows)
(global-set-key (kbd "C-'") 'ecb-hide-ecb-windows)
;;; quick navigation between ecb windows
(global-set-key (kbd "C-`") 'ecb-goto-window-edit1)
(global-set-key (kbd "C-!") 'ecb-goto-window-directories)
(global-set-key (kbd "C-@") 'ecb-goto-window-sources)
(global-set-key (kbd "C-#") 'ecb-goto-window-methods)
(global-set-key (kbd "C-$") 'ecb-goto-window-compilation)
(global-set-key (kbd "C-%") 'ecb-goto-window-history)

;;; replacement for built-in ecb-deactive, ecb-hide-ecb-windows and
;;; ecb-show-ecb-windows functions
;;; since they hide/deactive ecb but not restore the old windows for me
(defun tmtxt/ecb-deactivate ()
  "deactive ecb and then split emacs into 2 windows that contain 2 most recent buffers"
  (interactive)
  (ecb-deactivate)
  (split-window-right)
  (switch-to-next-buffer)
  (other-window 1))
(defun tmtxt/ecb-hide-ecb-windows ()
  "hide ecb and then split emacs into 2 windows that contain 2 most recent buffers"
  (interactive)
  (ecb-hide-ecb-windows)
  (split-window-right)
  (switch-to-next-buffer)
  (other-window 1))
(defun tmtxt/ecb-show-ecb-windows ()
  "show ecb windows and then delete all other windows except the current one"
  (interactive)
  (ecb-show-ecb-windows)
  (delete-other-windows))

(global-set-key (kbd "C-x C-'") 'tmtxt/ecb-deactivate)
(global-set-key (kbd "C-;") 'tmtxt/ecb-show-ecb-windows)
(global-set-key (kbd "C-'") 'tmtxt/ecb-hide-ecb-windows)
;;;========================================ECB End==================================

;;=============================================================================
;; yasnippet
;;; should be loaded before auto complete so that they can work together
(require 'yasnippet)
(yas-global-mode 1)

;;; auto complete mod
;;; should be loaded after yasnippet so that they can work together
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
;;; set the trigger key so that it can work together with yasnippet on tab key,
;;; if the word exists in yasnippet, pressing tab will cause yasnippet to
;;; activate, otherwise, auto-complete will
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")

(require 'auto-complete-clang)
(define-key c++-mode-map (kbd "C-S-<return>") 'ac-complete-clang)
;; replace C-S-<return> with a key binding that you want

(setq ecb-fix-window-size t)

(require 'member-function)
(setq mf--source-file-extension "cpp")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-layout-window-sizes (quote (("leftright2" (ecb-directories-buffer-name 0.1631578947368421 . 0.4864864864864865) (ecb-sources-buffer-name 0.1631578947368421 . 0.43243243243243246) (ecb-methods-buffer-name 0.14736842105263157 . 0.4864864864864865) (ecb-history-buffer-name 0.14736842105263157 . 0.43243243243243246) ))))
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; cscope 移动位置
;; (ecb-layout-define "my-cscope-layout" left nil
;;                    (ecb-set-methods-buffer)
;;                    (ecb-split-ver 0.5 t)
;;                    (other-window 1)
;;                    (ecb-set-history-buffer)
;;                    (ecb-split-ver 0.25 t)
;;                    (other-window 1)
;;                    (ecb-set-cscope-buffer))

;; (defconst ecb-examples-action-buffer-name "*cscope*")
;; (defun ecb-examples-action-buffer-create ()
;;      (save-excursion
;;        (if (get-buffer ecb-examples-action-buffer-name)
;;            (get-buffer ecb-examples-action-buffer-name)
   
;;          (set-buffer (get-buffer-create
;;                        ecb-examples-action-buffer-name))
;;          (current-buffer))))


;; (defecb-window-dedicator-to-ecb-buffer ecb-set-cscope-buffer
;;        ecb-examples-action-buffer-name nil
;;      "Set the buffer in the current window to the action-buffer
;;    and make this window dedicated for this buffer."
;;      (switch-to-buffer (ecb-examples-action-buffer-create)))

;; (setq ecb-layout-name "my-cscope-layout")

;; ;; Disable buckets so that history buffer can display more entries
;; (setq ecb-history-make-buckets 'never)

;;cscope
(require 'xcscope)
(define-key global-map [(ctrl f3)] 'cscope-set-initial-directory)
(define-key global-map [(ctrl f4)] 'cscope-unset-initial-directory)
;(define-key global-map [(ctrl f5)] 'cscope-prev-file)
;(define-key global-map [(ctrl f6)] 'cscope-find-global-definition)
(define-key global-map (kbd "C-x 9")
'cscope-find-global-definition-no-prompting)
;(define-key global-map [(ctrl f8)] 'cscope-pop-mark)
;(define-key global-map [(ctrl f9)] 'cscope-next-symbol)
;(define-key global-map [(ctrl f10)] 'cscope-next-file)
;(define-key global-map [(ctrl f11)] 'cscope-prev-symbol)
(define-key global-map [(ctrl f10)] 'cscope-find-global-definition)
(define-key global-map [(ctrl f11)] 'cscope-find-this-file)
(define-key global-map [(ctrl f12)] 'cscope-find-this-symbol)
;(define-key global-map [(meta f9)] 'cscope-display-buffer)
;(define-key global-map [(meta f10)] 'cscope-display-buffer-toggle)

;(setenv "MITSCHEME_LIBRARY_PATH" "YOUR_MITSCHEME_INSTALL_PATH/lib") 
;; 加载辅助程序
;(if (eq system-type 'windows-nt)
;	(progn 
;	  (setenv "PATH" (concat (concat my-emacs-bin-path "win32")
;							 path-separator
;							 (getenv "PATH")))
;	  (add-to-list 'exec-path (concat my-emacs-bin-path "win32"))))


;;加强注释 自动判定注释当前行
(defun qiang-comment-dwim-line (&optional arg)
  "Replacement for the comment-dwim command. If no region is selected and current line is not blank and we are not at the end of the line, then comment current line. Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))
(global-set-key "\M-;" 'qiang-comment-dwim-line) 

;; Smart copy, if no region active, it simply copy the current whole line
(defadvice kill-line (before check-position activate)
  (if (member major-mode
              '(emacs-lisp-mode scheme-mode lisp-mode
                                c-mode c++-mode objc-mode js-mode
                                latex-mode plain-tex-mode))
      (if (and (eolp) (not (bolp)))
          (progn (forward-char 1)
                 (just-one-space 0)
                 (backward-char 1)))))
 
(defadvice kill-ring-save (before slick-copy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive (if mark-active (list (region-beginning) (region-end))
                 (message "Copied line")
                 (list (line-beginning-position)
                       (line-beginning-position 2)))))
 
(defadvice kill-region (before slick-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))
 
;; Copy line from point to the end, exclude the line break
(defun qiang-copy-line (arg)
  "Copy lines (as many as prefix argument) in the kill ring"
  (interactive "p")
  (kill-ring-save (point)
                  (line-end-position))
                  ;; (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))
 
(global-set-key (kbd "M-k") 'qiang-copy-line)


;; 设置 calendar 的显示
;; (setq calendar-remove-frame-by-deleting t)
;; (setq calendar-week-start-day 1);; 设置星期一为每周的第一天
;; (setq mark-diary-entries-in-calendar t);; 标记calendar上有diary的日期
;; (setq mark-holidays-in-calendar nil); ; 为了突出有diary的日期，calendar上不标记节日
;; (setq view-calendar-holidays-initially nil) ; 打开calendar的时候不显示一堆节日
;; ;; 去掉不关心的节日，设定自己在意的节日，在 calendar 上用 h 显示节日
;; (setq christian-holidays nil)
;; (setq hebrew-holidays nil)
;; (setq islamic-holidays nil)
;; (setq solar-holidays nil)
;;Calendar模式支持各种方式来更改当前日期
;;（这里的“前”是指还没有到来的那一天，“后”是指已经过去的日子）
;;  q      退出calendar模式
;; C-f     让当前日期向前一天
;; C-b     让当前日期向后一天
;; C-n     让当前日期向前一周
;; C-p     让当前日期向后一周
;; M-}     让当前日期向前一个月
;; M-{     让当前日期向后一个月
;; C-x ]   让当前日期向前一年
;; C-x [   让当前日期向后一年
;; C-a     移动到当前周的第一天
;; C-e     移动到当前周的最后一天
;; M-a     移动到当前月的第一天
;; M-e     多动到当前月的最后一天
;; M-<     移动到当前年的第一天
;; M->     移动到当前年的最后一天
;;Calendar模式支持移动多种移动到特珠日期的方式
;; g d     移动到一个特别的日期
;;  o      使某个特殊的月分作为中间的月分
;;  .      移动到当天的日期
;; p d     显示某一天在一年中的位置，也显示本年度还有多少天。
;; C-c C-l 刷新Calendar窗口
;; Calendar支持生成LATEX代码。
;; t m     按月生成日历
;; t M     按月生成一个美化的日历
;; t d     按当天日期生成一个当天日历
;; t w 1   在一页上生成这个周的日历
;; t w 2   在两页上生成这个周的日历
;; t w 3   生成一个ISO-SYTLE风格的当前周日历
;; t w 4   生成一个从周一开始的当前周日历
;; t y     生成当前年的日历
;;EMACS Calendar支持配置节日：
;; h       显示当前的节日
;; x       定义当天为某个节日
;; u       取消当天已被定义的节日
;; e       显示所有这前后共三个月的节日。
;; M-x holiday  在另外的窗口的显示这前后三个月的节日。
 
;; 另外，还有一些特殊的，有意思的命令：
;; S       显示当天的日出日落时间(是大写的S)
;; p C     显示农历可以使用
;; g C     使用农历移动日期可以使用
;; 实现程序变量得自动对齐
(require 'align)
(global-set-key "\C-x\C-j" 'align)
 
;鼠标滚轮，默认的滚动太快，这里改为1行
(defun up-slightly () (interactive) (scroll-up 1))
(defun down-slightly () (interactive) (scroll-down 1))
(global-set-key [mouse-4] 'down-slightly)
(global-set-key [mouse-5] 'up-slightly)
(add-to-list 'load-path "/usr/share/emacs/site-lisp/xcscope.el")
(require 'xcscope)
;;;;;;;;;;;;;;;;;;可视化书签;;;;;;;;;;;;;;;;;;;;;;;;;;
;(enable-visual-studio-bookmarks)
;;;;;h/cpp切换;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'eassist nil 'noerror)
(define-key c-mode-base-map [M-f12] 'eassist-switch-h-cpp)
(setq eassist-header-switches
      '(("h" . ("cpp" "cxx" "c++" "CC" "cc" "C" "c" "mm" "m"))
        ("hh" . ("cc" "CC" "cpp" "cxx" "c++" "C"))
        ("hpp" . ("cpp" "cxx" "c++" "cc" "CC" "C"))
        ("hxx" . ("cxx" "cpp" "c++" "cc" "CC" "C"))
        ("h++" . ("c++" "cpp" "cxx" "cc" "CC" "C"))
        ("H" . ("C" "CC" "cc" "cpp" "cxx" "c++" "mm" "m"))
        ("HH" . ("CC" "cc" "C" "cpp" "cxx" "c++"))
        ("cpp" . ("hpp" "hxx" "h++" "HH" "hh" "H" "h"))
        ("cxx" . ("hxx" "hpp" "h++" "HH" "hh" "H" "h"))
        ("c++" . ("h++" "hpp" "hxx" "HH" "hh" "H" "h"))
        ("CC" . ("HH" "hh" "hpp" "hxx" "h++" "H" "h"))
        ("cc" . ("hh" "HH" "hpp" "hxx" "h++" "H" "h"))
        ("C" . ("hpp" "hxx" "h++" "HH" "hh" "H" "h"))
        ("c" . ("h"))
        ("m" . ("h"))
        ("mm" . ("h"))))
;;用下面的办法对于编写 python, bash, per, awk, sed, 脚本的时候十分有用。在保存文件的时候，会自动给脚本增加可执行权限
(setq my-shebang-patterns
      (list "^#!/usr/.*/perl\\(\\( \\)\\|\\( .+ \\)\\)-w *.*"
        "^#!/usr/.*/sh"
        "^#!/usr/.*/bash"
        "^#!/bin/sh"
        "^#!/.*/perl"
        "^#!/.*/awk"
        "^#!/.*/sed"
        "^#!/bin/bash"))
(add-hook
 'after-save-hook
 (lambda ()
 (if (not (= (shell-command (concat "test -x " (buffer-file-name))) 0))
     (progn
       ;; This puts message in *Message* twice, but minibuffer
       ;; output looks better.
       (message (concat "Wrote " (buffer-file-name)))
       (save-excursion
         (goto-char (point-min))
         ;; Always checks every pattern even after
         ;; match.  Inefficient but easy.
         (dolist (my-shebang-pat my-shebang-patterns)
           (if (looking-at my-shebang-pat)
               (if (= (shell-command
                       (concat "chmod u+x " (buffer-file-name)))
                      0)
                   (message (concat
                             "Wrote and made executable "
                             (buffer-file-name))))))))
   ;; This puts message in *Message* twice, but minibuffer output
   ;; looks better.
   (message (concat "Wrote " (buffer-file-name))))))
(put 'upcase-region 'disabled nil)

;; ;; -*- Emacs-Lisp -*-
 
;; ;; Time-stamp: <2010-04-09 10:22:51 Friday by ahei>
 
;; (require 'auto-complete)
;; (require 'auto-complete-config)
;; ;(require 'auto-complete-yasnippet)
;; (require 'auto-complete-c)
;; (require 'auto-complete-etags)
;; (require 'auto-complete-extension)
;; (require 'auto-complete-octave)
;; (require 'auto-complete-verilog)
;; (require 'auto-complete+)
;; (require 'util)
 
;; (defun auto-complete-settings ()
;;   "Settings for `auto-complete'."
;;   ;; After do this, isearch any string, M-: (match-data) always
;;   ;; return the list whose elements is integer
;;   (global-auto-complete-mode 1)
 
;;   ;; 不让回车的时候执行`ac-complete', 因为当你输入完一个
;;   ;; 单词的时候, 很有可能补全菜单还在, 这时候你要回车的话,
;;   ;; 必须要干掉补全菜单, 很麻烦, 用M-j来执行`ac-complete'
;;   (apply-define-key
;;    ac-complete-mode-map
;;    `(("<return>"   nil)
;;      ("RET"        nil)
;;      ("M-j"        ac-complete)
;;      ("<C-return>" ac-complete)
;;      ("M-n"        ac-next)
;;      ("M-p"        ac-previous)))
 
;;   (setq ac-dwim t)
;;   (setq ac-candidate-max ac-candidate-menu-height)
 
;;   (set-default 'ac-sources
;;                '(ac-source-semantic
;;                  ac-source-yasnippet
;;                  ac-source-abbrev
;;                  ac-source-words-in-buffer
;;                  ac-source-words-in-all-buffer
;;                  ac-source-imenu
;;                  ac-source-files-in-current-dir
;;                  ac-source-filename))
;;   (setq ac-modes ac+-modes)
 
;;   (dolist (command `(backward-delete-char-untabify delete-backward-char))
;;     (add-to-list 'ac-trigger-commands command))
 
;;   (defun ac-start-use-sources (sources)
;;     (interactive)
;;     (let ((ac-sources sources))
;;       (call-interactively 'ac-start)))
 
;;   (defvar ac-trigger-edit-commands
;;     `(self-insert-command
;;       delete-backward-char
;;       backward-delete-char
;;       backward-delete-char-untabify)
;;     "*Trigger edit commands that specify whether `auto-complete' should start or not when `ac-completing'."))
 
;; (eval-after-load "auto-complete"
;;   '(auto-complete-settings))
 
;; (eval-after-load "cc-mode"
;;   '(progn
;;      (dolist (command `(c-electric-backspace
;;                         c-electric-backspace-kill))
;;        (add-to-list 'ac-trigger-commands command)
;;        (add-to-list 'ac-trigger-edit-commands command))))
 
;; (eval-after-load "autopair"
;;   '(progn
;;      (dolist (command `(autopair-insert-or-skip-quote
;;                         autopair-backspace
;;                         autopair-extra-skip-close-maybe))
;;        (add-to-list 'ac-trigger-commands command))
 
;;      (defun ac-trigger-command-p ()
;;        "Return non-nil if `this-command' is a trigger command."
;;        (or
;;         (and
;;          (memq this-command ac-trigger-commands)
;;          (let* ((autopair-emulation-alist nil)
;;                 (key (this-single-command-keys))
;;                 (beyond-autopair (or (key-binding key)
;;                                      (key-binding (lookup-key local-function-key-map key)))))
;;            (memq beyond-autopair ac-trigger-edit-commands)))
;;         (and ac-completing
;;              (memq this-command ac-trigger-edit-commands))))))
 
;; (defun ac-settings-4-lisp ()
;;   "Auto complete settings for lisp mode."
;;   (setq ac-omni-completion-sources '(("\\<featurep\s+'" ac+-source-elisp-features)
;;                                      ("\\<require\s+'"  ac+-source-elisp-features)
;;                                      ("\\<load\s+\""    ac-source-emacs-lisp-features)))
;;   (ac+-apply-source-elisp-faces)
;;   (setq ac-sources
;;         '(ac-source-yasnippet
;;           ac-source-symbols
;;           ;; ac-source-semantic
;;           ac-source-abbrev
;;           ac-source-words-in-buffer
;;           ac-source-words-in-all-buffer
;;           ;; ac-source-imenu
;;           ac-source-files-in-current-dir
;;           ac-source-filename)))
 
;; (defun ac-settings-4-java ()
;;   (setq ac-omni-completion-sources (list (cons "\\." '(ac-source-semantic))
;;                                          (cons "->" '(ac-source-semantic))))
;;   (setq ac-sources
;;         '(;;ac-source-semantic
;;           ac-source-yasnippet
;;           ac-source-abbrev
;;           ac-source-words-in-buffer
;;           ac-source-words-in-all-buffer
;;           ac-source-files-in-current-dir
;;           ac-source-filename)))
 
;; (defun ac-settings-4-c ()
;;   (setq ac-omni-completion-sources (list (cons "\\." '(ac-source-semantic))
;;                                          (cons "->" '(ac-source-semantic))))
;;   (setq ac-sources
;;         '(ac-source-yasnippet
;;           ac-source-c-keywords
;;           ac-source-abbrev
;;           ac-source-words-in-buffer
;;           ac-source-words-in-all-buffer
;;           ac-source-files-in-current-dir
;;           ac-source-filename)))
 
;; (defun ac-settings-4-cpp ()
;;   (setq ac-omni-completion-sources
;;         (list (cons "\\." '(ac-source-semantic))
;;               (cons "->" '(ac-source-semantic))))
;;   (setq ac-sources
;;         '(ac-source-yasnippet
;;           ac-source-c++-keywords
;;           ac-source-abbrev
;;           ac-source-words-in-buffer
;;           ac-source-words-in-all-buffer
;;           ac-source-files-in-current-dir
;;           ac-source-filename)))
 
;; (defun ac-settings-4-text ()
;;   (setq ac-sources
;;         '(;;ac-source-semantic
;;           ac-source-yasnippet
;;           ac-source-abbrev
;;           ac-source-words-in-buffer
;;           ac-source-words-in-all-buffer
;;           ac-source-imenu)))
 
;; (defun ac-settings-4-eshell ()
;;   (setq ac-sources
;;         '(;;ac-source-semantic
;;           ac-source-yasnippet
;;           ac-source-abbrev
;;           ac-source-words-in-buffer
;;           ac-source-words-in-all-buffer
;;           ac-source-files-in-current-dir
;;           ac-source-filename
;;           ac-source-symbols
;;           ac-source-imenu)))
 
;; (defun ac-settings-4-ruby ()
;;   (require 'rcodetools-settings)
;;   (setq ac-omni-completion-sources
;;         (list (cons "\\." '(ac-source-rcodetools))
;;               (cons "::" '(ac-source-rcodetools)))))
 
;; (defun ac-settings-4-html ()
;;   (setq ac-sources
;;         '(;;ac-source-semantic
;;           ac-source-yasnippet
;;           ac-source-abbrev
;;           ac-source-words-in-buffer
;;           ac-source-words-in-all-buffer
;;           ac-source-files-in-current-dir
;;           ac-source-filename)))
 
;; (defun ac-settings-4-tcl ()
;;   (setq ac-sources
;;         '(;;ac-source-semantic
;;           ac-source-yasnippet
;;           ac-source-abbrev
;;           ac-source-words-in-buffer
;;           ac-source-words-in-all-buffer
;;           ac-source-files-in-current-dir
;;           ac-source-filename)))
 
;; (defun ac-settings-4-awk ()
;;   (setq ac-sources
;;         '(;;ac-source-semantic
;;           ac-source-yasnippet
;;           ac-source-abbrev
;;           ac-source-words-in-buffer
;;           ac-source-words-in-all-buffer
;;           ac-source-files-in-current-dir
;;           ac-source-filename)))
 
;; (am-add-hooks
;;  `(lisp-mode-hook emacs-lisp-mode-hook lisp-interaction-mode-hook
;;                   svn-log-edit-mode-hook change-log-mode-hook)
;;  'ac-settings-4-lisp)
 
;; (apply-args-list-to-fun
;;  (lambda (hook fun)
;;    (am-add-hooks hook fun))
;;  `(('java-mode-hook   'ac-settings-4-java)
;;    ('c-mode-hook      'ac-settings-4-c)
;;    ('c++-mode-hook    'ac-settings-4-cpp)
;;    ('text-mode-hook   'ac-settings-4-text)
;;    ('eshell-mode-hook 'ac-settings-4-eshell)
;;    ('ruby-mode-hook   'ac-settings-4-ruby)
;;    ('html-mode-hook   'ac-settings-4-html)
;;    ('java-mode-hook   'ac-settings-4-java)
;;    ('awk-mode-hook    'ac-settings-4-awk)
;;    ('tcl-mode-hook    'ac-settings-4-tcl)))
 
;; (eal-eval-by-modes
;;  ac-modes
;;  (lambda (mode)
;;    (let ((mode-name (symbol-name mode)))
;;      (when (and (intern-soft mode-name) (intern-soft (concat mode-name "-map")))
;;        (define-key (symbol-value (am-intern mode-name "-map")) (kbd "C-c a") 'ac-start)))))
 
;; (provide 'auto-complete-settings)


;; ;;=============================================================================
;; ;;可以在c++头文件中，将光标放在当前函数行，然后按C-c i在对应的源文件中插入成员函数。
;; ;;支持多层namespace 和 class。不过还不是十分可靠，例如对默认参数值的支持等。
;; (defun cpp-current-scope()
;;   "If the point is in a class/namespace/struct definition, gets the 
;; full scope path. Return nil otherwise."
;;   (interactive)
;;   (let (syntax-list  scope ( classnames ()))
;;     (save-excursion
;;       ;;ensure we aren't in the arguments list
;;       (beginning-of-line)
;;       (c-end-of-statement)
;;       (c-beginning-of-statement-1)
;;       ;;now point is at beginning of the funciton declaration,
;;       ;;call c-guest-basic-syntax to find if the car is inclass or innamespace
;;       (setq syntax-list (c-guess-basic-syntax))

;;       ;;expected format ' ( (inclass 12) | (innamespace 22)  ...))
;;       (while (or (eq 'inclass (car (car syntax-list)))
;;                  (eq 'innamespace (car (car syntax-list))))

;;         ;; find outside the class / namespace name
;;         (goto-char (elt (car syntax-list) 1))
;;         (backward-word)
;;         (setq classnames (cons (current-word) classnames))

;;         ;;while loop, check outside scope again
;;         (setq syntax-list (c-guess-basic-syntax)))

;;       ;;concat the scope list like ns1::ns2::class1::
;;       (dolist (e classnames scope)
;;         (setq scope (concat scope e "::"))))))

;; (defun cpp-current-function()
;;   "check current line functon declaration, return a list, the 0th is the 
;; rettype, 1st is function name,
;; 2th is the arg list, 3th is modifier
;; such as '('void' 'foo' 'int a, int b' 'const' )"
;;   (interactive)
;;   (save-excursion
;;     (let (string list rettype func argument (modifier "")
;;                  start end)

;;       (beginning-of-line)
;;       (setq end (progn (c-end-of-statement) (point)))
;;       (setq start (progn (c-beginning-of-statement-1) (point)))

;;       (when (search-forward  "(" end t)
;;         (setq string (buffer-substring-no-properties start (1- (point))))
;;         (setq start (point))
;;         (when (search-forward ")" end t)
;;           (setq argument (buffer-substring-no-properties start (1- (point))))
;;           (setq modifier (buffer-substring-no-properties (point) (1- end)))
;;           (setq list (split-string string))
;;           (setq func (elt list (1- (length list))))
;;           (if (> (length list) 2)
;;               (setq rettype (elt list 1))
;;             (if (= (length list) 1)
;;               ;;no rettype, construction or destruction 
;;                 (setq rettype "")
;;               (setq rettype (car list))))
;;           (setq list (list rettype func argument modifier)))))))



;; (defun cpp-insert-new-method ()
;;   "Insert a c++ member function definition into the corresponding c++ source file.
;; try to find the definition if exists"
;;   (interactive)
;;   (let (insertstr (classname (cpp-current-scope))
;;         (phototype (cpp-current-function)))
;;     (if (or (null classname) (null phototype))
;;         (message "Cann't insert cpp member function!")
;;       (ff-find-related-file)
;;       (setq insertstr (concat
;;           (elt phototype 0)
;;           (unless (string= "" (elt phototype 0)) " ")
;;           classname
;;           (elt phototype 1) "(" (elt phototype 2) ")"
;;           (elt phototype 3)))
      
;;       (beginning-of-buffer)
;;       (unless (search-forward insertstr (point-max) t)
;;         (end-of-buffer)
;;         (insert "/n/n")
;;         (end-of-buffer)

;;         (insert insertstr)
;;         (insert "/n{/n")

;;         (c-indent-defun)
;;         (insert "}/n")
;;         (backward-char 3)
;;         (insert "/n")
;;         (c-indent-line-or-region)))))

;; (global-set-key (kbd "C-c i") 'cpp-insert-new-method)
;; ;;(global-set-key (kbd "C-M-x") 'kill-buffer-and-window);;关闭buffer快捷建

;;=============================================================================

;;=============================================================================

(require 'member-function)

;;expand member functions automatically when entering a cpp file
(defun c-file-enter ()
  "Expands all member functions in the corresponding .h file"
  (let* ((c-file (buffer-file-name (current-buffer)))
         (h-file-list (list (concat (substring c-file 0 -3 ) "h")
                            (concat (substring c-file 0 -3 ) "hpp")
                            (concat (substring c-file 0 -1 ) "h")
                            (concat (substring c-file 0 -1 ) "hpp"))))
    (if (or (equal (substring c-file -2 ) ".c")
            (equal (substring c-file -4 ) ".cpp"))
        (mapcar (lambda (h-file)
                  (if (file-exists-p h-file)
                      (expand-member-functions h-file c-file)))
                h-file-list))))

;(add-hook 'c++-mode-hook c-file-enter)
(global-set-key (kbd "C-c i") 'expand-member-functions)
;;=============================================================================

(defun my-ac-config ()  
  (setq ac-clang-flags  
        (mapcar(lambda (item)(concat "-I" item))  
               (split-string  
                "  
 /usr/include/c++/4.4  
 /usr/include/c++/4.4/i486-linux-gnu  
 /usr/include/c++/4.4/backward  
 /usr/local/include  
 /usr/lib/gcc/i486-linux-gnu/4.4.5/include  
 /usr/lib/gcc/i486-linux-gnu/4.4.5/include-fixed  
 /usr/include/i486-linux-gnu  
 /usr/include  
X")))  
  (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))  
  (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)  
  ;; (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)  
  (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)  
  (add-hook 'css-mode-hook 'ac-css-mode-setup)  
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)  
  (global-auto-complete-mode t))  
(defun my-ac-cc-mode-setup ()  
  (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))  
(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)  
;; ac-source-gtags  
(my-ac-config)  


;;=============================================================================
;;php
;; (require 'geben)
;; (require 'php-mode)  
;; (add-hook 'php-mode-user-hook 'turn-on-font-lock)
;;=============================================================================

(defun c-lineup-arglist-tabs-only (ignored)
  "Line up argument lists by tabs, not spaces"
  (let* ((anchor (c-langelem-pos c-syntactic-element))
	 (column (c-langelem-2nd-pos c-syntactic-element))
	 (offset (- (1+ column) anchor))
	 (steps (floor offset c-basic-offset)))
    (* (max steps 1)
       c-basic-offset)))

(add-hook 'c-mode-common-hook
          (lambda ()
            ;; Add kernel style
            (c-add-style
             "linux-tabs-only"
             '("linux" (c-offsets-alist
                        (arglist-cont-nonempty
                         c-lineup-gcc-asm-reg
                         c-lineup-arglist-tabs-only))))))

(add-hook 'c-mode-hook
          (lambda ()
            (let ((filename (buffer-file-name)))
              ;; Enable kernel mode for the appropriate files
              (when (and filename
                         (string-match (expand-file-name "~/src/linux-trees")
                                       filename))
                (setq indent-tabs-mode t)
                (c-set-style "linux-tabs-only")))))


(require 'cua-rect)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
