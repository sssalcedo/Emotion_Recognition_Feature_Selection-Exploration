import os
output_path='Speech_Prosody_of_Positive_Emotions/Ouputs/'
file_path='Speech_Prosody_of_Positive_Emotions/Speech_Prosody_of_Positive_Emotions/'
file_list=os.listdir(file_path)
for file in file_list:
    #print(file[1:])
    audio_path=os.path.join('Speech_Prosody_of_Positive_Emotions/Speech_Prosody_of_Positive_Emotions/p'+file[1:]+'/') 
    audio_list=os.listdir(audio_path)
    print(file)
    for audio in audio_list:
        if audio[-4:] =='.wav':
            this_path_input=os.path.join(audio_path,audio)
            this_path_output=os.path.join(output_path,audio[:-4]+'.txt')     
            cmd ="SMILExtract -C config/egemaps/v01b/eGeMAPSv01b.conf -I " + this_path_input + " -O " + this_path_output
            print(this_path_output)
            os.system(cmd)