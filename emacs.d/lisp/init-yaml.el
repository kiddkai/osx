(el-get-bundle yaml-mode)

(with-eval-after-load 'yaml-mode
  (require 'yaml-mode)
  (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode)))

(provide 'init-yaml)
