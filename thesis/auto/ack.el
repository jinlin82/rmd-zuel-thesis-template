(TeX-add-style-hook
 "ack"
 (lambda ()
   (LaTeX-add-environments
    '("denotation" LaTeX-env-args ["argument"] 0)))
 :latex)

