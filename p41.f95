module funkcja_korzysta_z_procedury
	implicit none
	public:: module_function, module_subroutine
	type, public:: new
		integer:: j, k ! typ wlasny "new" sklada sie z dwoch liczb calkowitych 
	end type new
	
	! initialize x with constructor: 
	type(new), public:: x = new(1234, 5678)
	
	! przypisanie wartosci zmiennej "x" typu wlasnego "new"  
    ! PUBLIC - zmienne z tym atrybutem sa dostepne w zakresie bloku przywolujacego modul 
    ! PRIVATE -zmienne z tym atrybutem sa dostepne tylko wewnatrz modulu, ktory je definiuje 
    ! subprogram part 
	contains
	function module_function() result(module_function_r)
		type(new):: module_function_r  ! wartosc zwracana przez funkcje to 2 liczby INTEGER 
		
		call internal_subroutine(module_function_r)
		return
		
		contains
		subroutine internal_subroutine(u)   ! internal subprogram
			type(new), intent(out):: u
			
			u = new(22, 11)
			call module_subroutine(u % j, u % k)
			return
		end subroutine internal_subroutine
	end function module_function
	
	subroutine module_subroutine(i1, i2) ! module subprogram
		integer, intent(in out):: i1, i2
		integer:: x
		
		x = i1
		i1 = i2
		i2 = x    ! swap - zamiana pierwszego elementu z drugim w zmiennej typu wlasnego "new"
		return
	end subroutine module_subroutine
end module funkcja_korzysta_z_procedury

program p41       ! module, module subprograms, and internal subprograms 
	use funkcja_korzysta_z_procedury
	implicit none
	integer, parameter:: value = 789    ! tej wartosci nie mozna juz zmieniac, jest ustalonym parametrem 
	type(new):: exter
	integer:: inter
	
	exter = module_function()
	print*, "exter =", exter
	inter = internal_function()
	print*, "inter =", inter
	
	contains       ! start function "internal_function" 
	function internal_function() result(internal_function_r)
		integer:: internal_function_r
		
		internal_function_r = value
		!  to jest funkcja wewnetrzna programu, zwraca wynik nie przez swoja nazwe "internal_function" 
        ! ale przez zmienna "internal_function_r", ktora jest parametrem "RESULT" 
	end function internal_function
end program p41