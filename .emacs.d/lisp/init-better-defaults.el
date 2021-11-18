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


;;增强show paren-mode
(define-advice show-paren-function(
				   :around (fn) fix-show-paren-function)
  (cond ((looking-at-p "\\s()") (funcall fn))
	(t (save-excursion (ignore-errors (backward-up-list))
			   (funcall fn)))))

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


(setq hippie-expand-try-functions-list '(try-expand-dabbrev
					 try-expand-dabbrev-all-buffers
					 try-expand-dabbrev-from-kill
					 try-complete-file-name-partially
					 try-complete-file-name
					 try-expand-all-abbrevs
					 try-expand-list
					 try-expand-line
					 try-complete-lisp-symbol-partially
					 try-complete-lisp-symbol))


(fset 'yes-or-no-p 'y-or-n-p)
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

(put 'dired-find-alternate-file 'disabled nil)

(require 'dired-x)

(setq dired-dwim-target t)
(provide 'init-better-defaults)
