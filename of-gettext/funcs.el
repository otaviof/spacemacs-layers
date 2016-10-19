;;
;; Layer: of-gettext
;;  File: funcs.el
;;

(defun po-guess-language ()
  "Return the language related to this PO file."
  (save-excursion
    (goto-char (point-min))
    (re-search-forward po-any-msgstr-block-regexp)
    (goto-char (match-beginning 0))
    (if (re-search-forward
         "\n\"Language: +\\(.+\\)\\\\n\"$"
         (match-end 0) t)
        (po-match-string 1))))

(defadvice po-edit-string (around setup-spell-checking (string type expand-tabs)
                                  activate)
  "Set up spell checking in subedit buffer."
  (let ((po-language (po-guess-language)))
    ad-do-it
    (if po-language
        (progn
          (ispell-change-dictionary po-language)
          (turn-on-flyspell)
          (flyspell-buffer)))))

;; EOF
