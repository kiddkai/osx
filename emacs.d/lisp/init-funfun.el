(el-get-bundle nyan-mode)

(with-eval-after-load 'nyan-mode
  (require 'nyan-mode)
  (setq nyan-animate-nyancat t)
  (nyan-mode 1))

(provide 'init-funfun)
