### elisp 语法学习

1.首先初步学习elisp语法。学习网站<https://learnxinyminutes.com/docs/elisp/>   

2.使用emacs切换到*scratch*缓冲区，然后输入elisp代码，将光标移动到行尾，按`C-J`键或者`C-X C-E`执行代码。

 - 加法 `(+ 2 2)`   
 - 多个表达式一起运算`(+ 2 (+ 3 3))`

 - 创建变量`(setq my-name "zhaotong")`
  
 - 插入字符串`(insert "hello" "world")` `(insert "hello,I am" myname)`

 - 创建函数 `(defun hello (name) (insert "Hello" name))` `(hello "zhaotong")`
 - 多个语句一起执行 `(progn
  (switch-to-buffer-other-window "*test*")
  (erase-buffer)
  (hello "you")
  (other-window 1))`
  
 - 或者使用let `(let ((local-name "you"))
  (switch-to-buffer-other-window "*test*")
  (erase-buffer)
  (hello local-name)
  (other-window 1))`

 - 快捷键
   > 那么一些人可能就想知道Emacs为什么要把Ctrl-W, Alt-W, Ctrl-Y作为剪贴、复制、粘贴的快捷键
 - 格式化字符串 `(defun greeting (name)
  (let ((your-name "Bastien"))
    (insert (format "Hello %s!\n\nI am %s."
                    name       ; the argument of the function
                    your-name  ; the let-bound variable "Bastien"
                    ))))`
 - 交互语法 `(read-from-minibuffer "Enter your name: ")`
  
 - 交互语法 `(defun greeting (from-name)
  (let ((your-name (read-from-minibuffer "Enter your name: ")))
    (insert (format "Hello!\n\nI am %s and you are %s."
                    from-name ; the argument of the function
                    your-name ; the let-bound var, entered at prompt
                    ))))
(greeting "Bastien")
`
 - 交互语法`;; Let's complete it by displaying the results in the other window:
(defun greeting (from-name)
  (let ((your-name (read-from-minibuffer "Enter your name: ")))
    (switch-to-buffer-other-window "*test*")
    (erase-buffer)
    (insert (format "Hello %s!\n\nI am %s." your-name from-name))
    (other-window 1)))(greeting "Bastien")`   
- 创建list `(setq list-of-names '("Sarah" "Chloe" "Mathilde"))` 
- 获取list集合的第一个元素`(car list-of-names)`
- 获取list集合的所有元素除了第一个`(cdr list-of-names)`
- 向list集合插入元素`(push "zhaotong" list-of-names)`,插入的元素位于第一个
- 集合的map操作，对每一个元素使用hello函数`(mapcar 'hello list-of-names)`
- 定义集合操作函数`(defun greeting ()
    (switch-to-buffer-other-window "*test*")
    (erase-buffer)
    (mapcar 'hello list-of-names)
    (other-window 1))`
- 集合元素查找替换`(defun hello-to-bonjour ()
    (switch-to-buffer-other-window "*test*")
    (erase-buffer)
    (mapcar 'hello list-of-names)
    (goto-char (point-min))
    (while (search-forward "Hello" nil t)
      (replace-match "Bonjour"))
    (other-window 1))`

- 加粗`(defun boldify-names ()
    (switch-to-buffer-other-window "*test*")
    (goto-char (point-min))
    (while (re-search-forward "Bonjour \\(.+\\)!" nil t)
      (add-text-properties (match-beginning 1)
                           (match-end 1)
                           (list 'face 'bold)))
    (other-window 1))`