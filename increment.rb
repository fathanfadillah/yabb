class IntegerArrayIncrementer
    def increment(input)
        key = input.length - 1 
        loop do 
            break if key < 0
            input[key] += 1
            if input[key] > 9 then
                input[key] = 0
                if input[key-1] <= 0 && key == 0 then
                    input.unshift(1)  
                end 
            else  
                key = 0             
            end
            key -= 1
        end 
        # if input.length == 1 then #1digit
        #     if input[0] >= 0 and input[0] < 9 then
        #         input[-1] = input[-1] + 1
            
        #     elsif input[0] == 9 then
        #         input.unshift(1)
        #         input[1] = 0             
        #     end

        # elsif input.length == 2 then #2digit
        #     if input[-1] >= 0 and input[-1] < 9 then
        #         input[-1] = input[-1] + 1
            
        #     elsif input[-1] == 9 then
        #         input[0] = input[0] + 1
        #         input[-1] = 0
        #         if input[-2] >= 10 then
        #             input.unshift(1)
        #             input[1] = 0
        #         end               
        #     end

        # elsif input.length == 3 then #3digit
        #     if input[-1] >= 0 and input[-1] < 9 then
        #         input[-1] = input[-1] + 1
            
        #     elsif input[-1] == 9 then
        #         input[-1] = 0
        #         input[-2] = input[-2] + 1
        #         if input[0] >= 10 then
        #             input.unshift(1)
        #             input[1] = 0
        #         end               
        #     end
        # end 

        input 
    end 
end