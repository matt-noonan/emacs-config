;; Many parts stolen shamelessly from https://github.com/patrickt/emacs/blob/master/init.el

(when (window-system)
  (set-frame-font "Fira Code Retina"))

;;; Fira code
;; This works when using emacs --daemon + emacsclient
(add-hook 'after-make-frame-functions (lambda (frame) (set-fontset-font t '(#Xe100 . #Xe16f) "Fira Code Symbol")))
;; This works when using emacs without server/client
(set-fontset-font t '(#Xe100 . #Xe16f) "Fira Code Symbol")
;; I haven't found one statement that makes both of the above situations work, so I use both for now

(defconst fira-code-font-lock-keywords-alist
  (mapcar (lambda (regex-char-pair)
            `(,(car regex-char-pair)
              (0 (prog1 ()
                   (compose-region (match-beginning 1)
                                   (match-end 1)
                                   ;; The first argument to concat is a string containing a literal tab
                                   ,(concat "	" (list (decode-char 'ucs (cadr regex-char-pair)))))))))
          '(("\\(www\\)"                   #Xe100)
            ("[^/]\\(\\*\\*\\)[^/]"        #Xe101)
            ("\\(\\*\\*\\*\\)"             #Xe102)
            ("\\(\\*\\*/\\)"               #Xe103)
            ("\\(\\*>\\)"                  #Xe104)
            ("[^*]\\(\\*/\\)"              #Xe105)
            ("\\(\\\\\\\\\\)"              #Xe106)
            ("\\(\\\\\\\\\\\\\\)"          #Xe107)
            ("\\({-\\)"                    #Xe108)
            ("\\(\\[\\]\\)"                #Xe109)
            ("\\(::\\)"                    #Xe10a)
            ("\\(:::\\)"                   #Xe10b)
            ("[^=]\\(:=\\)"                #Xe10c)
            ("\\(!!\\)"                    #Xe10d)
            ("\\(!=\\)"                    #Xe10e)
            ("\\(!==\\)"                   #Xe10f)
            ("\\(-}\\)"                    #Xe110)
            ("\\(--\\)"                    #Xe111)
            ("\\(---\\)"                   #Xe112)
            ("\\(-->\\)"                   #Xe113)
            ("[^-]\\(->\\)"                #Xe114)
            ("\\(->>\\)"                   #Xe115)
            ("\\(-<\\)"                    #Xe116)
            ("\\(-<<\\)"                   #Xe117)
            ("\\(-~\\)"                    #Xe118)
            ("\\(#{\\)"                    #Xe119)
            ("\\(#\\[\\)"                  #Xe11a)
            ("\\(##\\)"                    #Xe11b)
            ("\\(###\\)"                   #Xe11c)
            ("\\(####\\)"                  #Xe11d)
            ("\\(#(\\)"                    #Xe11e)
            ("\\(#\\?\\)"                  #Xe11f)
            ("\\(#_\\)"                    #Xe120)
            ("\\(#_(\\)"                   #Xe121)
            ("\\(\\.-\\)"                  #Xe122)
            ("\\(\\.=\\)"                  #Xe123)
            ("\\(\\.\\.\\)"                #Xe124)
            ("\\(\\.\\.<\\)"               #Xe125)
            ("\\(\\.\\.\\.\\)"             #Xe126)
            ("\\(\\?=\\)"                  #Xe127)
            ("\\(\\?\\?\\)"                #Xe128)
            ("\\(;;\\)"                    #Xe129)
            ("\\(/\\*\\)"                  #Xe12a)
            ("\\(/\\*\\*\\)"               #Xe12b)
            ("\\(/=\\)"                    #Xe12c)
            ("\\(/==\\)"                   #Xe12d)
            ("\\(/>\\)"                    #Xe12e)
            ("\\(//\\)"                    #Xe12f)
            ("\\(///\\)"                   #Xe130)
            ("\\(&&\\)"                    #Xe131)
            ("\\(||\\)"                    #Xe132)
            ("\\(||=\\)"                   #Xe133)
            ("[^|]\\(|=\\)"                #Xe134)
            ("\\(|>\\)"                    #Xe135)
            ("\\(\\^=\\)"                  #Xe136)
            ("\\(\\$>\\)"                  #Xe137)
            ("\\(\\+\\+\\)"                #Xe138)
            ("\\(\\+\\+\\+\\)"             #Xe139)
            ("\\(\\+>\\)"                  #Xe13a)
            ("\\(=:=\\)"                   #Xe13b)
            ("[^!/]\\(==\\)[^>]"           #Xe13c)
            ("\\(===\\)"                   #Xe13d)
            ("\\(==>\\)"                   #Xe13e)
            ("[^=]\\(=>\\)"                #Xe13f)
            ("\\(=>>\\)"                   #Xe140)
            ("\\(<=\\)"                    #Xe141)
            ("\\(=<<\\)"                   #Xe142)
            ("\\(=/=\\)"                   #Xe143)
            ("\\(>-\\)"                    #Xe144)
            ("\\(>=\\)"                    #Xe145)
            ("\\(>=>\\)"                   #Xe146)
            ("[^-=]\\(>>\\)"               #Xe147)
            ("\\(>>-\\)"                   #Xe148)
            ("\\(>>=\\)"                   #Xe149)
            ("\\(>>>\\)"                   #Xe14a)
            ("\\(<\\*\\)"                  #Xe14b)
            ("\\(<\\*>\\)"                 #Xe14c)
            ("\\(<|\\)"                    #Xe14d)
            ("\\(<|>\\)"                   #Xe14e)
            ("\\(<\\$\\)"                  #Xe14f)
            ("\\(<\\$>\\)"                 #Xe150)
            ("\\(<!--\\)"                  #Xe151)
            ("\\(<-\\)"                    #Xe152)
            ("\\(<--\\)"                   #Xe153)
            ("\\(<->\\)"                   #Xe154)
            ("\\(<\\+\\)"                  #Xe155)
            ("\\(<\\+>\\)"                 #Xe156)
            ("\\(<=\\)"                    #Xe157)
            ("\\(<==\\)"                   #Xe158)
            ("\\(<=>\\)"                   #Xe159)
            ("\\(<=<\\)"                   #Xe15a)
            ("\\(<>\\)"                    #Xe15b)
            ("[^-=]\\(<<\\)"               #Xe15c)
            ("\\(<<-\\)"                   #Xe15d)
            ("\\(<<=\\)"                   #Xe15e)
            ("\\(<<<\\)"                   #Xe15f)
            ("\\(<~\\)"                    #Xe160)
            ("\\(<~~\\)"                   #Xe161)
            ("\\(</\\)"                    #Xe162)
            ("\\(</>\\)"                   #Xe163)
            ("\\(~@\\)"                    #Xe164)
            ("\\(~-\\)"                    #Xe165)
            ("\\(~=\\)"                    #Xe166)
            ("\\(~>\\)"                    #Xe167)
            ("[^<]\\(~~\\)"                #Xe168)
            ("\\(~~>\\)"                   #Xe169)
            ("\\(%%\\)"                    #Xe16a)
           ;; ("\\(x\\)"                   #Xe16b) This ended up being hard to do properly so i'm leaving it out.
            ("[^:=]\\(:\\)[^:=]"           #Xe16c)
            ("[^\\+<>]\\(\\+\\)[^\\+<>]"   #Xe16d)
            ("[^\\*/<>]\\(\\*\\)[^\\*/<>]" #Xe16f))))

(defun add-fira-code-symbol-keywords ()
  (font-lock-add-keywords nil fira-code-font-lock-keywords-alist))

(add-fira-code-symbol-keywords)
(add-hook 'prog-mode-hook #'add-fira-code-symbol-keywords)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(beacon-color "#ec4780")
 '(coq-compiler "/home/mnoonan/.opam/4.05.0/bin/coqc")
 '(coq-prog-name "/home/mnoonan/.opam/4.05.0/bin/coqtop")
 '(custom-enabled-themes (quote (leuven)))
 '(custom-safe-themes
   (quote
    ("70f5a47eb08fe7a4ccb88e2550d377ce085fedce81cf30c56e3077f95a2909f2" "c3e6b52caa77cb09c049d3c973798bc64b5c43cc437d449eacf35b3e776bf85c" "5a0eee1070a4fc64268f008a4c7abfda32d912118e080e18c3c865ef864d1bea" default)))
 '(evil-emacs-state-cursor (quote ("#E57373" hbar)))
 '(evil-insert-state-cursor (quote ("#E57373" bar)))
 '(evil-normal-state-cursor (quote ("#FFEE58" box)))
 '(evil-visual-state-cursor (quote ("#C5E1A5" box)))
 '(helm-mode t)
 '(highlight-indent-guides-auto-enabled nil)
 '(highlight-symbol-colors
   (quote
    ("#FFEE58" "#C5E1A5" "#80DEEA" "#64B5F6" "#E1BEE7" "#FFCC80")))
 '(highlight-symbol-foreground-color "#E0E0E0")
 '(highlight-tail-colors (quote (("#ec4780" . 0) ("#424242" . 100))))
 '(package-selected-packages
   (quote
    (org org-element ob-shell ob-http ob-js ob-restclient all-the-icons guide-key restclient god-mode markdown-mode diminish haskell-snippets duplicate-thing apropospriate-theme powerline git-gutter magit projectile helm-ag exec-path-from-shell yasnippet use-package purescript-mode yaml-mode undo-tree rainbow-delimiters paredit parinfer intero helm haskell-emacs flycheck-haskell)))
 '(pos-tip-background-color "#3a3a3a")
 '(pos-tip-foreground-color "#9E9E9E")
 '(tabbar-background-color "#353535"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;(add-to-list 'load-path "/home/mnoonan/structured-haskell-mode/elisp")
;(require 'shm)
;(setq shm-program-name "/home/mnoonan/.local/bin/structured-haskell-mode")
;(add-hook 'haskell-mode-hook 'structured-haskell-mode)
;(set-face-background 'shm-current-face "#eee8d5")
;(set-face-background 'shm-quarantine-face "lemonchiffon")

(load "~/.emacs.d/lisp/PG/generic/proof-site")


(require 'font-lock)

(defun --copy-face (new-face face)
  "Define NEW-FACE from existing FACE."
  (copy-face face new-face)
  (eval `(defvar ,new-face nil))
  (set new-face new-face))

(--copy-face 'font-lock-label-face  ; labels, case, public, private, proteced, namespace-tags
         'font-lock-keyword-face)
(--copy-face 'font-lock-doc-markup-face ; comment markups such as Javadoc-tags
         'font-lock-doc-face)
(--copy-face 'font-lock-doc-string-face ; comment markups
         'font-lock-comment-face)

(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)


(add-hook 'c++-mode-hook
      '(lambda()
        (font-lock-add-keywords
         nil '(;; complete some fundamental keywords
           ("\\<\\(void\\|unsigned\\|signed\\|char\\|short\\|bool\\|int\\|long\\|float\\|double\\)\\>" . font-lock-keyword-face)
           ;; add the new C++11 keywords
           ("\\<\\(alignof\\|alignas\\|constexpr\\|decltype\\|noexcept\\|nullptr\\|static_assert\\|thread_local\\|override\\|final\\)\\>" . font-lock-keyword-face)
           ("\\<\\(char[0-9]+_t\\)\\>" . font-lock-keyword-face)
           ;; PREPROCESSOR_CONSTANT
           ("\\<[A-Z]+[A-Z_]+\\>" . font-lock-constant-face)
           ;; hexadecimal numbers
           ("\\<0[xX][0-9A-Fa-f]+\\>" . font-lock-constant-face)
           ;; integer/float/scientific numbers
           ("\\<[\\-+]*[0-9]*\\.?[0-9]+\\([ulUL]+\\|[eE][\\-+]?[0-9]+\\)?\\>" . font-lock-constant-face)
           ;; user-types (customize!)
           ("\\<[A-Za-z_]+[A-Za-z_0-9]*_\\(t\\|type\\|ptr\\)\\>" . font-lock-type-face)
           ("\\<\\(xstring\\|xchar\\)\\>" . font-lock-type-face)
           ))
        ) t)

(require 'package)
(add-to-list
 'package-archives
 '("org" . "https://orgmode.org/elpa/"))
(add-to-list
 'package-archives
 '("melpa" . "https://melpa.org/packages/"))
(add-to-list
 'package-archives
 '("melpa-stable" . "http://stable.melpa.org/packages/"))
;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))

(package-initialize)

(let ((my-stack-path (expand-file-name "~/.local/bin")))
  (setenv "PATH" (concat my-stack-path ":" (getenv "PATH")))
  (add-to-list 'exec-path my-stack-path))

(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)

;; Ensure use-package is present. From here on out, all packages are loaded
;; with use-package.

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq
 lexical-binding t
 load-prefer-newer t)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)

(use-package diminish
  :ensure t)

(use-package powerline
  :ensure t
  :disabled
  :init (powerline-default-theme))

(use-package exec-path-from-shell
  :ensure t
  :init
  (exec-path-from-shell-initialize))

(use-package undo-tree
  :defer t
  :ensure t
  :bind (("C-c _" . undo-tree-visualize))
  :init (global-undo-tree-mode +1)
  :diminish undo-tree-mode)

(use-package company
  :ensure t
  :defer t
  :init (global-company-mode 1)
  :bind (("M-/" . company-dabbrev))
  :diminish company-mode
  :config
  ;; It completes a little too aggressively out of the box. Slow down, champ.
  (setq company-minimum-prefix-length 4
        company-idle-delay 0.05
	company-dabbrev-ignore-case nil
	company-dabbrev-downcase nil)
  (define-key company-active-map (kbd "C-n") 'company-select-next))

(use-package yaml-mode
  :defer t
  :ensure t)

(use-package markdown-mode
  :ensure t
  :mode ("\\.md$" . markdown-mode)
  :config
  (remove-hook 'before-save-hook 'delete-trailing-whitespace)
  (unbind-key "M-<left>" markdown-mode-map)
  (unbind-key "M-<right>" markdown-mode-map))

(use-package rainbow-delimiters
  :ensure t
  :config (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package god-mode
  :ensure t
  :bind ("C-c <SPC>" . god-mode-all)
  :config
  (add-hook 'god-mode-enabled-hook 'my-update-cursor)
  (add-hook 'god-mode-disabled-hook 'my-update-cursor))

(defun my-update-cursor ()
  "Use a block cursor if god-mode is on."
  (setq cursor-type (if (or god-local-mode buffer-read-only)
                        'box
                        'bar)))

(use-package restclient
  :ensure t
  :mode ("restclient" . restclient-mode))

(use-package ob-http
  :ensure t)

(use-package helm
  :ensure t
  :diminish helm-mode
  :bind (("C-c ;"   . helm-M-x)
         ("C-c r"   . helm-recentf)
         ("C-c y"   . helm-show-kill-ring)
         ("C-c b"   . helm-mini)
         ("C-s"     . helm-occur)
 	 ("C-x C-f" . helm-find-files)
         ("C-c i"   . helm-imenu)
         ("C-x b"   . helm-mini))
  :config
  (helm-mode t)
  (helm-autoresize-mode t)
  (helm-adaptive-mode t)
  (setq-default helm-M-x-fuzzy-match t))

(use-package helm-ag
  :ensure t
  :defer helm
  :bind (("C-c G" . helm-do-ag-project-root)
	 ("C-c h" . helm-do-ag-project-root))
  :config
  (setq helm-ag-base-command "rg --no-heading -t haskell"
	helm-ag-insert-at-point 'symbol
	helm-ag-fuzzy-match t))

(use-package projectile
  :ensure t
  :bind (("C-c f" . projectile-find-file)
         ("C-x f" . projectile-find-file) ; overwrites set-fill-column
         ("C-c c" . projectile-compile-project))
  :init (projectile-global-mode)
  :config (setq projectile-completion-system 'helm
                projectile-enable-caching t)
  :diminish projectile-mode)

(use-package yasnippet
  :ensure t
  :defer 3
  :diminish yas-minor-mode
  :config
  (yas-global-mode +1)
  (setq yas-prompt-functions '(yas-completing-prompt)))

(use-package magit
  :defer t
  :ensure t
  :bind (("C-c g" . magit-status))
  :init (global-auto-revert-mode t)
  :config (setq-default magit-last-seen-setup-instructions "1.4.0"))

(use-package git-gutter
  :ensure t
  :init (global-git-gutter-mode)
  :config (setq git-gutter:update-interval 1)
  :diminish git-gutter-mode)

(use-package haskell-mode
  :ensure t
  :bind (("C-c a c" . haskell-cabal-visit-file)
	 ("C-c a b" . haskell-mode-stylish-buffer))
  :init
  (defun my-haskell-mode-hook ()
    "Make sure the compile command is right."
    (setq-local compile-command "stack build --fast"))
  (defun my-lithaskell-mode-hook ()
    "Turn off auto-indent for Literate Haskell snippets."
    (setq-local yas-indent-line nil))
  (add-hook 'haskell-mode-hook 'my-haskell-mode-hook)
  (add-hook 'literate-haskell-mode-hook 'my-lithaskell-mode-hook)
  (add-hook 'haskell-mode-hook 'haskell-doc-mode)
  (add-hook 'haskell-mode-hook 'haskell-decl-scan-mode)
  (add-hook 'haskell-mode-hook 'haskell-indentation-mode)
  (add-hook 'haskell-mode-hook 'interactive-haskell-mode)
  :config
  (defalias 'haskell-completing-read-function 'helm--completing-read-default)
  (defalias 'haskell-complete-module-read 'helm--completing-read-default)
  (setq haskell-process-use-ghci t)
  (setq haskell-process-type 'stack-ghci)
  (setq haskell-process-path-ghci "stack")
  (setq haskell-process-args-ghci '("ghci"))
  (setq haskell-process-suggest-remove-import-lines t)
  (setq haskell-process-auto-import-loaded-modules t)
  (setq haskell-process-log nil)
  (setq haskell-stylish-on-save t))


(use-package haskell-snippets
  :defer yasnippet
  :ensure t)

(use-package flycheck
  :ensure t
  :disabled
  :init (global-flycheck-mode)
  :bind ("C-c n" . flycheck-next-error)
  :config
  (setq flycheck-ghc-language-extensions (append
                                          flycheck-ghc-language-extensions
                                          '("TemplateHaskell"
                                          "OverloadedStrings"
                                          "QuasiQuotes"
                                          "FlexibleContexts"
                                          "GeneralizedNewtypeDeriving"
                                          "DeriveGeneric"
                                          "MultiParamTypeClasses"
                                          "FunctionalDependencies"
                                          "FlexibleInstances"
                                          "RecordWildCards"
                                          "ScopedTypeVariables"
                                          "TypeFamilies"
					  "DeriveDataTypeable"))))

(use-package duplicate-thing
  :ensure t
  :bind (("C-c 2" . duplicate-thing)))

(defun em-dash ()
  "Insert an em-dash."
  (interactive)
  (insert "—"))

(defun ellipsis ()
  "Insert an ellipsis."
  (interactive)
  (insert "…"))

;; I do a lot of writing in org-mode, though I have yet to truly take advantage
;; of its enormous power. It steps on a few of my keybindings, so we take care of
;; those with unbind-key.

(use-package org
  :bind (("M--" . em-dash)
         ("M-;" . ellipsis)
         ("C-c w" . wc-goal-mode))
  :config
  (defun my-org-mode-hook ()
    (wc-goal-mode)
    (visual-line-mode)
    (electric-pair-mode nil))
  (unbind-key "C-c ;" org-mode-map)
  (unbind-key "C-,"   org-mode-map)
  (add-hook 'org-mode-hook 'my-org-mode-hook)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((sh . t)
     (python . t)
     (js . t)
     (http . t)))
  (setq org-src-fontify-natively t
	org-confirm-babel-evaluate nil
	org-src-tab-acts-natively t
	org-agenda-files (list "~/Dropbox/todo.org")))

(global-hl-line-mode t)   ; Always highlight the current line.
(show-paren-mode t)       ; And point out matching parentheses.
(delete-selection-mode t) ; Behave like any other sensible text editor would.
(column-number-mode t)    ; Show column information in the modeline.
(display-time-mode t)     ; Show the current time, though I never use this.
(auto-save-mode -1)       ; Don't litter everywhere with backups.
(prettify-symbols-mode)   ; Use unicode symbols where possible.

(defun switch-to-previous-buffer ()
  "Switch to previously open buffer.  Repeated invocations toggle between the two most recently open buffers."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(bind-key "C-c '"  'switch-to-previous-buffer)

(bind-key "M-<up>" 'pop-global-mark)

(defun eol-then-newline ()
  "Go to end of line then return."
  (interactive)
  (move-end-of-line nil)
  (newline)
  (indent-for-tab-command))

(bind-key "C-<return>" 'eol-then-newline)
(bind-key "C-c l" 'goto-line)

(use-package popwin
  :ensure t
  :config (popwin-mode 1)
  (push "*grep*" popwin:special-display-config)
  (push "*xref*" popwin:special-display-config))

(use-package guide-key
  :ensure t
  :init (guide-key-mode +1)
  :config (setq guide-key/guide-key-sequence '("C-c"))
  :diminish guide-key-mode)

(use-package all-the-icons
  :demand
  :init
  (progn (defun -custom-modeline-github-vc ()
           (let ((branch (mapconcat 'concat (cdr (split-string vc-mode "[:-]")) "-")))
             (concat
              (propertize (format " %s" (all-the-icons-octicon "git-branch"))
                          'face `(:height 1 :family ,(all-the-icons-octicon-family))
                          'display '(raise 0))
              (propertize (format " %s" branch)))))

         (defun -custom-modeline-svn-vc ()
           (let ((revision (cadr (split-string vc-mode "-"))))
             (concat
              (propertize (format " %s" (all-the-icons-faicon "cloud"))
                          'face `(:height 1)
                          'display '(raise 0))
              (propertize (format " %s" revision) 'face `(:height 0.9)))))

         (defvar mode-line-my-vc
           '(:propertize
             (:eval (when vc-mode
             (cond
              ((string-match "Git[:-]" vc-mode) (-custom-modeline-github-vc))
              ((string-match "SVN-" vc-mode) (-custom-modeline-svn-vc))
              (t (format "%s" vc-mode)))))
             face mode-line-directory)
           "Formats the current directory.")

         ;; (setcar mode-line-position "")
         )
  :config
  (progn (setq-default mode-line-format
                       (list
                        " "
                        mode-line-mule-info
                        mode-line-modified
                        mode-line-frame-identification
                        mode-line-buffer-identification
                        "  "
                        mode-line-position
                        mode-line-my-vc
                        "   "
                        mode-line-modes))))



(bind-keys ("C-c tl" . (lambda ()
			 (interactive)
			 (load-theme 'leuven)
			 (set-face-background hl-line-face "white smoke")))
	   ("C-c td" . (lambda ()
			 (interactive)
			 (load-theme 'tango-dark)
			 (set-face-background hl-line-face "gray22"))))


(set-face-attribute 'mode-line nil
                    :background "#eee8d5"
                    :foreground "#657b83"
                    :box '(:line-width 2 :color "#eee8d5")
                    :overline nil
                    :underline nil)

(set-face-attribute 'mode-line-inactive nil
                    :background "#fdf6e3"
                    :foreground "#93a1a1"
                    :box '(:line-width 2 :color "#eee8d5")
                    :overline nil
                    :underline nil)

;; window dividers
(window-divider-mode t)
(setq window-divider-default-right-width 2)

(set-face-attribute 'window-divider nil :foreground "#eee8d5")
(set-face-attribute 'window-divider-first-pixel nil :foreground "#eee8d5")
(set-face-attribute 'window-divider-last-pixel nil :foreground "#eee8d5")

(load-theme 'leuven)
(set-face-background hl-line-face "white smoke")

(defconst help/org-special-pre "^\s*#[+]")
(defun help/org-2every-src-block (fn)
  "Visit every Source-Block and evaluate `FN'."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (let ((case-fold-search t))
      (while (re-search-forward "^#[+]BEGIN_SRC" nil t)
	(funcall fn (org-element-at-point))
	))
    (save-buffer)))

(defun org-babel-remove-all-results ()
  "Remove every result block"
  (interactive)
  (help/org-2every-src-block 'org-babel-remove-result))

(eval-after-load "org"
  '(define-key org-mode-map (kbd "C-c C-v k") (lambda () (interactive)
						(help/org-2every-src-block
						 'org-babel-remove-result))))

