(add-to-list  'load-path "~/.emacs.d/lisp")

;;定义一个函数，初始化打开配置文件

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-keybindings)
(require 'init-org)


(setq custom-file(expand-file-name "lisp/custom.el" user-emacs-directory))

;;自动更新目录下的lisp文件，根据魔法注释;;;### autoloads  来生成autoload
;;(update-directory-autoloads )

(load-file custom-file)
