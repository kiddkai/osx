(el-get-bundle js2-mode)
(el-get-bundle json-mode)
(el-get-bundle web-mode)

(require 'web-mode)
(require 'js2-mode)
(require 'json-mode)

(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))

(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))

(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
    (let ((web-mode-enable-part-face nil))
      ad-do-it)
    ad-do-it))

(provide 'init-javascript)
