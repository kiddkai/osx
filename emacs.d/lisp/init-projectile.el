(el-get-bundle projectile)

(require 'projectile)
(require 'helm)

(with-eval-after-load 'projectile
  (projectile-global-mode)
  (setq projectile-completion-system 'helm))

(el-get-bundle helm-projectile)

(require 'helm-projectile)

(with-eval-after-load 'helm-projectile
  (helm-projectile-on))

(provide 'init-projectile)
