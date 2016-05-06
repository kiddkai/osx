(el-get-bundle cider)

(with-eval-after-load 'cider
  (require 'cider)
  (add-to-list 'auto-mode-alist '("\\.clj\\'" . cider-mode))
  (add-to-list 'auto-mode-alist '("\\.cljs\\'" . cider-mode))
  (add-to-list 'auto-mode-alist '("\\.cljc\\'" . cider-mode)))

(provide 'init-clojure)
