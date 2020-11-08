(require 'package)
(setq package-archives '(
                         ("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
;; (package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
;; (require 'use-package)
(setq use-package-always-ensure t)

(require 'package)
(setq package-archives '(
                         ("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t)
  (setq doom-themes-enable-italic t)
  (load-theme 'doom-gruvbox t))

(use-package all-the-icons
  :ensure t
  :config
  (when (not (member "all-the-icons" (font-family-list)))
    (all-the-icons-install-fonts t)))

(use-package telephone-line
  :config
  (setq telephone-line-primary-right-separator 'telephone-line-abs-left
        telephone-line-secondary-right-separator 'telephone-line-abs-hollow-left)
  (setq telephone-line-height 24
        telephone-line-evil-use-short-tag t)
  (telephone-line-mode 1))

(use-package evil
  :config
  (evil-mode 1)
  (evil-set-initial-state 'magit-status-mode 'normal)
  (evil-set-initial-state 'help-mode 'normal)
  (evil-set-initial-state 'info-mode 'normal))

(use-package evil-commentary
  :config
  (evil-commentary-mode))

(use-package evil-multiedit
  :config
  (evil-define-key 'normal 'global
    (kbd "C-n") 'evil-multiedit-match-and-next
    (kbd "C-p") 'evil-multiedit-match-and-prev
    (kbd "C-a") 'evil-multiedit-match-all))

(use-package undo-tree
:config
(global-undo-tree-mode 1))

(use-package swiper
:ensure t)

(use-package org
  :hook ((org-mode-hook . (lambda () (add-hook 'after-save-hook #'reload-config))))
  :config
  (setq org-ellipsis " ▾"))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(require 'org-tempo)
(add-to-list 'org-structure-template-alist '("sh" . "src shell"))
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(add-to-list 'org-structure-template-alist '("js" . "src javascipt"))
(add-to-list 'org-structure-template-alist '("py" . "src python"))

(use-package counsel
  :ensure t)

(use-package saveplace
  :config
  (save-place-mode))

(use-package smart-hungry-delete
  :ensure t
  :defer nil
  :config (smart-hungry-delete-add-default-hooks))

(use-package avy
  :config
  (setq avy-keys '(?a ?o ?e ?u ?h ?t ?n ?s))
  (setq avy-background t)
  (setq avy-highlight-first t)
  (setq avy-orders-alist
        '((avy-goto-line . avy-order-closest)
          (avy-goto-word-0 . avy-order-closest))))

(use-package general
  :ensure t
  :config
  (general-override-mode 1))

(use-package which-key
:ensure t
:config
(setq which-key-idle-delay 0.15)
(setq which-key-popup-type 'minibuffer)
(which-key-mode))

(use-package ivy
  :ensure t
  :config
  (ivy-mode)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t))

(use-package all-the-icons-ivy
  :ensure t
  :config
  (all-the-icons-ivy-setup))

(use-package ivy-posframe
  :ensure t
  :init
  (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-top-center)))
  (setq ivy-posframe-parameters
      '((left-fringe . 8)
        (right-fringe . 8)))
  :config
  (ivy-posframe-mode))

(evil-define-motion evil-next-line (count)
  "Move the cursor COUNT lines down."
  :type line
  (let (line-move-visual)
    (evil-line-move (or count 1)))
  (recenter))

(evil-define-motion evil-previous-line (count)
  "Move the cursor COUNT lines up."
  :type line
  (let (line-move-visual)
    (evil-line-move (- (or count 1))))
  (recenter))

(evil-define-motion evil-next-visual-line (count)
  "Move the cursor COUNT screen lines down."
  :type exclusive
  (let ((line-move-visual t))
    (evil-line-move (or count 1)))
  (recenter))

(evil-define-motion evil-previous-visual-line (count)
  "Move the cursor COUNT screen lines up."
  :type exclusive
  (let ((line-move-visual t))
    (evil-line-move (- (or count 1))))
  (recenter))

(defun my/avy-goto-word-1 (char &optional arg beg end symbol)
  (interactive (list (read-char "char: " t)
                     current-prefix-arg))
  (avy-with avy-goto-word-1
    (let* ((str (string char))
           (regex (cond ((string= str ".")
                         "\\.")
                        ((and avy-word-punc-regexp
                              (string-match avy-word-punc-regexp str))
                         (regexp-quote str))
                        ((<= char 26)
                         str)
                        (t
                         (concat
                          (if symbol "\\_<" "\\b")
                          str)))))
      (avy-jump regex
                :window-flip arg
                :beg beg
                :end end)))
                (recenter))

(defun my/avy-goto-line ()
  (interactive)
  (avy-goto-line)
  (recenter))

(defun my/evil-multiedit-next-match ()
  (interactive)
  (evil-multiedit-match-and-next)
  (evil-multiedit-next)
  (recenter))

(defun my/evil-multiedit-prev-match ()
  (interactive)
  (evil-multiedit-match-and-prev)
  (evil-multiedit-prev)
  (recenter))

(defun my/evil-multiedit-next ()
  (interactive)
  (evil-multiedit-next)
  (recenter))

(defun my/evil-multiedit-prev ()
  (interactive)
  (evil-multiedit-prev)
  (recenter))

(defun my/reload-config ()
  (interactive)
  (org-babel-load-file (expand-file-name "~/dotfiles/emacs/init.org")))

(defun my/indent ()
  (interactive)
  (setq-local indent-tabs-mode nil)
  (setq-local c-basic-offset  2)
  (setq-local coffee-tab-width  2)
  (setq-local javascript-indent-level  2)
  (setq-local js-indent-level  2)
  (setq-local js2-basic-offset  2)
  (setq-local web-mode-markup-indent-offset  2)
  (setq-local web-mode-css-indent-offset  2)
  (setq-local web-mode-code-indent-offset  2)
  (setq-local css-indent-offset 2))

(defun my/backward-delete-word (arg)
  (interactive "p")
  (delete-region (point) (progn (backward-word arg) (point))))

(defun my/new-line-in-paris ()
  (interactive)
  (let ((break-open-pair (or (and (looking-back "{") (looking-at "}"))
                             (and (looking-back ">") (looking-at "<"))
                             (and (looking-back "(") (looking-at ")"))
                             (and (looking-back "\\[") (looking-at "\\]")))))
    (newline)
    (when break-open-pair
      (save-excursion
        (newline)
        (indent-for-tab-command)))
    (indent-for-tab-command)))

(defun my/split-right ()
  (interactive)
  (split-window-horizontally))
;;  (other-window 1 nil))

(defun my/split-left ()
  (interactive)
  (split-window-right))
;;  (other-window 1 nil))

(defun my/split-up ()
  (interactive)
  (split-window-vertically)
  (other-window 1 nil))

(defun my/split-down ()
  (interactive)
  (split-window-below)
  (other-window 1 nil))

(defun my/org-force-open-current-window ()
  (interactive)
  (let ((org-link-frame-setup (quote
                               ((vm . vm-visit-folder)
                                (vm-imap . vm-visit-imap-folder)
                                (gnus . gnus)
                                (file . find-file)
                                (wl . wl)))
                              ))
    (org-open-at-point)))

(defun org-open-maybe (&optional arg)
  (interactive "P")
  (if arg
      (org-open-at-point)
    (org-force-open-current-window)))

(load "~/dotfiles/emacs/testing.el")

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "<C-backspace>") 'my/backward-delete-word)

(general-def 'normal
 "C-s" 'save-buffer
 "C-w" 'delete-window
 ":" 'execute-extended-command
 "<M-left>" 'evil-window-left
 "<M-down>" 'evil-window-down
 "<M-up>" 'evil-window-up
 "<M-right>" 'evil-window-right
 "gd" 'lsp-find-implementation
 "u" 'undo-tree-undo
 "C-r" 'undo-tree-redo
 "n" 'evil-search-previous
 "N" 'evil-search-next
 "C-l" 'my/avy-goto-line
 "C-f" 'my/avy-goto-word-1
 "C-M-r" 'my/reload-config
 "/" 'swiper
 "M-t" 'vterm
 )

(general-def 'insert
 "<backspace>" 'smart-hungry-delete-backward-char
 "RET" 'newline-and-indent
 "C-s" 'emmet-expand-line
 "C-SPC" 'yas-expand
 "C-n" 'yas-next-field
 "<up>"'evil-previous-line
 "<down>" 'evil-next-line
 "TAB" 'company-indent-or-complete-common
 "RET" 'my/new-line-in-paris
 )

(general-def evil-multiedit-state-map
 "C-n" 'my/evil-multiedit-next-match
 "C-p" 'my/evil-multiedit-prev-match
 "C-s" 'evil-multiedit-toggle-or-restrict-region
 "n" 'my/evil-multiedit-next
 "N" 'my/evil-multiedit-prev
 "<down>" 'my/evil-multiedit-next
 "<up>" 'my/evil-multiedit-prev
)

;; (general-def 'normal org-mode-map
 ;; "RET" 'org-open-at-point
;; )

(general-def company-active-map
 "<left>" 'left-char
 "<right>" 'right-char
 "<tab>" 'yas-next-field
)

(general-def 'normal
 :prefix "SPC"
 "SPC" 'counsel-fzf
 "s n" 'yas-new-snippet
 "f f" 'find-file
 "h v" 'describe-variable
 "h k" 'describe-key
 "h m" 'describe-mode
 "h f" 'describe-function
 "c d" 'cd
 "c b" 'counsel-ibuffer
 "r f" 'counsel-recentf
 "g s" 'magit-status
 "<up>" 'split-window-below
 "<down>" 'split-window-vertically
 "<left>" 'split-window-right
 "<right>" 'split-window-horizontally
 )

(general-def 'normal org-mode-map
 :prefix "SPC"
 "r l" 'org-roam-insert
 )

(setq inhibit-startup-message t)
(setq show-paren-style 'expression)
(setq enable-recursive-minibuffers t)
(setq org-hide-emphasis-markers t)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq x-select-enable-clipboard t)
(setq x-select-enable-primary t)
(setq echo-keystrokes 0.1)
(setq vc-follow-symlinks t)
(setq scroll-preserve-screen-position 'keep)
(setq display-line-numbers-width-start t)

(blink-cursor-mode 0)
(scroll-bar-mode -1) ; Disable visible scrollbar
(tool-bar-mode -1) ; Disable the toolbar
(tooltip-mode -1) ; Disable tooltips
(set-fringe-mode 10) ; Give some breathing room
(menu-bar-mode -1) ; Disable the menu bar
(set-face-attribute 'default nil :font "Hack" :height 110)
(global-subword-mode 1)
(global-auto-revert-mode t)


;; org title font size
(dolist (face '((org-level-1 . 1.4)
                (org-level-2 . 1.35)
                (org-level-3 . 1.3)
                (org-level-4 . 1.25)
                (org-level-5 . 1.2)
                (org-level-6 . 1.15)
                (org-level-7 . 1.1)
                (org-level-8 . 1.05))))

;; org bulleted list start with a •
(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(add-hook 'text-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook 'company-mode)
(add-hook 'company-mode-hook 'company-box-mode)
(add-hook 'write-file-hooks 'delete-trailing-whitespace)

;; (setq-local emmet-expand-jsx-className? nil)

(add-hook 'rjsx-mode-hook (lambda ()
  (lsp)
  (lsp-ui-doc-mode)
  (lsp-enable-which-key-integration)
  (setq-local lsp-ui-peek-enable)
  (setq-local lsp-enable-folding nil)
  (setq-local lsp-diagnostic-package :none)
  (setq-local lsp-enable-snippet nil)
  (setq-local lsp-enable-completion-at-point nil)
  (setq-local lsp-enable-symbol-highlighting nil)
  (setq-local lsp-signature-auto-activate t)))

(add-hook 'prog-mode-hook
  (lambda ()
    (rainbow-delimiters-mode)
    (display-line-numbers-mode)
    (smartparens-mode)
    (my/indent)))
(add-hook 'before-save-hook 'format-all-buffer)
 (setq byte-compile-warnings '(cl-functions))
