(add-to-list  'load-path "~/.emacs.d/lisp")
(require 'init-packages)






(setq ring-bell-function 'ignore)

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


;;设置光标为bar,setq 只改变当前buffer的变量。setq-default
(setq-default cursor-type 'bar)
;;去掉emacs的备份文件机制
(setq-default make-backup-files nil)
(setq auto-save-default nil) 

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




;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)


;;绑定查找快捷键
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)


;;org-mode 配置
(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)

;;每次配置文件改动，emacs自动加载进入
(global-auto-revert-mode t)

;;配置popwin 插件



;;定义缩写
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("zt" "zhaotong")
					    ))
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
