(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)  )

;;and whatever packages you want here
(require 'cl)
(defvar zhaotong/packages '(
			    company
			    monokai-theme
			    hungry-delete
			    swiper
			    counsel
			    smartparens
			    js-comint
			    js2-mode
			    )
  "Default packages")

(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))
(when window-system (set-exec-path-from-shell-PATH))

(setq package-selected-packages zhaotong/packages)
(defun zhaotong/packages-installed-p ()
  (loop for pkg in zhaotong/packages
	when(not (package-installed-p pkg)) do (return nil)
	finally (return t)))
(unless (zhaotong/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg zhaotong/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;;关闭toolbarqqq
(tool-bar-mode -1)
;;关闭滚动条
(scroll-bar-mode -1)

;;关闭自动缩进
;;(electric-indent-mode -1)

;;显示行号
(global-linum-mode t)

;;定义初始化屏幕
(setq inhibit-splash-screen t)

;;定义一个函数，初始化打开配置文件

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;;定义全局按键f2为打开配置文件

(global-set-key (kbd "<f2>" ) 'open-my-init-file)

;;默认当前buff启动company-mode
(global-company-mode t)

;;设置光标为bar,setq 只改变当前buffer的变量。setq-default
(setq-default cursor-type 'bar)

;;去掉emacs的备份文件机制
(setq-default make-backup-files nil)

;;设置org mode 模式下的文字显示效果
(require 'org)
(setq org-src-fontify-natively t)

;;打开最近的文件
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;;selection mode 
(delete-selection-mode t)

;;设置emacs 开启全屏幕
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;;激活括号显示
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;;高亮显示当前选中行
(global-hl-line-mode t)

;;使用主题
(load-theme 'monokai t)


(require 'js-comint)
(setq js-comint-program-command "D:/nodejs/node.exe")

;;使用hungry-delete 插件
(require 'hungry-delete)
(global-hungry-delete-mode)

(require 'smartparens-config)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

(setq auto-mode-alist
(append '(("\\.js\\'" . js2-mode)) auto-mode-alist))

;;configfor smex
;;(require 'smex)
;;(smex-initialize)
;;(global-set-key (kbd "M-x") 'smex)
(ivy-mode)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.08)
 '(company-minimum-prefix-length 1))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-external-variable ((t (:foreground "gray")))))
