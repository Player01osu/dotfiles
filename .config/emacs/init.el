(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(tango-dark))
 '(font-use-system-font t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq make-backup-files nil)
(setq auto-save-list-file-prefix "~/.config/emacs/autosave/")
(setq auto-save-file-name-transforms '((".*" "~/.config/emacs/autosave/" t)))
(setq inhibit-splash-screen t)
(setq inhibit-startup-screen t)
(turn-on-font-lock)
(setq indent-tabs-mode nil)
(setq tab-width 4)
(setq c-basic-offset 4)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
