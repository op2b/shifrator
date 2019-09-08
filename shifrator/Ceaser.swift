
class Caesar{
    
    private var offset:Int?
    
    private let alphabet = [0:"й",1:"ц",2:"у",3:"к",4:"е",5:"н",6:"г",7:"ш",8:"щ",9:"з"
        ,10:"х",11:"ъ",12:"ф",13:"ы",14:"в",15:"а",16:"п",17:"р",18:"о"
        ,19:"л",20:"д",21:"ж",22:"э",23:"ё",24:"я",25:"ч",26:"с",27:"м",28:"и"
        ,29:"т",30:"ь",31:"б",32:"ю"]
    
    init(delta_arg:Int) {
        
        if delta_arg >= -37 && delta_arg <= 36 {
            self.delta = delta_arg
        } else {
            print("Ceaser dont want it")
            self.delta = 0
        }
        
    }
    
    var delta:Int{
        get{
            return offset ?? 1
        }
        
        set{
            self.offset = newValue
        }
    }
    
    func encode(message:String) -> String {
        var encoded_message:String = ""
        
        for char in message {
            for (key,val) in alphabet{
                
                var calculated_offset = key + offset!
                
                if calculated_offset < 0{
                    calculated_offset += alphabet.count
                }
                
                if String(char) == val {
                    var ofst = key + offset!
                    
                    if ofst < 0{
                        ofst += alphabet.count
                    }else{
                        if ofst > (alphabet.count - 1){
                            ofst = ofst - alphabet.count
                        }
                    }
                    encoded_message.append(alphabet[ofst]!)
                }
            }
        }
        
        return encoded_message
    }
    
    func decode(message:String) -> String {
        offset = -offset!
        return encode(message:message)
    }
    
}

