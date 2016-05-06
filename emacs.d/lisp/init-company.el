(el-get-bundle company)

(with-eval-after-load 'company
  (require 'company)
  (add-hook 'after-init-hook 'global-company-mode))

(provide 'init-company)
