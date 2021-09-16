;; # misc modes # 
(icomplete-mode)
(show-paren-mode)

;; # custom # 
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ido-mode (quote both) nil (ido))
 '(package-selected-packages (quote (omnisharp magit evil)))
 '(python-shell-interpreter "python3")
 '(tool-bar-mode nil))

;; # recent files #
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; # package management #
(require 'package)
;; add melpa (3rd party user-contributed) package repository
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; # evil mode #
(package-install 'evil)
(evil-mode 1)

;; # csharp mode & omnisharp #
(package-install 'omnisharp)

;; # set theme # 
(load-theme 'misterioso t)

;; # set fonts # 
;; [UBUNTU]
(if (eq system-type 'gnu/linux)
    (custom-set-faces))
;; [WINDOWS]
(if (eq system-type 'windows-nt)
    (custom-set-faces
     '(default ((t (:family "Consolas" :foundry "outline" :slant normal :weight normal :height 98 :width normal))))))

;; # set window size # 
;; [UBUNTU]
;; note: can also at command line use: GNU Emacs 24 -> -geometry 150x50
(if (eq system-type 'gnu/linux)
    (if (window-system)
	(set-frame-size (selected-frame) 250 100)))
;; [WINDOWS]
(if (eq system-type 'windows-nt)
  (w32-send-sys-command #xf030)
  (add-hook 'window-setup-hook (lambda () (tool-bar-mode -1)))
)

;; # mouse copy/paste #
;; [WINDOWS]
(if (eq system-type 'windows-nt)
  (setq select-active-regions nil)
  (setq mouse-drag-copy-region t)
  (global-set-key [mouse-2] 'mouse-yank-at-click))

;; # org mode #
;; code syntax highlighting
(setq org-src-fontify-natively t)
;; run code support
(org-babel-do-load-languages
    'org-babel-load-languages '((python . t)))
;; enable org tempo structure templates (e.g. wrap code blocks via `<s TAB`)
(require 'org-tempo)

;; # stackoverflow #
(require 'webjump)
(setq webjump-sites
   (append '(("stackoverflow" . "www.stackoverflow.com/"))
      webjump-sample-sites))

;; # backup file #
(setq make-backup-files nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
