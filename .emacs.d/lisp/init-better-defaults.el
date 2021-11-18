(setq ring-bell-function 'ignore)
;;去掉emacs的备份文件机制
(setq-default make-backup-files nil)
(setq auto-save-default nil) 
;;显示行号
(global-linum-mode t)

;;定义缩写
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("zt" "zhaotong")
					    ))

;;打开最近的文件
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)


;;selection mode
(delete-selection-mode t)

;;激活括号显示
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;;每次配置文件改动，emacs自动加载进入
(global-auto-revert-mode t)



(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer ()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indented selected region."))
      (progn
	(indent-buffer) (message "Indented buffer.")))))

(provide 'init-better-defaults)
