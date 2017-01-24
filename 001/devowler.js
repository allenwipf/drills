function vowelequals (arrayWords) {
    var arrayLength = arrayWords.length;
       for (var i = arrayLength -1 ; i >= 0; i--){

            if (voweler(arrayWords[i]) !== "aeiou")    {      
                 arrayWords.splice(i, 1);
             }
        }
    console.log(arrayWords);
    return (arrayWords);
    
}

function voweler(string) {
    var stringArray = string.split("");
    var length = stringArray.length;
 
    for (var i = length -1 ; i >= 0; i--){
       
        if ((stringArray[i] != 'a') && stringArray[i] != 'e' && stringArray[i] != 'i' && stringArray[i] != 'o' && stringArray[i] != 'u')  {
          stringArray.splice(i, 1);
        }
    }
    return (stringArray.join(""));
  
}

 vowelequals (["absconder", "absconders", "absconding", "absconds", "abseil", "abseiled", "abseiling", "abseils", "absence", "absences", "absent", "absented", "absentee", "absenteeism", "absenteeisms", "absentees", "absenter", "absenters", "absenting", "absently", "absentminded", "absentmindedly", "absentmindedness", "absentmindednesses", "absents", "absinth", "absinthe", "absinthes", "absinths", "absolute", "absolutely", "absoluteness", "absolutenesses", "absoluter", "absolutes", "absolutest", "absolution", "absolutions", "absolutism", "absolutisms", "absolutist", "absolutistic", "absolutists", "absolutive", "absolutize", "absolutized", "absolutizes", "absolutizing", "absolve", "absolved", "absolver", "absolvers", "absolves", "absolving", "absonant", "absorb", "absorbabilities", "absorbability", "absorbable", "absorbance", "absorbances", "absorbancies", "absorbancy", "absorbant", "absorbants", "absorbed", "absorbencies", "absorbency", "absorbent", "absorbents", "absorber", "absorbers", "absorbing", "absorbingly", "absorbs", "absorptance", "absorptances", "absorption", "absorptions", "absorptive", "absorptivities", "absorptivity", "absquatulate", "absquatulated", "absquatulates", "absquatulating", "abstain", "abstained", "abstainer", "abstainers", "abstaining", "abstains", "abstemious", "abstemiously", "abstemiousness", "abstemiousnesses", "abstention", "abstentions", "abstentious", "absterge"])