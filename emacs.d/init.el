;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory
(package-initialize)

(require 'package)

(add-to-list 'package-archives
               '("melpa" . "http://melpa.org/packages/"))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package helm
  :ensure t
  :bind (("C-c h" . helm-command-prefix)
	 ("M-x" . helm-M-x))
  :config
  (require 'helm)
  (require 'helm-config)
  (helm-mode 1))

(use-package projectile
  :config
  (projectile-global-mode))

(use-package helm-projectile
  :config
  (setq projectile-completion-system 'helm)
  (helm-projectile-on))

(use-package magit)
(use-package flycheck
  :config
  (global-flycheck-mode))
(use-package hydra)
(use-package lua-mode)
(use-package clojure-mode)
(use-package smartparens)
(use-package rainbow-delimiters)
(use-package cider)
(use-package js2-mode)
(use-package clj-refactor)

(add-hook 'js-mode-hook #'smartparens-mode)
(add-hook 'clojure-mode-hook #'smartparens-strict-mode)
(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (js2-mode rainbow-delimiters smartparens clj-refactor cider clojure-mode lua-mode hydra flycheck helm-projectile projectile magit helm use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
