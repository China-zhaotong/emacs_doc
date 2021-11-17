
;;关闭toolbar
(tool-bar-mode -1)
;;关闭滚动条
(scroll-bar-mode -1)
;;定义初始化屏幕
(setq inhibit-splash-screen t)
;;设置光标为bar,setq 只改变当前buffer的变量。setq-default
(setq-default cursor-type 'bar)


;;设置emacs 开启全屏幕
(setq initial-frame-alist (quote ((fullscreen . maximized))))


;;高亮显示当前选中行
(global-hl-line-mode t)


(provide 'init-ui)
