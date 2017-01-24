def vowelequals (arrayWords)

	x = arrayWords.length - 1

	while x >=0
		if (voweler(arrayWords[x]) != "aeiou")
			then arrayWords.delete_at(x)
		end

	x=x-1
    end

	print arrayWords
	return (arrayWords)
end





def voweler(string)

stringArray = string.split("")
x = stringArray.length - 1
 

  while x >= 0

	if stringArray[x] != "a" && stringArray[x] != "e" && stringArray[x] != "i" && stringArray[x] != "o" && stringArray[x] != "u"
    then stringArray.delete_at(x)
    
	end

  x=x-1
  end


#print stringArray.join("")
return (stringArray.join(""))

end

#voweler("atestforthis")

vowelequals (["absconder", "absconders", "absconding", "absconds", "abseil", "abseiled", "abseiling", "abseils", "absence", "absences", "absent", "absented", "absentee", "absenteeism", "absenteeisms", "absentees", "absenter", "absenters", "absenting", "absently", "absentminded", "absentmindedly", "absentmindedness", "absentmindednesses", "absents", "absinth", "absinthe", "absinthes", "absinths", "absolute", "absolutely", "absoluteness", "absolutenesses", "absoluter", "absolutes", "absolutest", "absolution", "absolutions", "absolutism", "absolutisms", "absolutist", "absolutistic", "absolutists", "absolutive", "absolutize", "absolutized", "absolutizes", "absolutizing", "absolve", "absolved", "absolver", "absolvers", "absolves", "absolving", "absonant", "absorb", "absorbabilities", "absorbability", "absorbable", "absorbance", "absorbances", "absorbancies", "absorbancy", "absorbant", "absorbants", "absorbed", "absorbencies", "absorbency", "absorbent", "absorbents", "absorber", "absorbers", "absorbing", "absorbingly", "absorbs", "absorptance", "absorptances", "absorption", "absorptions", "absorptive", "absorptivities", "absorptivity", "absquatulate", "absquatulated", "absquatulates", "absquatulating", "abstain", "abstained", "abstainer", "abstainers", "abstaining", "abstains", "abstemious", "abstemiously", "abstemiousness", "abstemiousnesses", "abstention", "abstentions", "abstentious", "absterge"])
