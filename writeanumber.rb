def numberInFull number
	if number < 0
		return 'Please only positive numbers'
	end
	if number == 0
		return 'zero'
	end

	numFull = ''

	unity = %w[um dois três quatro cinco seis sete oito nove]
	dozens = %w[dez vinte trinta quarenta cinquenta sessenta setenta oitenta noventa]
	hundred = %w[cem duzentos trezentos quatrocentos quinhentos seiscentos setecentos
							oitocentos novecentos]
	thousand = ' mil '

	exception = %w[onze doze treze quatorze quinze dezesseis dezessete dezoito
					dezenove]

	lack = number
	writing = lack / 1000000
	lack -= writing * 1000000

	if writing.to_i > 0
		if writing.to_i == 1
			numFull = numFull + unity[writing - 1] + ' milhão'
		else
			numFull = numFull + unity[writing - 1] + ' milhões'
		end
	end

	if lack > 0
		writing = lack / 100000 
		lack -= writing * 100000
		if writing.to_i > 0
			if writing == 1 and lack > 0
				numFull = numFull + ' e '
				numFull = numFull + ' cento'
			elsif writing > 1
				numFull = numFull + ' e ' 
				numFull = numFull + hundred[writing - 1]
			else
				numFull = numFull + ' e '
				numFull = numFull + hundred[0]
			end
		end

		if lack > 0
			writing = lack / 10000
			lack -= writing * 10000
			if writing.to_i > 0 
				if (writing == 1 and lack.to_i > 0)
					lack = lack / 1000
					numFull = numFull + ' e '
					numFull = numFull + exception[lack -1]
					lack = 0
				else
					numFull = numFull + ' e '
					numFull = numFull + dozens[writing - 1]
				end
			end
		end

		if lack > 0
			writing = lack / 1000
			lack -= writing * 1000
			if writing.to_i > 0
				numFull = numFull + ' e '
				numFull = numFull + unity[writing - 1]
			end
		end
		numFull = numFull + thousand
	end

	if lack > 0
		writing = lack / 100
		lack -= writing * 100
		if writing.to_i > 0
			if writing == 1 and lack > 0
			numFull = numFull + 'cento'
			elsif writing > 1 
				numFull = numFull + hundred[writing - 1]
			else
				numFull = numFull + 'e '
				numFull = numFull + hundred[0]
			end
		end
	end

	if lack > 0
		writing = lack / 10
		lack -= writing * 10
		if writing.to_i > 0
			if writing == 1 and lack > 0
				numFull = numFull + ' e '
				numFull = numFull + exception[lack - 1]
				lack = 0
			else
				numFull = numFull + ' e '
				numFull = numFull + dozens[writing - 1]
			end
		end
	end
	writing = lack 	
	if lack > 0
		numFull = numFull + ' e '
		numFull = numFull + unity[writing - 1]
	end
	numFull
end	

puts numberInFull(rand(9999999))
