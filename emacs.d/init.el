;;; init.el -- initialize the whole emacs

;;; Commentary:
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory

;;; Code:
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

(use-package git-gutter)
(use-package magit)

(use-package flycheck
  :config
  (global-flycheck-mode))

(use-package flyspell
  :config
  (add-hook 'org-mode-hook #'flyspell-mode))

(use-package hydra)
(use-package lua-mode
  :config
  (setq lua-indent-level 2))


(use-package smartparens)
(use-package rainbow-delimiters)
(use-package cider)
(use-package js2-mode)
(use-package aggressive-indent)
(use-package cider)
(use-package clj-refactor)
(use-package clojure-mode)

(defun my-clojure-mode-hook ()
  "Custom clojure mode hook."
  (clj-refactor-mode 1)
  (yas-minor-mode 1)
  (cljr-add-keybindings-with-prefix "C-c C-m"))

(add-hook 'js-mode-hook #'smartparens-mode)
(add-hook 'js-mode-hook #'rainbow-delimiters-mode)
(add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode)
(add-hook 'emacs-lisp-mode-hook #'smartparens-strict-mode)
(add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)
(add-hook 'clojure-mode-hook #'aggressive-indent-mode)
(add-hook 'clojure-mode-hook #'smartparens-strict-mode)
(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook #'my-clojure-mode-hook)
(global-linum-mode t)
(global-git-gutter-mode +1)

(load-theme 'base16-apathy-dark t)

(set-frame-font "Menlo:pixelsize=14")
(add-to-list 'default-frame-alist
	     (cons 'font "Menlo:pixelsize=14"))


(defun cider-figwheel-repl ()
  "Enable figwheel in cider repl."
  (interactive)
  (save-some-buffers)
  (with-current-buffer (cider-current-repl-buffer)
    (goto-char (point-max))
    (insert "(require 'figwheel-sidecar.repl-api)
             (figwheel-sidecar.repl-api/start-figwheel!) ; idempotent
             (figwheel-sidecar.repl-api/cljs-repl)")
    (cider-repl-return)))


(setq inhibit-startup-message t)

(defconst *is-a-mac* (eq system-type 'darwin))



(when *is-a-mac*
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'none)
  (setq default-input-method "MacOSX")
  ;; Make mouse wheel / trackpad scrolling less jerky
  (setq mouse-wheel-scroll-amount '(1
                                    ((shift) . 5)
                                    ((control))))
  (dolist (multiple '("" "double-" "triple-"))
    (dolist (direction '("right" "left"))
      (global-set-key (read-kbd-macro (concat "<" multiple "wheel-" direction ">")) 'ignore)))
  (global-set-key (kbd "M-`") 'ns-next-frame)
  (global-set-key (kbd "M-h") 'ns-do-hide-emacs)
  (global-set-key (kbd "M-˙") 'ns-do-hide-others)
  (global-set-key (kbd "M-ˍ") 'ns-do-hide-others)
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("aa87469691932ff791f966bffb885ecd97ebfa4dc4d42e479f3819ac4a3fbcaf" "8e3f020f1ce69cfa0c1ebee4e198feb28dd7eb31b7d77927e9c790819210c654" "930227e22122d1881db7c2c1ae712dcf715697a1c4d9864f8107a2c3c2da9f8b" "f2503f0a035c2122984e90eb184185769ee665de5864edc19b339856942d2d2d" "91fba9a99f7b64390e1f56319c3dbbaed22de1b9676b3c73d935bf62277b799c" "e254f8e18ba82e55572c5e18f3ac9c2bd6728a7e500f6cc216e0c6f6f8ea7003" "e8e744a1b0726814ac3ab86ad5ccdf658b9ff1c5a63c4dc23841007874044d4a" "16d6e7f87846801e17e0c8abc331cf6fa55bec73185a86a431aca6bec5d28a0a" "1462969067f2ff901993b313085d47e16badeec58b63b9ed67fa660cebaaddae" "1edf370d2840c0bf4c031a044f3f500731b41a3fd96b02e4c257522c7457882e" "e24679edfdea016519c0e2d4a5e57157a11f928b7ef4361d00c23a7fe54b8e01" "db9feb330fd7cb170b01b8c3c6ecdc5179fc321f1a4824da6c53609b033b2810" "e2e4e109357cfcebccb17961950da6b84f72187ade0920a4494013489df648fe" "bf81a86f9cfa079a7bb9841bc6ecf9a2e8999b85e4ae1a4d0138975921315713" "d43120398682953ef18fd7e11e69c94e44d39bb2ab450c4e64815311542acbff" "cdfb22711f64d0e665f40b2607879fcf2607764b2b70d672ddaa26d2da13049f" default)))
 '(package-selected-packages
   (quote
    (aggressive-indent base16-theme js2-mode rainbow-delimiters smartparens clj-refactor cider clojure-mode lua-mode hydra flycheck helm-projectile projectile magit helm use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
