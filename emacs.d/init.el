(add-to-list 'load-path "~/.emacs.d/el-get")
(add-to-list 'load-path "~/.emacs.d/lisp")

(defconst *is-a-mac* (eq system-type 'darwin))
(setq inhibit-startup-message t)

(unless (require 'el-get nil 'noerror)
  (require 'package)
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.org/packages/"))
  (package-refresh-contents)
  (package-initialize)
  (package-install 'el-get)
  (require 'el-get))

(add-to-list 'el-get-recipe-path "~/.emacs.d/recipes")

(package-initialize)

;;; basic

(require 'init-theme)
(require 'init-helm)
(require 'init-projectile)
(require 'init-osx-keys)
(require 'init-paredit)
(require 'init-multiple-cursors)
(require 'init-whitespace)
(require 'init-company)
(require 'init-magit)
(require 'init-flycheck)

;;; languages
(require 'init-lua)
(require 'init-yaml)
(require 'init-clojure)
(require 'init-javascript)
(require 'init-markdown)

;;; extra
(require 'init-funfun)
(require 'init-learn)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (company nil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)
