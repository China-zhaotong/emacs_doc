;;设置org mode 模式下的文字显示效果
(require 'org)
(setq org-src-fontify-natively t)


;;org-mode 配置
(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)

(provide 'init-org)
