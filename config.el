;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Borysevych Oleh"
      user-mail-address "borysevych.oleh87@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-molokai)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq doom-themes-treemacs-theme "doom-colors")
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(setq confirm-kill-emacs nil)

;;---------------------------------------------------------
;; LSP
;;---------------------------------------------------------

(use-package lsp-pyright
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))
(setq lsp-ui-doc-enable nil)
(setq lsp-ui-doc-show-with-mouse nil)
;;---------------------------------------------------------

;;---------------------------------------------------------
;; LaTeX
;;---------------------------------------------------------
(use-package pdf-tools
  :config
  (unless (package-installed-p 'pdf-tools)
    (pdf-tools-install)))

(use-package latex-preview-pane
  :hook
  (LaTeX-mode-hook . latex-preview-pane-mode)
  :bind
  (:map LaTeX-mode-map
        ("C-c v u" . latex-preview-pane-update)
        ("C-c v s" . latex-preview-pane-mode)))
;;---------------------------------------------------------

;;---------------------------------------------------------
;; Org Mode
;;---------------------------------------------------------

(after! org
  (setq org-directoty "~/Documents/Org Mode/")
  (setq org-agenda-files '("~/Documents/Org Mode/agenda.org"))
  (require 'org-bullets)
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  (add-hook 'org-mode-hook (lambda () (org-autolist-mode))))
;;---------------------------------------------------------
