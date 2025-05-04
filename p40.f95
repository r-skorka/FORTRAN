module moje_procedury_i_funkcje
	implicit none
	public:: input, temp_c, output
	contains
		subroutine input(f_temp)
			real, intent(out):: f_temp
			
			write(unit=*, fmt=*) "please enter the Fahrenheit temperature: "
			read(unit=*, fmt=*) f_temp
			return
		end subroutine input
		
		function temp_c(f_temp) result(temp_c_r)
		! wynik dzialania funkcji nie jest zwracany przez jej nazwe "Temp_C", ale przez parametr "temp_c_r"
			real, intent(in):: f_temp ; real:: temp_c_r
			real, parameter:: t_scale =  1.8, offset = 32.0
			! wartosci zadeklarowanych jako PARAMETER nie mozna juz zmieniac, zmiana implikuje ERROR
			
			temp_c_r = (f_temp - offset) / t_scale
			! konwersja temperatury w stopniach Fahrenheit'a (USA) na temperature w skali Celsjusza (EU) 
			return
		end function temp_c
		
		subroutine output(f_temp, temp_c_r)
			real, intent(in):: f_temp, temp_c_r
			
			write(unit=*, fmt=*) f_temp, "degrees Fahrenheit", temp_c_r, "degrees Celsius"
			write(unit=*, fmt=*) int(f_temp), "degrees Fahrenheit", int(temp_c_r), "degrees Celsius"
			! funkcja wbudowana "INT" konwertuje liczbe REAL na INTEGER - obcina czesc ulamkowa 
			write(unit=*, fmt=*) nint(f_temp), "degrees Fahrenheit", nint(temp_c_r), "degrees Celsius"
			! funkcja wbudowana "NINT" (Nearest INTeger) konwertuje liczbe REAL na INTEGER przez 
            ! zaokraglenie do najblizszej liczby INTEGER, sprobuj np. z temperatura 78 stopni Fahrenheita 
			return
		end subroutine output
end module moje_procedury_i_funkcje

program p40
	use moje_procedury_i_funkcje
	implicit none
	real:: fahr
	
	call input(fahr) !wywolanie procedury "Input", jej definicja jest udostepniona przez "USE nazwa modulu"
	call output(fahr, temp_c(fahr))
	! wywolanie procedury "Output", drugim argumentem aktualnym  jest wartosc zwracana przez funkcje 
	! "Temp_C" - parametrami procedur moga byc funkcje !!! 
	stop
end program p40