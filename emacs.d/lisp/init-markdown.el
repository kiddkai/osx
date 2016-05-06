(el-get-bundle 'markdown-mode)

(with-eval-after-load 'markdown-mode
  (setq markdown-gfm-additional-languages t)
  (setq markdown-gfm-use-electric-backquote t)
  (setq markdown-make-gfm-checkboxes-buttons t)
  (add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode)))

(provide 'init-markdown)
