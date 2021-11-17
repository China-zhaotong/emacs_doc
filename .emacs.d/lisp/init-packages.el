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
			    popwin
			    )
  "Default packages")
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

;;默认当前buff启动company-mode
(global-company-mode t)


;;使用主题
(load-theme 'monokai t)

(require 'js-comint)
(setq js-comint-program-command "c:/Program Files/nodejs/node.exe")
;;使用hungry-delete 插件
(require 'hungry-delete)
(global-hungry-delete-mode)

;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)
;;configfor smex
;;(require 'smex)
;;(smex-initialize)
;;(global-set-key (kbd "M-x") 'smex)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

(setq auto-mode-alist
(append '(("\\.js\\'" . js2-mode)) auto-mode-alist))

(require 'popwin)
(popwin-mode t)

(provide 'init-packages)
