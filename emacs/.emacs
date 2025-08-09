;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(modus-operandi-deuteranopia))
 '(custom-safe-themes
   '("51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773"
     default))
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(package-selected-packages '(gptel solarized-theme))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))

(use-package gptel
	:ensure t)

(setq gptel-api-key (gptel-api-key-from-auth-source))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
