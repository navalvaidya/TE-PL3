(defvar a)
(defvar b)
(defvar c)
(defvar d)


(write-line "Enter two Numbers(use #b for binary):")

	(setf a(read))
	(setf b(read))
	
	(sb-thread:make-thread(lambda()(progn(sleep 0)
				(setf c(+ a b))
				(print "Addition in Binary Format: ")
				(format t " ~b" c)
				(print "Addition in Decimal Format: ")
				(print c))))



	(sb-thread:make-thread(lambda()(progn(sleep 0)
		(setf c(- a b))
		(print "Subtraction in Binary Format: ")
		(format t " ~b" c)
		(print "Subtraction in Decimal Format: ")
		(print c))))

	(sb-thread:make-thread(lambda()(progn(sleep 0)
		(setf c(* a b))
		(print "Multiplication in binary format")
		(format t " ~b" c)
		(print "Multiplication of two numbers")
		(print c))))

	(sb-thread:make-thread(lambda()(progn(sleep 0)
		(setf c(* a a ))
		(print "Square of first number is:")
		(print c))))

	(sb-thread:make-thread(lambda()(progn(sleep 0)
		(setf c(* b b b ))
		(print "Cube of second number is:")
		(print c))))

	(sb-thread:make-thread(lambda()(progn(sleep 0)
		(setf c(sin a))
		(print "Sine of first number is:")
		(print c))))

	(sb-thread:make-thread(lambda()(progn(sleep 0)
		(setf c(tan a))
		(print "Tan of first number is:")
		(print c))))

	(sb-thread:make-thread(lambda()(progn(sleep 0)
		(setf c(cos a))
		(print "Cosine of first number is:")
		(print c))))

	(sb-thread:make-thread(lambda()(progn(sleep 0)
		(setf c(max a b))
		(print "Maximum from number is:")
		(print c))))

	(sb-thread:make-thread(lambda()(progn(sleep 0)
		(setf c(min a b))
		(print "Minimum from number is:")
		(print c))))

(exit)
