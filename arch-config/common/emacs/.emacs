;;my .emacs

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


;(setq default-directory "C:/WINCE600/PLATFORM/BSP_DP/SRC") 

;; C-SPACE 被输入法占用，C-@ 又太难按，于是把 set mark 绑定到 C-return
(define-key global-map [C-return] 'set-mark-command)

(add-to-list 'load-path "~/.emacs.d/packages/")
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;;; Emacs is not a package manager, and here we load its package manager!
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
  '(psvn lineno maxframe color-theme ecb autopair auto-complete auto-complete-clang member-function yasnippet))
(dolist (p tmtxt/packages)
  (when (not (package-installed-p p))
    (package-install p)))
;;;svn support
(require 'psvn)
;;;emacs color theme
(require 'color-theme)
(color-theme-initialize)
(color-theme-calm-forest)
; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.

(display-time-mode t);显示当前时间
;;禁用启动信息
(setq inhibit-startup-message t)
(show-paren-mode t);显示与当前光标所在位置的括号匹配的另一个括号
(setq visible-bell t);关闭出错时的蜂鸣提示声
;(mouse-avoidance-mode'animate);当鼠标箭头与光标相近时，使鼠标箭头自动移开
(blink-cursor-mode nil);光标不闪烁
;(setq-default cursor-type 'bar);光标显示为一竖线
;(tool-bar-mode -1);; 不显示emcas的工具栏
;(menu-bar-mode -1);; 不显示emcas的菜单栏,按ctrl+鼠标右键仍能调出该菜单
(setq x-select-enable-clipboard t);; 支持emacs和外部程序之间进行粘贴
(fset 'yes-or-no-p 'y-or-n-p);以 'y/n'字样代替原默认的'yes/no'字样
(setq frame-title-format "%b@Studentol's emacs");在最上方的标题栏显示当前buffer的名字
;(setq make-backup-files nil);关闭自动备份功能
;(setq auto-save-mode nil);关闭自动保存模式
;(setq auto-save-default nil);不生成名为#filename# 的临时文件
;(setq require-final-newline t);; 自动的在当前的buffer文件的最后加一个空行
;(global-set-key "\r" 'align-newline-and-indent);;自动缩进变为
;设置默认的列数是110
(setq default-fill-column 110)
;;设置kill-ring-max(我不知道怎么翻译这个词：)为200，以防不测：）
(setq kill-ring-max 200)
;;设置缺省模式是text，而不是基本模式
(setq default-major-mode 'text-mode)
;;设置tab为4个空格的宽度，而不是原来的2
(setq default-tab-width 4)
;;;;;;;;;;;;;;;;;启动时最大化;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)
;下载maxframe.el并放置在中
;http://emacsblog.org/2007/02/22/maximize-on-startup-part-2/
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;web方式显示行号;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(set-scroll-bar-mode 'right);滚动条在右侧
;(set-scroll-bar-mode nil)   ; 不显示滚动条, even in x-window system (recommended)
(require 'linum)
(global-linum-mode 1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;c/c++ mode open
(require 'cc-mode)

(setq-default c-basic-offset 4 c-default-style "linux")
(setq-default tab-width 4 indent-tabs-mode t)
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
(ac-set-trigger-key "")

(require 'auto-complete-clang)
;(define-key c++-mode-map (kbd "C-S-") 'ac-complete-clang)
;; replace C-S- with a key binding that you want

(require 'member-function)
(setq mf--source-file-extension "cpp")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-layout-window-sizes (quote (("leftright2" (ecb-directories-buffer-name 0.13872832369942195 . 0.525) (ecb-sources-buffer-name 0.13872832369942195 . 0.45) (ecb-methods-buffer-name 0.15028901734104047 . 0.525) (ecb-history-buffer-name 0.15028901734104047 . 0.45)))))
 '(ecb-options-version "2.40"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;cscope
(require 'xcscope)
(define-key global-map [(ctrl f3)] 'cscope-set-initial-directory)
(define-key global-map [(ctrl f4)] 'cscope-unset-initial-directory)
;(define-key global-map [(ctrl f5)] 'cscope-prev-file)
;(define-key global-map [(ctrl f6)] 'cscope-find-global-definition)
(define-key global-map [(ctrl f9)]
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


 (global-set-key (kbd "C-M-x") 'kill-buffer-and-window)

(defun qiang-comment-dwim-line (&optional arg)
  "Replacement for the comment-dwim command. If no region is selected and current line is not blank and we are not at the end of the line, then comment current line. Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))
(global-set-key "\M-;" 'qiang-comment-dwim-line) 


;;git-emacs
;(add-to-list 'load-path "/path/to/git-emacs/")
;(require 'git-emacs)
(require 'egg)
