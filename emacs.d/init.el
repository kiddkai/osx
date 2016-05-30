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
(add-hook 'clojure-mode-hook #'smartparens-strict-mode)
(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook #'my-clojure-mode-hook)

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
    ("e24679edfdea016519c0e2d4a5e57157a11f928b7ef4361d00c23a7fe54b8e01" "db9feb330fd7cb170b01b8c3c6ecdc5179fc321f1a4824da6c53609b033b2810" "e2e4e109357cfcebccb17961950da6b84f72187ade0920a4494013489df648fe" "bf81a86f9cfa079a7bb9841bc6ecf9a2e8999b85e4ae1a4d0138975921315713" "d43120398682953ef18fd7e11e69c94e44d39bb2ab450c4e64815311542acbff" "cdfb22711f64d0e665f40b2607879fcf2607764b2b70d672ddaa26d2da13049f" default)))
 '(package-selected-packages
   (quote
    (base16-theme js2-mode rainbow-delimiters smartparens clj-refactor cider clojure-mode lua-mode hydra flycheck helm-projectile projectile magit helm use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
