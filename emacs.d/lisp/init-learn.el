(el-get-bundle which-key)

(with-eval-after-load 'which-key
  (require 'which-key)
  (which-key-mode 1)
  (which-key-setup-side-window-right))

(provide 'init-learn)
