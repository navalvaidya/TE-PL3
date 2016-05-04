(defvar a)
(defvar b)
(defvar c)

(write-line "Enter a two digit number(use #b for binary) :")

	(setf a(read))
	(setf b(read))

	(sb-thread:make-thread(lambda()(progn(sleep 0)
		(setf c(+ a b))
		(print "Addition in decimal format is :")
		(format t " ~b" c)
		(print "Addition in decimal format is :")
		(print c))))

	(sb-thread:make-thread(lambda()(progn(sleep 0)
		(setf c(- a b))
		(print "Subtraction in decimal format is :")
		(format t " ~b" c)
		(print "Subtraction in decimal format is :")
		(print c))))

	(sb-thread:make-thread(lambda()(progn (sleep 0)
		(print "Sin of number is :")
		(setf c(sin a))
		(print c))))

(exit)
